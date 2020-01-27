import django_filters.rest_framework
import os, os.path
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


class StoreView(generics.ListAPIView):
    queryset = Vote.objects.all()
    serializer_class = VoteSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = ('voting_id', 'voter_id')

    def backup(request):
        return render(request, "store/backup/backup.html")

    def get(self, request):
        self.permission_classes = (UserIsStaff,)
        self.check_permissions(request)
        return super().get(request)

    def post(self, request):
        """
         * voting: id
         * voter: id
         * vote: { "a": int, "b": int }
        """

        vid = request.data.get('voting')
        voting = mods.get('voting', params={'id': vid})
        if not voting or not isinstance(voting, list):
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)
        start_date = voting[0].get('start_date', None)
        end_date = voting[0].get('end_date', None)
        not_started = not start_date or timezone.now() < parse_datetime(start_date)
        is_closed = end_date and parse_datetime(end_date) < timezone.now()
        if not_started or is_closed:
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)

        uid = request.data.get('voter')
        vote = request.data.get('vote')

        if not vid or not uid or not vote:
            return Response({}, status=status.HTTP_400_BAD_REQUEST)

        # validating voter
        token = request.auth.key
        voter = mods.post('authentication', entry_point='/getuser/', json={'token': token})
        voter_id = voter.get('id', None)
        if not voter_id or voter_id != uid:
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)

        # the user is in the census
        perms = mods.get('census/{}'.format(vid), params={'voter_id': uid}, response=True)
        if perms.status_code == 401:
            return Response({}, status=status.HTTP_401_UNAUTHORIZED)

        a = vote.get("a")
        b = vote.get("b")

        defs = { "a": a, "b": b }
        v, _ = Vote.objects.get_or_create(voting_id=vid, voter_id=uid,
                                          defaults=defs)
        v.a = a
        v.b = b

        v.save()

        return  Response({})

class BackupView(TemplateView):
    template_name = 'backup/backup.html'
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context
            
def backup(request):
    if request.method == 'POST' and 'crear_copia' in request.POST:
        management.call_command('dbbackup') 

        #Devolver a la vista
        return HttpResponseRedirect(reverse(backup))

    if request.method == 'POST' and 'restaurar_copia' in request.POST:
        nombreCopia = request.POST['nombreCopia']
        management.call_command('dbrestore','-i',nombreCopia,'--noinput')

        #Devolver a la vista
        return HttpResponseRedirect(reverse(backup))

    if request.method == 'POST' and 'borrar_copia' in request.POST:
        nombreCopia = request.POST['nombreCopia']
        aEliminar = os.getcwd() + '/store/backup/' + nombreCopia
        os.remove(aEliminar)

        #Devolver a la vista
        return HttpResponseRedirect(reverse(backup))

    DIR = os.getcwd() + '/store/backup'
    numeroBackups = len([name for name in os.listdir(DIR) if os.path.isfile(os.path.join(DIR, name))])
    nombreCopias = os.listdir(DIR)
    return render(request, 'backup/backup.html',{'numeroBackups':numeroBackups,'nombreCopias':nombreCopias})
