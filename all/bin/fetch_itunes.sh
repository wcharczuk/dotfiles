#! /bin/bash

set -e

if [ ! -d "/Volumes/Multimedia/Media/Music/iTunes" ]; then
    echo "Media drive is not mounted, aborting."
    exit 1;
fi

rsync -avz /Volumes/Multimedia/Media/Music/iTunes $HOME/Music
