from django.urls import path
from . import views


urlpatterns = [
    path('', views.StoreView.as_view(), name='store'),
    path('changevote/', views.Changevote, name='home')
    
]

