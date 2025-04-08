"""sportsense URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url,include
from temp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    url('facilities/', include('facilities.url')),
    url('local_match_details/', include('local_match_details.url')),
    url('login/', include('login.url')),
    url('management/', include('management.url')),
    url('notification_news/', include('notification_news.url')),
    url('notification_score/', include('notification_score.url')),
    url('sports_details/', include('sports_details.url')),
    url('sports_news/', include('sports_news.url')),
    url('user/', include('user.url')),
    url('temp/',include('temp.url')),
    url('$',views.home)

]
