from django.db import models
from django.contrib.auth.models import User
import datetime

# Create your models here.

class Country(models.Model):
	name = models.CharField(max_length = 255, blank = True, null = True)
	code = models.CharField(max_length = 10, blank = True, null =True)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)
	
	def __str__(self):
		return self.code + " "+self.name


class UserProfile(models.Model):
	GENDER_CHOICES = (
		(0, 'Male'),
		(1, 'Female'),
		)
	user = models.ForeignKey(User)
	email_verification = models.BooleanField(default = False)
	location = models.ForeignKey(Country,default=119)
	about_self = models.TextField(blank=True, null=True)
	date_of_birth = models.DateField(default=datetime.datetime.strptime("1980-01-01", "%Y-%m-%d"))
	profile_update_date = models.DateTimeField(auto_now=True)
	profile_img = models.CharField(max_length=255, blank=True, null=True)
	gender = models.IntegerField(choices = GENDER_CHOICES, blank = True, null = True)
	facebook = models.CharField(max_length=200, blank=True, null=True)
	google = models.CharField(max_length=200, blank=True, null=True)
	follower_num = models.IntegerField(default=0)
	newsletters = models.IntegerField(default=0)
	slug = models.SlugField(max_length=255, blank=True, null=True)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.user
