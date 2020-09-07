from python:alpine

RUN apk --update add --no-cache git postgresql-dev gcc libc-dev
RUN apk add --no-cache gcc g++ make libffi-dev python3-dev build-base zlib-dev

#RUN pip install gunicorn
RUN pip install --upgrade pip
RUN pip install pillow==2.0
RUN pip install psycopg2-binary==2.7.4
RUN pip install ipdb
RUN pip install ipython

WORKDIR /app

RUN git clone https://github.com/EGC-GIRATINA/decide.git .
RUN git checkout examen_septiembre
RUN pip install -r requirements.txt

WORKDIR /app/decide

# local settings.py
ADD docker-settings.py /app/decide/local_settings.py

RUN ./manage.py collectstatic

#CMD ["gunicorn", "-w 5", "decide.wsgi", "--timeout=500", "-b 0.0.0.0:5000"]
