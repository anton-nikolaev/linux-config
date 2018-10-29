#!/bin/bash

DRIVE=/dev/sda3

/bin/umount -v $DRIVE
/bin/mount -v $DRIVE /root/mnt
/bin/rm -rv /root/mnt/Windows/SoftwareDistribution/*
/bin/rm -rv /root/mnt/Users/ANikolaev/AppData/Local/Temp/*
/bin/umount -v $DRIVE
/bin/dd if=$DRIVE bs=1M conv=noerror,sync status=progress > /home/anton/win7backup.dd
