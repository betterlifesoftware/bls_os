#!/bin/sh
### BEGIN INIT INFO
# Provides:          filenotifier
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Something
# Description:       Something else
### END INIT INFO

inotifywait -m /printing -e create -e moved_to |
    while read dir action file; do
        echo "The file '$file' appeared in directory '$dir' via '$action'"
        echo $file
        path="/printing/"
        fullpath="$path$file"
        echo "$fullpath"
        lp -d burger "$fullpath"
        rm "$fullpath"
    done
