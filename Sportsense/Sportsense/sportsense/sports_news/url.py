from django.conf.urls import url
from sports_news import views

urlpatterns = [
    url('manage/', views.manage_sportsnews),
    url('post/', views.post_sportsnews),
    url('view/', views.view_sportsnews),
    url('update_news/(?P<idd>\w+)',views.update_news),
    url('delete_news/(?P<idd>\w+)',views.delete_news),
    url('user_view_sprtnews/',views.view_sprtnews.as_view()),
    url('news/',views.index)

]