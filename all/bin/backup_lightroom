#! /bin/bash

set -e

if [ ! -d "/Volumes/Multimedia/Photos/Lightroom" ]; then
    echo "Media drive is not mounted, aborting."
    exit 1;
fi

rsync -avz $HOME/Pictures/Lightroom /Volumes/Multimedia/Photos
