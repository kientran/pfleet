pfleet
======

Docker files and scripts to launch Sabnzbd Plex SickBeard

## Volumes

All docker containers expose /config to store their configurations.  Map /config to your host machine's configuration store for each service

### Plex Volumes

* /tv - Processed Tv folders
* /movies - Processed Movies folder
* /config - config files and database
* /tmp - Plex neeeds a place to hold transcodes

### Sabnzbd+ Valumes
* /config - configuration file and database
* /downloads - incomplete/complete download folder

### SickBeard Volumes

* /config - Configuration file and database
* /downloads - completed downloads folder
* /tv - Procesed TV folders 

## Start the fleet 

Each container needs to map the appropriate ports and volumes to the host system.

See launch_pfleet.sh for an example of how to start the containers.

Note that sabnzbd uses an extra scripts folder that includes the scripts from SickBeard.  Those scripts should be added manually:
