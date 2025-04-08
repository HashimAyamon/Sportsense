from django.shortcuts import render

# Create your views here.

def home(request):
    return render(request,'temp/home.html')

def admin(request):
    return render(request,'temp/admin.html')

def manager(request):
    return render(request,'temp/manager.html')

def main_home(request):
    return render(request,'temp/main_home.html')

def main_admin(request):
    return render(request,'temp/main_admin.html')

def main_manager(request):
    return render(request,'temp/main_manager.html')

def news(request):
    return render(request,'temp/news.html')








