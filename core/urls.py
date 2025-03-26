from django.urls import path
from .views import HomeView

main_urlspatterns = ([
    path('', HomeView.as_view(), name='home')
], 'main')