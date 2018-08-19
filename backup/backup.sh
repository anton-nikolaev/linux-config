#!/bin/bash

SIGNAL_FILE=/root/.backup_media_mounted
BACKUP_PATH=/media/anton/backup
BACKUP_LIST=/root/backup.list

if [ ! -e ${SIGNAL_FILE} ]; then
    #echo "NOT MOUNTED";
    exit 0;
fi

#echo "MOUNTED";
/bin/rm ${SIGNAL_FILE};

if [ -e ${BACKUP_PATH} ]; then
    /usr/bin/apt-mark showauto > /root/dpkgAuto.list
    /usr/bin/apt-mark showmanual > /root/dpkgManual.list
    /usr/bin/rsync -avr --files-from=${BACKUP_LIST} / ${BACKUP_PATH}/
    /usr/bin/touch ${BACKUP_PATH}/.backup_last_update
else
    echo "ERROR! backup path ${BACKUP_PATH} does not exist";
fi
