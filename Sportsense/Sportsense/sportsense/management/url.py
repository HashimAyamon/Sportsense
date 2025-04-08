from django.conf.urls import url
from management import views

urlpatterns = [
    url('managment/',views.managment),
    url('manage/', views.manage_managment),
    url('apprv/(?P<idd>\w+)',views.approve),
    url('reject/(?P<idd>\w+)', views.reject),


]