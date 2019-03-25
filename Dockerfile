FROM python:3.6
MAINTAINER Sheesh Mohsin <sheeshmohsin@gmail.com>

# arbitrary location choice: you can change the directory
RUN mkdir -p /python/
WORKDIR /python/mysite

ADD requirements.txt /python/
RUN pip install --no-cache-dir -r /python/requirements.txt

# copy our project code
ADD . /python

# expose the port 8000
EXPOSE 8000

# define the default command to run when starting the container
CMD ["gunicorn", "--chdir", "/python/mysite", "--bind", ":8000", "mysite.wsgi:application"]
