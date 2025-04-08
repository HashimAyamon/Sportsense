from django.conf.urls import url
from temp import views

urlpatterns=[
    url('admin/',views.admin),
    url('home/',views.home),
    url('manager/',views.manager),
    url('news/',views.news),
    url('aaa/',views.main_home),
    url('bbb/',views.main_admin),
    url('ccc/',views.main_manager),
]