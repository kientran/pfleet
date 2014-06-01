#! /bin/sh

# Plex can't start with an orphaned pid file.
rm -f "/config/Library/Application Support/Plex Media Server/plexmediaserver.pid"

# Plex always runs as daemon
start_pms
sleep 5

# tail server logs to input since start_pms daemonizes plex
tail -f /config/Library/Application\ Support/Plex\ Media\ Server/Logs/**/*.log
