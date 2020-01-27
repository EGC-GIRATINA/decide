from rest_framework import serializers

from .models import Vote
from .models import Backup


class VoteSerializer(serializers.HyperlinkedModelSerializer):
    a = serializers.IntegerField()
    b = serializers.IntegerField()

    class Meta:
        model = Vote
        fields = ('voting_id', 'voter_id', 'a', 'b')

class BackupSerializer(serializers.HyperlinkedModelSerializer):
    backup_data = serializers.FileField()
    backup_date = serializers.DateField()

    class Meta:
        model = Backup
        fields = ('backup_data', 'backup_date')