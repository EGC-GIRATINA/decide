from rest_framework import serializers
from .models import Vote


class VoteSerializer(serializers.HyperlinkedModelSerializer):
    a = serializers.IntegerField()
    b = serializers.IntegerField()

    voted = serializers.DateTimeField()
    # sexo
    voter_sex = serializers.CharField()
    # edad
    voter_age = serializers.IntegerField()
    # ip
    voter_ip = serializers.IPAddressField()
    # ciudad
    voter_city = serializers.CharField()

    class Meta:
        model = Vote
        fields = ('voting_id',
            'voter_id', 'a', 'b',
            'voted', 'voter_sex',
            'voter_age', 'voter_ip',
            'voter_city')
