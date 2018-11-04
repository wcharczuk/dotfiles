#! /bin/bash

set -e

if [ ! -d "/Volumes/Multimedia/Media/Music/iTunes" ]; then
    echo "Media drive is not mounted, aborting."
    exit 1;
fi

rsync -avz $HOME/Music/iTunes /Volumes/Multimedia/Media/Music
