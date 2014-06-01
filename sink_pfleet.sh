#! /bin/sh

docker kill pfleet_sickbeard && docker rm pfleet_sickbeard
docker kill pfleet_sabnzbd && docker rm pfleet_sabnzbd
docker kill pfleet_plex && docker rm pfleet_plex
