from mysite.base_settings import *

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mysite',
        'USER': 'root',
        'PASSWORD': 'root',
        'HOST': 'localhost',
        'PORT': '',
        'OPTIONS': {
         "init_command": "SET foreign_key_checks = 0;",
    },
    }
}

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

# STATICFILES_DIRS = (
#    os.path.join(BASE_DIR, "static"),
# )

STATIC_URL = '/static/'

STATIC_ROOT = os.path.join(BASE_DIR, "static")

ENV_PATH = os.path.abspath(os.path.dirname(__file__))
MEDIA_ROOT = os.path.join(ENV_PATH, 'media/')

MEDIA_URL = "media/"
