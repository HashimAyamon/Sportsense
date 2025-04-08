from django.conf.urls import url
from notification_news import views

urlpatterns = [
    url('notification/',views.noti_news),
    url('post/',views.post_noti_news),
    url('user_view_notinews/',views.view_notinews.as_view())

]