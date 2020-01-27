ALLOWED_HOSTS = ["*"]

# Modules in use, commented modules that you won't use
MODULES = [
    'authentication',
    'base',
    'booth',
    'census',
    'mixnet',
    'postproc',
    'store',
    'visualizer',
    'voting',
]

APIS = {
    'authentication': 'https://decide-giratina-censo.herokuapp.com/',
    'base': 'https://decide-giratina-censo.herokuapp.com/',
    'booth': 'https://decide-giratina-censo.herokuapp.com/',
    'census': 'https://decide-giratina-censo.herokuapp.com/',
    'mixnet': 'https://decide-giratina-censo.herokuapp.com/',
    'postproc': 'https://decide-giratina-censo.herokuapp.com/',
    'store': 'https://decide-giratina-censo.herokuapp.com/',
    'visualizer': 'https://decide-giratina-censo.herokuapp.com/',
    'voting': 'https://decide-giratina-censo.herokuapp.com/',
}

BASEURL = 'https://decide-giratina-censo.herokuapp.com/'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'decide',
        'PASSWORD': 'decide',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

# number of bits for the key, all auths should use the same number of bits
KEYBITS = 256
