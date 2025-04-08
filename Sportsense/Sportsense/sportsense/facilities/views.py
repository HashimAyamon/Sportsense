from django.shortcuts import render
from facilities.models import Facilities


# Create your views here.


def post_fac(request):
    obk=""
    if request.method=="POST":
        obj=Facilities()
        obj.seat=request.POST.get('dt')
        obj.parking=request.POST.get('prk')
        obj.save()
        obk = 'kk'
    context={
        'x':obk
    }
    return render(request, 'facilities/post facilities.html',context)


def view_fac(request):
    obj=Facilities.objects.all()
    context={
        'x':obj
    }
    return render(request, 'facilities/view facilities.html',context)


def manage_fac(request):
    obj = Facilities.objects.all()
    context = {
        'x': obj
    }
    return render(request, 'facilities/manage facilities.html',context)


def update_fac(request,idd):
    obj = Facilities.objects.get(facilities_id=idd)
    context = {
        'x': obj
    }
    if request.method=="POST":
        obj=Facilities.objects.get(facilities_id=idd)
        obj.seat=request.POST.get('dt')
        obj.parking=request.POST.get('prk')
        obj.save()
        return manage_fac(request)
    return render(request,'facilities/update.html',context)

def delete_fac(request,idd):
    obj=Facilities.objects.get(facilities_id=idd)
    obj.delete()
    return manage_fac(request)


from rest_framework.views import APIView,Response
from facilities.serializers import android_serialiser

class view_facility(APIView):
    def get(self,request):
        obj=Facilities.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)