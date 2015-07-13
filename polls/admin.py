from django.contrib import admin

# Register your models here.
from polls.models import Question,Choice,Category
from django.contrib.sessions.models import Session
from django.contrib.auth.models import User

class ChoiceInLine(admin.TabularInline):
    model = Choice
    #extra=4

class SessionAdmin(admin.ModelAdmin):
    def _session_data(self, obj):
        return obj.get_decoded()
    list_display = ['session_key', '_session_data', 'expire_date']

class CategoryAdmin(admin.ModelAdmin):
    fieldsets=[('Category Info', {'fields':['category_id','category_name']}),]
    list_display = ('category_id','category_name')

class QuestionAdmin(admin.ModelAdmin):
    fieldsets=[
        ('Question Info', {'fields':['question_text','category_id']}),
        ('Date Info', {'fields':['pub_date'],'classes':['collapse']}),
        ]
    inlines = [ChoiceInLine]
    list_display = ('question_text','pub_date','category_id', 'was_published_recently')
    list_filter = ['pub_date']
    search_fields = ['question_text']

admin.site.register(Question,QuestionAdmin)
admin.site.register(Session, SessionAdmin)
admin.site.register(Category,CategoryAdmin)
