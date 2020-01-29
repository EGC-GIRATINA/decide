from django.core import management


def auto_backups():
    management.call_command('dbbackup')
