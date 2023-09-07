#!/bin/sh
set -e

CRYPT_PART=/dev/md0
CRYPT_NAME=bigdatacrypt
CRYPT_MNT=/mnt/bigdata


if ! sudo cryptsetup status $CRYPT_NAME > /dev/null; then
        sudo cryptsetup luksOpen $CRYPT_PART $CRYPT_NAME
fi

if ! mountpoint -q $CRYPT_MNT
then
        sudo mount /dev/mapper/$CRYPT_NAME $CRYPT_MNT
else
        echo "$CRYPT_MNT already mounted"
fi

sudo service smbd start
sudo service nmbd start
sudo service avahi-daemon start
sudo systemctl start plexmediaserver.service
