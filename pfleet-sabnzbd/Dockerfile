FROM dockerfile/ubuntu

# Enable multiverse for unrar
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty main multiverse' /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yq upgrade

# Dependencies
RUN apt-get -yq install unrar par2 unzip python-yenc

# Add jcfp sabnzbd repo (unofficial, but recomended) for easier install via apt
RUN add-apt-repository ppa:jcfp/ppa
RUN apt-get -q update

RUN apt-get -yq install sabnzbdplus
RUN apt-get -yq install sabnzbdplus-theme-mobile

# Default sabznbd port
EXPOSE 8080

# Download working folder
VOLUME ["/downloads"]

# Config file and database
VOLUME ["/config"]

ENTRYPOINT ["sabnzbdplus", "--browser", "0","--config-file", "/config" ]

CMD["--server", ":8080"]