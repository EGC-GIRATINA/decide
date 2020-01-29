import django_filters.rest_framework
import os
import os.path
from django.utils import timezone
from rest_framework import status
from django.utils.dateparse import parse_datetime
from rest_framework import generics
from django.shortcuts import render
from django.views.generic import TemplateView
from django.http import HttpResponseRedirect
from rest_framework.response import Response
from django.urls import reverse
from django.core import management
from .models import Vote
from .serializers import VoteSerializer
from base import mods
from base.perms import UserIsStaff
# para añadir la pagina index.html
import random
from ipaddress import IPv4Address
import psycopg2
from django.contrib.auth.decorators import user_passes_test


def home_view(request):
    return render(
        request,
        'home.html',
    )


class StoreView(generics.ListAPIView):
    queryset = Vote.objects.all()
    serializer_class = VoteSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = ('voting_id', 'voter_id',
                     'voted', 'voter_sex',
                     'voter_age', 'voter_ip', 'voter_city')

    def backup(request):
        return render(request, "store/backup/backup.html")

    def get(self, request):
        self.permission_classes = (UserIsStaff, )
        self.check_permissions(request)
        return super().get(request)

    def post(self, request):
        """
         * voting: id
         * voter: id
         * vote: { "a": int, "b": int }
         * change: int
        """

        vid = request.data.get('voting')
        voting = mods.get('voting', params={'id': vid})

        uid = request.data.get('voter')

        if isinstance(vid, str) or isinstance(uid, str):
            return Response({}, status=status.HTTP_400_BAD_REQUEST)

        if not voting or not isinstance(voting, list):
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)
        start_date = voting[0].get('start_date', None)
        end_date = voting[0].get('end_date', None)
        auxpar = parse_datetime(start_date)
        not_started = (not start_date or timezone.now() < auxpar)
        is_closed = end_date and parse_datetime(end_date) < timezone.now()
        if not_started or is_closed:
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)

        vote = request.data.get('vote')

        if not vid or not uid or not vote:
            return Response({}, status=status.HTTP_400_BAD_REQUEST)

        # validating voter
        token = request.auth.key
        voter = mods.post('authentication',
                          entry_point='/getuser/', json={'token': token})
        voter_id = voter.get('id', None)
        if not voter_id or voter_id != uid:
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)

        # the user is in the census
        perms = mods.get('census/{}'.format(vid),
                         params={'voter_id': uid}, response=True)
        if perms.status_code == 401:
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)

        changeV = request.data.get('change')

        if changeV != 41:
            # the user is reedinting the vote
            # crear una lista con los ids existentes en la votacions
            con = psycopg2.connect(host='127.0.0.1', database='postgres',
                                   user='decide', password='decide')
            # create cursor
            cur = con.cursor()
            uid = request.data.get('voter')  # cojer el id del votante
            # Cojer id votacion para comprovar con la actual
            cur.execute("""SELECT voting_id FROM
                        store_vote WHERE voter_id = %s;""",
                        (uid,))

            # Creamos una lista con el id de las votaciones
            row = cur.fetchone()
            row_pull = []
            while row is not None:
                row_pull.append(row[0])
                row = cur.fetchone()

            # close conection
            con.close()
            cur.close()
            for a in row_pull:
                # Comprovar si a es = vid
                if int(a) == int(vid):
                    return Response({},
                                    status=status.HTTP_503_SERVICE_UNAVAILABLE)

        # Eliminar votos anteriores para evitar duplicados
        if changeV == 41:
            # Conexion a bbdd
            con = psycopg2.connect(
                host='127.0.0.1',
                database='postgres',
                user='decide',
                password='decide'
            )
            # create cursor
            cur = con.cursor()
            # Query para borrar votos con el mismo uid y vid
            auxa = "DELETE FROM store_vote WHERE voter_id = "
            aux = auxa + "%s AND voting_id = %s"
            cur.execute(aux,
                        (uid, vid))
            con.commit()

            con.close()
            cur.close()

        a = vote.get("a")
        b = vote.get("b")

        defs = {"a": a, "b": b}
        # nuevos atributos
        utime = timezone.now()
        usex = random.choice(['Hombre', 'Mujer'])
        uage = random.randint(18, 99)
        uip = str(IPv4Address(random.getrandbits(32)))
        ucity = "Sevilla"
        defs = {"a": a, "b": b}

        v, _ = Vote.objects.get_or_create(voting_id=vid, voter_id=uid,
                                          voted=utime, voter_sex=usex,
                                          voter_age=uage, voter_ip=uip,
                                          voter_city=ucity, defaults=defs)
        v.a = a
        v.b = b

        # Guardado de atributos
        v.voted = utime
        v.voter_age = uage
        v.voter_sex = usex
        v.voter_ip = uip
        v.voter_city = ucity
        v.save()

        if changeV == 41:
            return Response({}, status=status.HTTP_200_OK)

        return Response({})


@user_passes_test(lambda u: u.is_superuser, login_url='/admin/login/')
class BackupView(TemplateView):
    template_name = 'backup/backup.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


@user_passes_test(lambda u: u.is_superuser, login_url='/admin/login/')
def backup(request):
    if request.method == 'POST' and 'crear_copia' in request.POST:
        management.call_command('dbbackup')

        # Devolver a la vista
        return HttpResponseRedirect(reverse(backup))

    if request.method == 'POST' and 'restaurar_copia' in request.POST:
        nombreCopia = request.POST['nombreCopia']
        management.call_command('dbrestore', '-i', nombreCopia, '--noinput')
        aEliminar = os.getcwd() + '/store/backup/' + nombreCopia
        os.remove(aEliminar)

        # Devolver a la vista
        return HttpResponseRedirect(reverse(backup))

    if request.method == 'POST' and 'borrar_copia' in request.POST:
        nombreCopia = request.POST['nombreCopia']
        aEliminar = os.getcwd() + '/store/backup/' + nombreCopia
        os.remove(aEliminar)

        # Devolver a la vista
        return HttpResponseRedirect(reverse(backup))

    DIR = os.getcwd() + '/store/backup'
    numeroBackups = len([name for name in os.listdir(DIR)
                         if os.path.isfile(os.path.join(DIR, name))])
    nombreCopias = os.listdir(DIR)
    return render(request, 'backup/backup.html',
                  {'numeroBackups': numeroBackups,
                   'nombreCopias': nombreCopias})


def Changevote(request, *args, **kwargs):

    con = psycopg2.connect(host='127.0.0.1',
                           database='postgres',
                           user='decide',
                           password='decide')
    # create cursor
    cur = con.cursor()
    uid = 3

    cur.execute("SELECT voting_id FROM store_vote WHERE voter_id = %s;",
                (uid,))

    row = cur.fetchone()
    row_pull = []
    while row is not None:
        row_pull.append(row[0])
        row = cur.fetchone()

    id_votacion = row
    urls = []
    for a in row_pull:
        urls.append("/booth/" + str(a) + "?myVar=41")
    # Crear las urls concatenadas ya, y enviarlas
    context = {'id': id_votacion,
               'request': request,
               'row': row_pull,
               'url': urls,
               }
    # Close bbdd conection
    con.close()
    cur.close()
    # En context pasamos las votaciones en las que ha participado
    # (ID y nombre votación)
    return render(request, "changevote.html", context)
