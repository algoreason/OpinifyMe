from django.conf.urls import url

from . import views

urlpatterns = [
	url(r'^thecreator/$',views.me, name='me'),
	url(r'^creator/$',views.abhishek_profile, name='abhishek_profile'),
	url(r'^about/$',views.about, name='about'),
	url(r'^api/categories/$',views.categories_api, name='categories_api'),
	url(r'^api/feed/$',views.feed_api, name='feed_api'),
	url(r'^api/vote/$',views.vote_api,name='vote_api'),
	url(r'^completeProfile/$',views.complete_profile_page,name='complete_profile_page'),
	url(r'^signup/$',views.complete_profile_submit,name='signup'),
	url(r'^feed/$',views.feed, name='feed'),
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
    url(r'^addQues/$',views.addQues,name='addQues'),
    url(r'^addComment/$',views.addComments,name='addComment'),
    url(r'^newQuestion/$',views.newQuestion,name='newQuestion'),
    url(r'^search/(?P<query>[a-zA-Z ]+)/$',views.search,name='search'),
]