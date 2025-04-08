from django.conf.urls import url
from user import views

urlpatterns = [
    url('manage/', views.manage_user),
    url('user/', views.user),
    url('userprofile/', views.userprofile),
    url('apprv/(?P<idd>\w+)',views.approve),
    url('reject/(?P<idd>\w+)',views.reject),
    url('user_view_profile/',views.view_profile.as_view()),
    url('user_post_register/',views.register.as_view()),
    url('wokrupload/',views.uploadwork)

]