#!/bin/bash

SIGNAL_FILE=/root/.backup_media_mounted
BACKUP_PATH=/media/user/someMediaLabel
BACKUP_LIST=/root/backup.list

if [ ! -e ${SIGNAL_FILE} ]; then
    #echo "NOT MOUNTED";
    exit 0;
fi

echo "MOUNTED";

if [ -e ${BACKUP_PATH} ]; then
    /bin/rm ${SIGNAL_FILE};
    /usr/bin/apt-mark showauto > /root/dpkgAuto.list
    /usr/bin/apt-mark showmanual > /root/dpkgManual.list
    /usr/bin/rsync -avr --files-from=${BACKUP_LIST} / ${BACKUP_PATH}/
else
    echo "ERROR! backup path ${BACKUP_PATH} does not exist";
fi
