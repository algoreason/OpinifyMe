from django.shortcuts import render,get_object_or_404,redirect
from django.utils import timezone
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from .models import *
from django.views import generic
from django.contrib.auth import authenticate, login,logout
from django.contrib.auth.models import User
from django.db.models import Sum
from django.views.decorators.csrf import csrf_exempt

def loginInitialization(request):
	if 'user_idname' in request.session:
		return HttpResponseRedirect("/cats/")
	return render(request,'polls/login/index.html',{})

def loginRetry(request,error):
    return render(request,'polls/login/index.html',{'error_message':'error'})


def logout_view(request):
    logout(request)
    request.session.flush
    return HttpResponseRedirect("/login/")


def login_proc(request):
    username=request.POST['username']
    password=request.POST['password']
    user=authenticate(username=username,password=password)
    if user is not None:
        if user.is_active:
            login(request,user)
            request.session['user_idname']=username
            return HttpResponseRedirect("/cats/")
        else:
            return HttpResponse("User Disabled")
    else:
        return HttpResponseRedirect("/login/error")

def index(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    latest_question_list = Question.objects.all()
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)

def registerInit(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    return render(request, 'polls/register.html', {})    

def register(request):
    username=request.POST['username']
    email=request.POST['email']
    password=request.POST['password']
    first_name=request.POST['firstname']
    last_name=request.POST['lastname']
    user = User.objects.create_user(username,email,password)
    user.last_name = last_name
    user.first_name = first_name
    user.save()
    return HttpResponseRedirect("/login/")

def detail(request,question_id):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    username=request.session['user_idname']
    user=User.objects.get(username=username)
    question=Question.objects.get(id=question_id)
    voted=Voted.objects.filter(question_id=question,username=user)
    if voted:
        return HttpResponseRedirect("/"+question_id+"/results/voted")
    
    context={'question':question,'username':User.objects.get(username = request.session['user_idname'])}
    return render(request,'polls/detail.html',context)

def results(request,question_id,already):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    username=request.session['user_idname']
    user=User.objects.get(username=username)
    question=Question.objects.get(id=question_id)
    voted=Voted.objects.filter(question_id=question,username=user)
    sum1=0
    for choice in question.choice_set.all():
        sum1 = sum1 + choice.votes
    
    if not voted:
        return HttpResponseRedirect("/"+question_id+"/vote/")
    question=get_object_or_404(Question,id=question_id)
    if already:
        context={'question':question,'sum1':sum1,'voted':voted,'username':user}    
    else:
        context={'question':question,'sum1':sum1,'username':user}
    return render(request,'polls/results.html',context)

def vote(request,question_id):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    v=get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = v.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        context ={'question':v,'error_message':"Please select a Choice."}
        return render(request, 'polls/detail.html',context)
    else:
        selected_choice.votes +=1;
        selected_choice.save();
        user_idname=request.session['user_idname']
        user1=User.objects.get(username=user_idname)
        voted=Voted(username=user1,question_id=v,choice=selected_choice,voted_date=timezone.now())
        voted.save()
    return HttpResponseRedirect(reverse('polls:results',args=(v.id,)))

def about(request):
    if 'user_idname' in request.session:
        user=User.objects.get(username=request.session['user_idname'])
        context={'user':user}
        return render(request,'polls/about.html',context)
    else:
        print("here")
        return render(request,'polls/about.html',{})

def categoryInit(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    category_list = Category.objects.all()
    context={'category_list':category_list,'username':User.objects.get(username = request.session['user_idname'])}
    return render(request, 'polls/Categories.html',context)

def questionsByCat(request,category_id):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    category=Category.objects.get(category_id=category_id)
    questions=Question.objects.filter(category_id=category)
    context={'question_list':questions,'category':category,'username':User.objects.get(username = request.session['user_idname'])}
    return render(request,'polls/ViewByIndex.html',context)

def me(request):
    return render(request,'polls/sharad.html',{})

def profileView(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    print(request.user.email)
    user=User.objects.get(username=request.session['user_idname'])
    voted=Voted.objects.filter(username=user)
    question=Question.objects.all()
    choice=Choice.objects.all()
    context={'user':user,'voted':voted,'question':question,'choice':choice}
    return render(request,'polls/profileView.html',context)

def newQuestion(request):
    category=Category.objects.all()
    context = {"categories":category,"username":request.user}    
    return render(request,'polls/addQuestion.html',context)    

def addQues(request):
    text = request.POST.get('text',False)
    opt = []
    for i in range(1,5):
        opt.append(request.POST.get('opt'+str(i)+'',False))
    cat = request.POST.get('cat')
    print(text)
    category = get_object_or_404(Category, category_name = cat)
    q=Question(question_text = text,category_id = category,pub_date = timezone.now )
    q1 = Question.objects.get(id=1)
    for i in range(0,4):
        c=Choice(choice_text=opt[i], question=q1)
        print(c)
    return HttpResponseRedirect("/"+str(q1.id)+"/")

@csrf_exempt
def addComments(request):
    text=request.POST.get('text',False)
    q_id=request.POST.get('q_id',False)
    q=get_object_or_404(Question, id=q_id)
    comment = Comments(text=text,question=q)
    print(comment)
    return HttpResponse(comment)