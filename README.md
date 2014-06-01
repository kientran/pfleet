pfleet
======

Docker files and scripts to launch Sabnzbd Plex SickBeard

## Requirements
* Docker - http://docker.io
* Tested on Ubuntu 14.04 LTS Server

## Volumes

All docker containers expose /config to store their configurations.  Map /config
 to your host machine's configuration store for each service

### Plex Volumes
* /tv - Processed Tv folders
* /movies - Processed Movies folder
* /config - config files and database
* /tmp - Plex neeeds a place to hold transcodes

### Sabnzbd+ Volumes
* /config - configuration file and database
* /downloads - incomplete/complete download folder

### SickBeard Volumes
* /config - Configuration file and database
* /downloads - completed downloads folder
* /tv - Procesed TV folders

## Build the Fleet
You can build the entire fleet of Docker containers with
```
./build_pfleet.sh
```

## Start the fleet

Each container needs to map the appropriate ports and volumes to the host system

```
docker run -d -p 8080:8080 \
  -v /ssd_zfs/docker-data/sabnzbd:/config \
  -v /ssd_zfs/downloads:/downloads \
  --name pfleet_sabnzbd pfleet/sabnzbd
```
Here we map the host storage to /config and /downloads

See launch_pfleet.sh for an example of how to start the containers.

Modify launch_pfleet.sh to your needs and start it with

```
./launch_pfleet.sh
```

### PlexMediaServer Host Networking
Note that PlexMediaServer uses mDNS/avahi for its services.  While it can work
inside of a normal docker container, it's easier to bind the container to the
host network.

```
docker run --net=host -t -i -d -P \
  -v /ssd_zfs/docker-data/plexmediaserver:/config \
  -v /ssd_zfs/tv:/tv \
  -v /ssd_zfs/tmp:/tmp \
  --name pfleet_plex pfleet/plexmediaserver
```

If you have no need for the mDNS/avahi services, you can run it normally and
only expose the default port 34200.

### PlexMediaServer segfault
PlexMediaServer is prone to segfaulting on the initial start if the config files
do not exist yet.  It will create the needed files, but then crash.  Simply
restart the container again and it should come up.

## Setup and Access Services

Configure your services via their first run wizards.  Choose mapped VOLUME
folders as need.

Services are available at

* Sabnzbd - http://localhost:8080
* SickBeard - http://localhost:8081
* Plex - http://HOST-IP:34200 (Plex will not respond to localhost)

## Sink the fleet
You can stop and destroy all the containers with the included script
```
./sink_pfleet.sh
```
