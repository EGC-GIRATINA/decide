
import sys
import json
from builtins import print

from tablib import Dataset

from django.http import HttpResponse
from django.shortcuts import render_to_response, redirect, render
from django.views.generic import FormView
from pyexpat.errors import messages

from django.db.utils import IntegrityError
from django.core.exceptions import ObjectDoesNotExist
from django.views.generic import TemplateView
from django.views.generic.base import View

from rest_framework import generics
from rest_framework.response import Response
from rest_framework.status import (
    HTTP_201_CREATED as ST_201,
    HTTP_204_NO_CONTENT as ST_204,
    HTTP_401_UNAUTHORIZED as ST_401,
    HTTP_409_CONFLICT as ST_409
)
from django.conf import settings
from base.perms import UserIsStaff
from rest_framework.utils import json

from .forms import CensusForm, CreateCensusForm
from .models import Census
from django.contrib.auth.models import User
import django_excel as excel

from base import mods

from django import forms

from .resources import CensusResource


class CensusNew(FormView):
    template_name = 'census/create.html'
    form_class = CreateCensusForm
    model = Census
    success_url = '/census/census/'

    def form_valid(self, form, **kwargs):
        form = CreateCensusForm(self.request.POST)
        censuses = Census.objects.all()

        if form.is_valid():
            try:
                voting = mods.get('voting', params={'id': form.cleaned_data['votacion']})
                voter = form.cleaned_data['votante']
                census = Census(voting_id=form.cleaned_data['votacion'], voter_id=voter)
                census.save()
            except IntegrityError as e:
                return HttpResponse("ERROR: Lo que has puesto ya existe!")

        return super(CensusNew, self).form_valid(form)



""" def get_context_data(self, *args, **kwargs):
        context = super(CensusNew, self).get_context_data(**kwargs)

        usuarios = User.objects.all()

        votaciones = mods.get('voting')

        ids = []
        names = []

        # import pdb
        # pdb.set_trace()
        for i in votaciones:
            ids.append(i['id'])
            names.append(i['name'])

        items = zip(usuarios)
        items_voting = zip(ids, names)
        context['items_voting'] = items_voting
        print(items)
        context['items'] = items

        return context"""

class CensusView(TemplateView):
    template_name = "census/census.html"

    def get_context_data(self, *args, **kwargs):
        context = super(CensusView, self).get_context_data(**kwargs)

        context['check_user'] = False

        if self.request.user.is_authenticated:
            if self.request.user.is_superuser:
                context['check_user'] = True

        context['message'] = 'Aqui estamos'
        datos = Census.objects.all()

        users = []
        votings = []

        for dato in datos:
            votings.append(mods.get('voting', params={'id': dato.voting_id}))
            users.append(User.objects.get(id=dato.voter_id))
        print(votings)
        print(users)

        users_list = list(users)


        datos_usuarios = []
        datos_votaciones = []
        for i in votings:
            datos_votaciones.append(i[0]['name'])

        for i in users_list:
            datos_usuarios.append(i.username)

        context['voting'] = datos_votaciones
        context['users'] = datos_usuarios
        ids = Census.objects.all().values_list('id', flat=True)

        context['ids'] = ids

        items = zip(ids, datos_votaciones, datos_usuarios)

        context['items'] = items

#        for i in range(0, len(datos_usuarios)):
 #           context['datos'].append({})
        #    context['datos'][i]['voting_id'] = datos_votaciones[i]
        #    context['datos'][i]['voter_id'] = datos[i]['voter_id']
        return context



    def eliminaDatos(self, format_exp=None):
        censo = Census.objects.filter(id=format_exp)

        for i in censo:
            Census.delete(i)
        return redirect('/census/census')

class CensusImportar(TemplateView):
    template_name = "census/import.html"

    def importarCenso(request):

        if request.method == 'POST':
            census_resource = CensusResource()
            dataset = Dataset()
            new_census = request.FILES['myfile']
            ruta = request.FILES.get('myfile')


            if 'csv' in str(ruta):
                imported_data = dataset.load(new_census.read().decode('latin-1'),format='csv')

            elif 'json' in str(ruta):
                imported_data = dataset.load(new_census.read().decode('latin-1'), format='json')
            elif 'yaml' in str(ruta):
                imported_data = dataset.load(new_census.read().decode('latin-1'), format='yaml')

            result = census_resource.import_data(dataset, dry_run=True)


            if not result.has_errors():
                census_resource.import_data(dataset, dry_run=False)


        return render(request, 'census/import.html')

    def exportarDatos(request ,format_exp=None):

        censo_resource = CensusResource()
        dataset = censo_resource.export()
        if format_exp == "csv":
            response= HttpResponse(dataset.csv, content_type='text/csv')
            response['Content-Disposition']= 'attachment; filename="censo.csv"'
            return response
        if format_exp == "json":
            response= HttpResponse(dataset.json, content_type='application/json')
            response['Content-Disposition']= 'attachment; filename="censo.json"'
            return response
        if format_exp == "yaml":
            response= HttpResponse(dataset.yaml, content_type='application/yaml')
            response['Content-Disposition']= 'attachment; filename="censo.yaml"'
            return response

        return render(request, 'census/export.html')

class CensusLogin(FormView):
    template_name = 'census/login.html'
    form_class = CensusForm
    success_url = '/census/census/'


    #def post(self, request, *args, **kwargs):
        #context = self.get_context_data()


class CensusCreate(generics.ListCreateAPIView):
    permission_classes = (UserIsStaff,)

    def create(self, request, *args, **kwargs):
        voting_id = request.data.get('voting_id')
        voters = request.data.get('voters')
        try:
            for voter in voters:
                census = Census(voting_id=voting_id, voter_id=voter)
                census.save()
        except IntegrityError:
            return Response('Error try to create census', status=ST_409)
        return Response('Census created', status=ST_201)

    def list(self, request, *args, **kwargs):
        voting_id = request.GET.get('voting_id')
        voters = Census.objects.filter(voting_id=voting_id).values_list('voter_id', flat=True)
        return Response({'voters': voters})


class CensusDetail(generics.RetrieveDestroyAPIView):

    def destroy(self, request, voting_id, *args, **kwargs):
        voters = request.data.get('voters')
        census = Census.objects.filter(voting_id=voting_id, voter_id__in=voters)
        census.delete()
        return Response('Voters deleted from census', status=ST_204)

    def retrieve(self, request, voting_id, *args, **kwargs):
        voter = request.GET.get('voter_id')
        try:
            Census.objects.get(voting_id=voting_id, voter_id=voter)
        except ObjectDoesNotExist:
            return Response('Invalid voter', status=ST_401)
        return Response('Valid voter')