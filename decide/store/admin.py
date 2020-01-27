from django.contrib import admin
from .models import Vote
#from .models import Backup
from django.core import management

admin.site.register(Vote)

#@admin.register(Backup)
#class BackupAdmin(admin.ModelAdmin):
    #management.call_command('runcrons')
    #management.call_command('dbbackup')
