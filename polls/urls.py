from django.conf.urls import url

from . import views

urlpatterns = [
	url(r'^about/$',views.about, name='about'),
	url(r'^register/$',views.registerInit, name='registerInit'),
	url(r'^registerNew/$',views.register, name='register'),
	url(r'^cats/$',views.categoryInit, name='categoryInit'),
	url(r'^categories/(?P<category_id>[a-zA-Z]+)$',views.questionsByCat, name='category_proc'),
	url(r'^l*o*g*i*n*/*$',views.loginInitialization, name='loginInitialization'),
	url(r'^login/(?P<error>error)$',views.loginRetry, name='loginRetry'),
	url(r'^logout/$',views.logout_view, name='logout'),
	url(r'^login/auth/$',views.login_proc, name='loginAuth'),
    url(r'^index/$', views.index, name='index'),
    url(r'^(?P<question_id>[0-9]+)/$',views.detail,name='detail'),
    url(r'^(?P<question_id>[0-9]+)/results/(?P<already>[a-z])*$',views.results,name='results'),
    url(r'^(?P<question_id>[0-9]+)/vote/$',views.vote,name='vote'),
    url(r'^profileView/$',views.profileView,name='profileView'),
]
