#! /bin/sh

docker build -t pfleet/sabnzbd docker-sabnzbd/.
docker build -t pfleet/sickbeard docker-sickbeard/.
docker build -t pfleet/plexmediaserver docker-plexmediaserver/.
