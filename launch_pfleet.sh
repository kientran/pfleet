#! /bin/sh

docker run -d -p 8081:8081 \
  -v /ssd_zfs/docker-data/sickbeard:/config \
  -v /ssd_zfs/downloads:/downloads \
  -v /ssd_zfs/tv:/tv \
  --name pfleet_sickbeard pfleet/sickbeard

docker run -d -p 8080:8080 \
  -v /ssd_zfs/docker-data/sabnzbd:/config \
  -v /ssd_zfs/downloads:/downloads \
  -v /ssd_zfs/docker-data/scripts:/scripts \
  --name pfleet_sabnzbd pfleet/sabnzbd

docker run --net=host -t -i -d -P \
  -v /ssd_zfs/docker-data/plexmediaserver:/config \
  -v /ssd_zfs/tv:/tv \
  -v /ssd_zfs/tmp:/tmp \
  --name pfleet_plex pfleet/plexmediaserver
