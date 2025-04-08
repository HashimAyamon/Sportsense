from django.conf.urls import url
from local_match_details import views

urlpatterns = [
    url('manage/',views.manage_locmatch,),
    url('post/',views.post_locmatch),
    url('view/',views.view_locmatch),
    url('update/(?P<idd>\w+)',views.update),
    url('delete/(?P<idd>\w+)', views.delete),
    url('management/',views.management_manage),
    url('user_view_localmatch/',views.view_localmatch.as_view()),
    url('match/',views.match.as_view()),
    url('aaa/',views.mat.as_view()),
    url('fac/',views.fac.as_view()),
    url('cccc/(?P<idd>\w+)',views.dellll)
]