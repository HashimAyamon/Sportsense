from django.conf.urls import url
from login import views

urlpatterns =[
    url('login/',views.login),
    url('login_flut/',views.login_flutter.as_view()),
    url('check/',views.check)
]