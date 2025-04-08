from django.conf.urls import url
from facilities import views


urlpatterns=[
    url('manage/',views.manage_fac),
    url('post/',views.post_fac),
    url('view/',views.view_fac),
    url('up_fac/(?P<idd>\w+)',views.update_fac),
    url('dl_fac/(?P<idd>\w+)', views.delete_fac),
    url('user_view_fac/',views.view_facility.as_view())
]