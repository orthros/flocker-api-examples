FROM ubuntu:14.04
MAINTAINER Kai Davenport <kaiyadavenport@gmail.com>
RUN apt-get -y install curl
WORKDIR /srv
ADD ./example.sh /srv/example.sh
ENTRYPOINT ["bash", "example.sh"]