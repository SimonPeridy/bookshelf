from django.conf.urls import url
from django.urls import path, re_path
from django.views.generic import RedirectView

from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('add_book/', views.add_book, name='add_book'),
    path('author_list/', views.search, name='author_list'),
    path('myurl/', views.myurl_function, name='myurl'),
    path("<int:author_id>/", views.author_details, name="author_details"),
]
