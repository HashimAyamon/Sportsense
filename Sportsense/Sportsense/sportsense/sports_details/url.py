from django.conf.urls import url
from sports_details import views

urlpatterns = [
    url('manage/',views.manage_sportsdet),
    url('post/',views.post_sportsdet),
    url('view/',views.view_sportsdet),
    url('updet/(?P<idd>\w+)',views.update_details),
    url('deldet/(?P<idd>\w+)',views.delete_det),
    url('user_view_sprtdet/',views.view_sprtdet.as_view())
]