#! /bin/bash

set -e

if [ ! -d "/Volumes/Multimedia/Photos/Lightroom" ]; then
    echo "Media drive is not mounted, aborting."
    exit 1;
fi

rsync -avz /Volumes/Multimedia/Photos/Lightroom $HOME/Pictures
