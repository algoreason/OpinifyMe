from django.template import Library
register = Library()
@register.filter
def percent(num,den):
	print("Here")
	per= (num/den)*100;
	return str(round(per, 2));
   