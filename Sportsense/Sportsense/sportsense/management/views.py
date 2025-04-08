from django.shortcuts import render
from management.models import Management
from login.models import Login
# Create your views here.

def managment(request):
    obk = ""
    if request.method=="POST":
        obj=Management()
        obj.name=request.POST.get('unm')
        obj.password= request.POST.get('psw')
        obj.phone_no=request.POST.get('phn')
        obj.email= request.POST.get('eml')
        obj.address = request.POST.get('adr')
        obj.save()
        obk='kk'
    context = {
        'x': obk
    }

    return render(request,'management/management.html',context)

def manage_managment(request):
    obj = Management.objects.all()
    context = {
        'y': obj
    }
    return render(request,'management/manage local match managment.html',context)


def approve(request,idd):
    obj=Management.objects.get(management_id=idd)
    obj.status = 'approved'
    obj.save()
    ob = Login()
    ob.username = obj.email
    ob.password = obj.password
    ob.type = 'local_match_managment'
    ob.u_id = obj.management_id
    ob.save()
    return manage_managment(request)

def reject(request,idd):
    obj=Management.objects.get(management_id=idd)
    obj.status = 'rejected'
    obj.save()
    return manage_managment(request)