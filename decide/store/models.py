from django.db import models
from base.models import BigBigField


class Vote(models.Model):
    voting_id = models.PositiveIntegerField()
    voter_id = models.PositiveIntegerField()
    a = BigBigField()
    b = BigBigField()
    voted = models.DateTimeField()
    voter_sex = models.TextField(default='Hombre')
    voter_age = models.PositiveIntegerField(default=20)
    voter_ip = models.GenericIPAddressField(default='0.0.0.0')
    voter_city = models.TextField(default='Sevilla')

    def __str__(self):
        return '{}: {}'.format(self.voting_id, self.voter_id)
