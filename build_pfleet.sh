#! /bin/sh

#docker build -t pfleet/sabnzbd pfleet-sabnzbd/.
docker build -t pfleet/sabnzbd pfleet-sabnzbd_mp4convert/.
docker build -t pfleet/sickbeard pfleet-sickbeard/.
docker build -t pfleet/plexmediaserver pfleet-plexmediaserver/.
