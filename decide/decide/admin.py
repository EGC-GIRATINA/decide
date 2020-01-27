from django.contrib.admin import AdminSite
from django.http import HttpResponse
from store.views import BackupView

class MyAdminSite(AdminSite):

     def get_urls(self):
         from django.urls import path
         urls = super().get_urls()
         urls += [
             path('store/backup/', BackupView.backup, name='backup'),
         ]
         return urls

admin_site = MyAdminSite()
