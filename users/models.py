from django.db import models
from django.contrib.auth.models import User
import datetime
from django.dispatch import receiver
from django.db.models.signals import post_save,pre_save

@receiver(post_save, sender=User)
def create_user_profile(sender, instance=None, created=False, **kwargs):
    if created:
        UserProfile.objects.create(user = instance)

@receiver(pre_save, sender = User)
def save_user(sender, instance = None, **kwargs):
	instance.username = generate_username(instance.first_name, instance.last_name)
# Create your models here.

def generate_username(firstname, lastname):
	firstname = '-'.join(firstname.split(" "))
	lastname = '-'.join(lastname.split(" "))
	username = "{0}-{1}".format(firstname, lastname).lower()
	x=0
	#print(settings.AUTH_USER_MODEL)
	while True:
		if x==0 and User.objects.filter(username=username).count() == 0:
			return username
		else:
			new_username = "{0}{1}".format(username, x)
			if User.objects.filter(username=new_username).count() == 0:
				return new_username
		x += 1
		if x > 1000000:
			raise Exception("Wow! Amazingly popular name")

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
	is_complete = models.BooleanField(default = False)
	email_verification = models.BooleanField(default = False)
	location = models.ForeignKey(Country,default=119)
	about_self = models.TextField(blank=True, null=True)
	nationality = models.CharField(max_length = 255, blank = True, null = True)
	religion = models.CharField(max_length = 255, blank =True, null = True)
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
		return str(self.user)
