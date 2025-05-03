import os
import environ

from .base import *

env = environ.Env()
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))


DEBUG = True

SECRET_KEY = env('SECRET_KEY')

ALLOWED_HOSTS = env('ALLOWED_HOSTS').split(' ')


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}