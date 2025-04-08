from django.conf.urls import url
from notification_score import views

urlpatterns = [
    url('notification/',views.noti_score),
    url('post/',views.post_noti_score),
    url('user/',views.view_notiscore.as_view())
]