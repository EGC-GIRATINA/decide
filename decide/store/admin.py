from django.contrib import admin

from .models import Vote
from .models import Backup


admin.site.register(Vote)
admin.site.register(Backup)
