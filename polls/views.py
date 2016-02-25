from django.shortcuts import render,get_object_or_404,redirect
from django.utils import timezone
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from .models import *
from django.views import generic
from django.contrib.auth import authenticate, login,logout
from django.contrib.auth.models import User
from django.db.models import Sum,Q
from django.views.decorators.csrf import csrf_exempt
import json
from users.models import Country,UserProfile
from django.utils import timezone
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

def loginInitialization(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect("/feed/")
    context = {}
    if request.GET.get('error') is not None:
        context['error_message']='error'
    return render(request,'polls/login/index.html',context)

def loginRetry(request,error):
    return render(request,'polls/login/index.html',{'error_message':'error'})

def logout_view(request):
    logout(request)
    return HttpResponseRedirect("/login/")


def login_proc(request):
    email=request.POST['email']
    password=request.POST['password']
    next = request.GET.get('next')
    try:
        email_user = User.objects.get(email=email)
    except User.DoesNotExist:
        return HttpResponseRedirect("/login/?error=True")
    user=authenticate(username=email_user.username,password=password)
    print user
    if user is not None:
        if user.is_active:
            login(request,user)
            if next is not None:
                return HttpResponseRedirect(next)
            return HttpResponseRedirect("/feed/")
        else:
            return HttpResponse("User Disabled")
    if next is not None:
        return HttpResponseRedirect("/login/?next="+next+"&error=True")
    return HttpResponseRedirect("/login/?error=True")

def index(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    latest_question_list = Question.objects.all()
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)

def categoryInit(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    category_list = Category.objects.all()
    context={'category_list':category_list,'username':User.objects.get(username = request.user)}
    return render(request, 'polls/Categories.html',context)

def registerInit(request):
    if request.user.is_authenticated():
        return categoryInit(request)
    return render(request, 'polls/register.html', {})    

def register(request):
    user_details = {
            "email":request.POST['email'],
            "first_name":request.POST['firstname'],
            "last_name":request.POST['lastname']
        }
    try:    
        user = User.objects.create(**user_details)
        password = request.POST['password']
        user.set_password(password)
        user.save()
        user=authenticate(username=user.username,password=password)
        login(request,user)
        return HttpResponseRedirect("/feed/")
    except Exception as e:
        print(e)
        return HttpResponseRedirect("/register/")

def detail(request,question_id):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    user=request.user
    question=Question.objects.get(id=question_id)
    voted=Voted.objects.filter(question_id=question,username=user)
    if voted:
        return HttpResponseRedirect("/"+question_id+"/results/voted")
    
    context={'question':question,'username':request.user}
    return render(request,'polls/detail.html',context)

def results(request,question_id,already):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    user=request.user
    question=get_object_or_404(Question,id=question_id)
    voted=Voted.objects.filter(question_id=question,username=user)
    choice_list = question.choice_set.all()
    if not voted:
        return HttpResponseRedirect("/"+question_id+"/vote/")
    context ={}
    countries = {}
    for vote in Voted.objects.filter(question_id = question):
        country = UserProfile.objects.get(user = vote.username).location
        if countries.get(country.code):
            countries[country.code] += 1 
        else:
            countries[country.code] = 1
    #countries = [countries]
    if already:
        context={'question':question,'choices':choice_list,'voted':voted,'username':user,'countries':json.dumps(countries)}    
    else:
        context={'question':question,'choices':choice_list,'username':user,'countries':json.dumps(countries)}
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
        user=request.user
        voted=Voted(username=user,question_id=v,choice=selected_choice,voted_date=timezone.now())
        voted.save()
    return HttpResponseRedirect(reverse('polls:results',args=(v.id,)))

def about(request):
    if request.user.is_authenticated():
        user=request.user
        context={'user':user}
        return render(request,'polls/about.html',context)
    else:
        print("here")
        return render(request,'polls/about.html',{})

def questionsByCat(request,category_id):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    category=Category.objects.get(category_id=category_id)
    questions=Question.objects.filter(category_id=category)
    context={'question_list':questions,'category':category,'username':request.user}
    return render(request,'polls/ViewByIndex.html',context)

def me(request):
    return render(request,'polls/sharad.html',{})

def abhishek_profile(request):
    return render(request, 'polls/abhishek-jindal.html',{})

def profileView(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/")
    print(request.user.email)
    user=request.user
    voted=Voted.objects.filter(username=user)
    try:
    	questions = Question.objects.filter(author=user)
    	context={'user':user,'voted':voted,'questions':questions}
    except Question.DoesNotExist:
    	context={'user':user,'voted':voted}
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
    user=request.user
    q=Question.objects.create(question_text = text,category_id = category,pub_date = timezone.now(),author=user )
    for i in range(0,4):
        c=Choice(choice_text=opt[i], question=q)
        c.save()
    return HttpResponseRedirect("/"+str(q.id)+"/")

def feed(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/login/?next=/feed/")
    questions = Question.objects.all().order_by('-modified')
    context = {'questions': questions,'user':request.user}
    return render(request, 'polls/feed.html', context)

@csrf_exempt
def vote_api(request):
    if not request.user.is_authenticated():
        return HttpResponse(json.dumps({"message":"Please Sign in to continue voting."}),content_type="application/json")
    question_id = int(request.POST.get('question_id'))
    try:
        selected_choice = Choice.objects.get(pk=int(request.POST['choice_id']))
    except (KeyError, Choice.DoesNotExist):
        context ={'message':"Please select a Choice."}
        return HttpResponse(json.dumps(context),content_type="application/json")
    selected_choice.votes +=1;
    selected_choice.save();
    user = request.user
    voted=Voted(username=user,question_id_id=question_id,choice=selected_choice,voted_date=timezone.now())
    voted.save()
    choices  =Choice.objects.filter(question_id = question_id)
    results = [{"text":choice.choice_text,"votes":choice.votes} for choice in choices]
    return HttpResponse(json.dumps({"results":results}),content_type="application/json")

@csrf_exempt
def feed_api(request):
    page = int(request.GET.get('page',1))
    questions = Question.objects.all().order_by('-modified')
    paginator = Paginator(questions, 10)
    results = []
    user = request.user
    print request.user
    try:
        questions = paginator.page(page)
    except PageNotAnInteger:
        questions = paginator.page(1)
    except EmptyPage:
        questions = paginator.page(paginator.num_pages)
    for question in questions:
        serialized_data = {}
        serialized_data['id']=question.id
        serialized_data['text']=question.question_text
        serialized_data['category']=question.category_id.category_name
        serialized_data['modified']=str(timezone.now() - question.modified)
        serialized_data['description']=question.description
        is_voted = Voted.objects.filter(question_id = question, username = user).exists()
        serialized_data['is_voted'] = is_voted
        serialized_data['author']=question.author.first_name + " " + question.author.last_name
        serialized_data['choices']=[{"id":choice.id,"text":choice.choice_text} for choice in question.choice_set.all()]
        if is_voted:
            serialized_data['results'] = [{"text":choice.choice_text,"votes":choice.votes} for choice in question.choice_set.all()]
        results.append(serialized_data)
    response = {}
    response['results'] = results
    response['next'] = reverse('polls:feed_api')+"?page=" + str(page+1) if page < paginator.num_pages else None
    response['page'] = page
    return HttpResponse(json.dumps(response),content_type="application/json")

@csrf_exempt
def categories_api(request):
    categories = Category.objects.all()
    results = []
    for category in categories:
        serialized_data = {}
        serialized_data['id'] = category.id
        serialized_data['text'] = category.category_name
        serialized_data['code'] = category.category_id
        results.append(serialized_data)
    return HttpResponse(json.dumps(results), content_type="application/json")

@csrf_exempt
def addComments(request):
    text=request.POST.get('text',False)
    q_id=request.POST.get('q_id',False)
    q=get_object_or_404(Question, id=q_id)
    comment = Comments(text=text,question=q)
    print(comment)
    return HttpResponse(comment)

@csrf_exempt
def search(request,query):
    search_results = Question.objects.filter(question_text__icontains=query)
    print(query)
    reqd_results = {}
    for res in search_results:
        reqd_results[res.id]=res.question_text
    print(reqd_results)
    return HttpResponse(json.dumps(reqd_results),content_type="application/json")