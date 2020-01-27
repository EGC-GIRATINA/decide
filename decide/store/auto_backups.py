from django_cron import CronJobBase, Schedule
from django.core import management
from django.conf import settings

class auto_backups(CronJobBase):
    RUN_EVERY_MINS=1

    schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
    code = 'store.auto_backups.auto_backups'

    def do(self):
	    management.call_command('dbbackup')

