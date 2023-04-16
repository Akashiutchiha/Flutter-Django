from django.urls import path
from .views import aPage


urlpatterns = [
    path('home', aPage),
]