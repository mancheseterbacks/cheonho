FROM ubuntu:latest

LABEL : cheonho
ENV TZ Asia/Seoul

WORKDIR /home/app

RUN apt-get update && apt-get install -y
RUN apt-get install pip3
RUN apt-get install nginx
RUN service nginx start

EXPOSE 8081

ENTRYPOINT["bin/df", "-h"]
