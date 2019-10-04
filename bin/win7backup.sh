#!/bin/bash

DRIVE=/dev/sda3
WIN7DUDIR=/home/anton/win7du

/bin/umount -v $DRIVE
/bin/mount -v $DRIVE /root/mnt
/bin/rm -rv /root/mnt/Windows/SoftwareDistribution/*
/bin/rm -rv /root/mnt/Users/ANikolaev/AppData/Local/Temp/*
/usr/bin/du -h /root/mnt/ > $WIN7DUDIR/dump.`date +%Y%m%d%H%M%S`
/bin/umount -v $DRIVE
/bin/dd if=$DRIVE bs=1M conv=noerror,sync status=progress > /home/anton/win7backup.dd
