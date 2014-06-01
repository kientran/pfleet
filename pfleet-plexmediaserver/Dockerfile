FROM dockerfile/ubuntu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yq upgrade

# Unofficial repo. squeeze distro
RUN echo "deb http://shell.ninthgate.se/packages/debian squeeze main" > /etc/apt/sources.list.d/plexmediaserver.list
RUN curl http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | apt-key add -
RUN apt-get -q update

RUN apt-get install -qy plexmediaserver

# Default web port 32400
# Additonal ports for UPNP/DLNA/bonjour
EXPOSE 32400 1900 32410 32412 32413 32414 32469 5353 32443

# TV Folder
VOLUME ["/tv"]

# Movie Folder
VOLUME ["/movies"]

# Music Folder
VOLUME ["/music"]

# Config file and database
VOLUME ["/config"]

# Plex needs a tmp for transcodes
VOLUME ["/tmp"]

# Plex defaults to store everything inside the user's home folder
# Rather than hack the /etc/default and start_pms scripts, just move
# the home folder to trick it.
ENV HOME /config

# If docker quits, pid won't get deleted.
# Delete orphaned PID then start Plex

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

ENTRYPOINT ["/start.sh"]
