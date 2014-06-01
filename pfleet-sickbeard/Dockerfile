FROM dockerfile/ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yq upgrade

# Dependencies
RUN apt-get -yq install python python-cheetah

RUN git clone git://github.com/midgetspy/Sick-Beard.git sickbeard

# Default sabznbd port
EXPOSE 8081

# Download working folder
VOLUME ["/downloads"]

VOLUME ["/tv"]

# Config file and database
VOLUME ["/config"]

ENTRYPOINT ["python", "sickbeard/SickBeard.py", "--nolaunch", "--datadir=/config"]

CMD ["--port=8081"]
