from django.http import HttpResponse
from django.shortcuts import render
from user.models import User
from login.models import Login

# Create your views here.

def manage_user(request):
    obj = User.objects.all()
    context = {
        'x': obj
    }
    return render(request,'user/manage user.html',context)

def approve(request,idd):
    obj=User.objects.get(user_id=idd)
    obj.status='approved'
    obj.save()
    return manage_user(request)

def reject(request,idd):
    obj=User.objects.get(user_id=idd)
    obj.status='rejected'
    obj.save()
    return manage_user(request)

def user(request):
    if request.method=="POST":
        obj=User()
        obj.username = request.POST.get('unm')
        obj.password = request.POST.get('psw')
        obj.email=request.POST.get('eml')
        obj.phone= request.POST.get('phn')
        obj.save()
    return render(request,'user/user.html')

def userprofile(request):
    if request.method=="POST":
        obj=User()
        obj.username = request.POST.get('unm')
        obj.password = request.POST.get('psw')
        obj.email=request.POST.get('eml')
        obj.phone= request.POST.get('phn')
        obj.save()
    return render(request,'user/user.html')

from rest_framework.views import APIView,Response
from user.serializers import android_serialiser

class register(APIView):
    obk=""
    def post(self,request):
        a=request.data['email']
        b=request.data['phone']
        obv=User.objects.filter(Q(email=a) & (Q(phone=b) | Q(email=a) | Q(phone=b)))
        if len(obv) > 0:
            obk="User Exist"
        else:
            obj=User()
            obj.username=request.data['username']
            obj.password=request.data['password']
            obj.email=request.data['email']
            obj.phone=request.data['phone']
            obj.image=""
            obj.status='pending'
            obj.save()

            ob=Login()
            ob.username=obj.email
            ob.password=obj.password
            ob.type='user'
            ob.u_id=obj.user_id
            ob.save()
        return HttpResponse('yes')


class view_profile(APIView):
    def post(self,request):
        obj=User.objects.filter(user_id=request.data['u_id'])
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)


from sportsense import settings
from django.core.files.storage import FileSystemStorage
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Max, Q


@csrf_exempt
def uploadwork(request):
    if request.method=="POST" and request.FILES['file']:
        mfile=request.FILES['file']
        fs=FileSystemStorage()
        fpath=str(settings.BASE_DIR) + (settings.STATIC_URL) + mfile.name
        fname=fs.save(fpath, mfile)
        print(fname)
        # max_value = User.objects.aggregate(max_value=User.Max('user_id'))['max_value']
        max_value=User.objects.aggregate(Max('user_id'))['user_id__max']
        print(max_value,"aaa")
        vv=User.objects.get(user_id=max_value)
        vv.image=fname
        vv.save()
        return HttpResponse("yess")