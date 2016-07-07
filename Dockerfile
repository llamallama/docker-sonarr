FROM ubuntu:xenial 
MAINTAINER Chris Smith <chris87@gmail.com> 

RUN \
  apt-get update && \
  apt-get -y install apt-transport-https && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
  echo "deb https://apt.sonarr.tv/ master main" > /etc/apt/sources.list.d/sonarr.list && \
  apt-get update && \
  apt-get -y install \
    nzbdrone=2.0.0.4230

EXPOSE 8989 

VOLUME /config
VOLUME /downloads
VOLUME /destination

WORKDIR /opt/NzbDrone

CMD ["mono", "/opt/NzbDrone/NzbDrone.exe", "--nobrowser", "--data=/config"]

