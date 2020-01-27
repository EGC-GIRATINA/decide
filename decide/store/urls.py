from django.urls import path
from . import views


urlpatterns = [
    #path('', StoreView.as_view(), name='store'),
    #path('backup/', BackupView.backup, name='backup'),
    path('', views.StoreView.as_view(), name='store'),
    path('changevote/', views.Changevote, name='home')
    
]

