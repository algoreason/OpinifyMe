import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# Create your models here.
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published',default=timezone.now)
    category_id = models.ForeignKey('Category',default='1001')
    author=models.ForeignKey(User,default='1')
    def __str__(self):
        return self.question_text
    def was_published_recently(self):
        return timezone.now() >= self.pub_date >= timezone.now() - datetime.timedelta(days=1)


class Choice(models.Model):
    question = models.ForeignKey(Question)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    def __str__(self):
        return self.choice_text

class Category(models.Model):
    category_id = models.CharField(max_length=200)
    category_color = models.CharField(max_length=10)
    category_name = models.CharField(max_length=400)
    def __str__(self):
        return self.category_id

class Voted(models.Model):
    username=models.ForeignKey(User,default='101')
    question_id=models.ForeignKey('Question',default='101')
    choice=models.ForeignKey('Choice',default='101')
    voted_date = models.DateTimeField('date voted',default=timezone.now)
    def __str__(self):
        return str(self.username)+"-"+str(self.question_id)+"-"+str(self.choice)+"-"+str(self.voted_date)

class Comments(models.Model):
    text=models.TextField()
    comment_date = models.DateTimeField(default=timezone.now)
    author = models.ForeignKey(User,default='1')
    question=models.ForeignKey(Question,default='1')
    def __str__(self):
        return str(self.text)+" By "+str(self.author)