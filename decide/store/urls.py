from django.urls import path
from .views import StoreView
from .views import BackupView


urlpatterns = [
    #path('', StoreView.as_view(), name='store'),
    #path('backup/', BackupView.backup, name='backup'),
    path('', views.StoreView.as_view(), name='store'),
    path('changevote/', views.Changevote, name='home')
    
]

