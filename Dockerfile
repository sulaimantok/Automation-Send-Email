FROM ubuntu:18.04

WORKDIR /email

ADD . /email

RUN apt-get update -y && apt-get install -y sendemail libnet-ssleay-perl libcrypt-ssleay-perl libio-socket-ssl-perl libio-socket-inet6-perl

CMD ["bash", "sendmail.sh"]