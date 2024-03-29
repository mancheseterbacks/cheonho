FROM ubuntu:latest

LABEL version=0.1 

ENV NAME “CHEONHO”
ENV AGE 43

WORKDIR /app

ADD . /app

RUN apt-get update && apt-get update -y 
RUN apt-get install curl -y
RUN apt-get install nginx -y
RUN service nginx start

EXPOSE 80

ENTRYPOINT  [“bin/dh”, “-h”]
