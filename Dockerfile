#Use the python 3 base image.
FROM python:3-slim

#Expose ports
EXPOSE 5001

# Setup work directory.
WORKDIR /python-docker

# Copy the requirements file to the container and the install depenedencies.
COPY requirements.txt /python-docker

RUN pip3 install -r requirements.txt

# set environment variables\
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . /python-docker

ENTRYPOINT [ "gunicorn" ]
CMD [ "--bind","0.0.0.0:5001","shyparty:app" ]

