from django.db import models
from django.contrib.postgres.fields import JSONField
from django.db.models.signals import post_save
from django.dispatch import receiver

from base import mods
from base.models import Auth, Key

import requests
import sys


class Question(models.Model):
    desc = models.TextField()

    def __str__(self):
        return self.desc


class QuestionOption(models.Model):
    question = models.ForeignKey(Question, related_name='options', on_delete=models.CASCADE)
    number = models.PositiveIntegerField(blank=True, null=True)
    option = models.TextField(default = 'If you select yes/no, form will be automatically filled')
    yes = models.BooleanField(default = False)
    no = models.BooleanField(default = False)

    def save(self):
        if(self.yes == 1):
            self.number = 1
            self.option = 'Yes'
        elif (self.no == 1):
            self.number = 2
            self.option = 'No'
        elif (not self.number and self.option != 'If you select yes/no, form will be automatically filled'):
            self.number = self.question.options.count() + 2
        return super().save()

    def __str__(self):
        return '{} ({})'.format(self.option, self.number)


class Voting(models.Model):
    name = models.CharField(max_length=200)
    desc = models.TextField(blank=True, null=True)
    question = models.ForeignKey(Question, related_name='voting', on_delete=models.CASCADE)

    start_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)

    pub_key = models.OneToOneField(Key, related_name='voting', blank=True, null=True, on_delete=models.SET_NULL)
    auths = models.ManyToManyField(Auth, related_name='votings')

    tally = JSONField(blank=True, null=True)
    postproc = JSONField(blank=True, null=True)

    def create_pubkey(self):
        if self.pub_key or not self.auths.count():
            return

        auth = self.auths.first()
        data = {
            "voting": self.id,
            "auths": [ {"name": a.name, "url": a.url} for a in self.auths.all() ],
        }
        key = mods.post('mixnet', baseurl=auth.url, json=data)
        pk = Key(p=key["p"], g=key["g"], y=key["y"])
        pk.save()
        self.pub_key = pk
        self.save()

    def get_votes(self, token=''):
        # gettings votes from store
        votes = mods.get('store', params={'voting_id': self.id}, HTTP_AUTHORIZATION='Token ' + token)
        # anon votes
        return [[i['a'], i['b']] for i in votes]

    def tally_votes(self, token=''):
        '''
        The tally is a shuffle and then a decrypt
        '''

        votes = self.get_votes(token)

        auth = self.auths.first()
        shuffle_url = "/shuffle/{}/".format(self.id)
        decrypt_url = "/decrypt/{}/".format(self.id)
        auths = [{"name": a.name, "url": a.url} for a in self.auths.all()]

        # first, we do the shuffle
        data = { "msgs": votes }
        response = mods.post('mixnet', entry_point=shuffle_url, baseurl=auth.url, json=data,
                response=True)
        if response.status_code != 200:
            # TODO: manage error
            pass

        # then, we can decrypt that
        data = {"msgs": response.json()}
        response = mods.post('mixnet', entry_point=decrypt_url, baseurl=auth.url, json=data,
                response=True)

        if response.status_code != 200:
            # TODO: manage error
            pass

        self.tally = response.json()
        self.save()

        self.do_postproc()

    def do_postproc(self):
        tally = self.tally
        options = self.question.options.all()

        
        opts = []
        for opt in options:
            if isinstance(tally, list):
                votes = tally.count(opt.number)
            else:
                votes = 0
            opts.append({
                'option': opt.option,
                'number': opt.number,
                'votes': votes
            })

        data = { 'type': 'IDENTITY', 'options': opts }
        postp = mods.post('postproc', json=data)

        id = "@Visualizer_decide"
 
        token = "1068887281:AAHe7veJqhSAW2tkHWp3MquKfYaHXswv9OY"

        votacion_name = self.name
        mensaje  = str("Se ha cerrado la votación "+votacion_name+" con los siguientes resultados: ")

        for opt in options:
            if isinstance(tally, list):
                votes = tally.count(opt.number)
            else:
                votes = 0
            mensaje = mensaje + "\n"+str(opt.option)+": "+str(opt.number)+" votos."

        url = "https://api.telegram.org/bot"+token+"/sendMessage"
        params = {
        'chat_id': id,
        
        'text' : mensaje
        }
        
        requests.post(url, params=params)
        self.postproc = postp
        self.save()

    def __str__(self):
        return self.name
