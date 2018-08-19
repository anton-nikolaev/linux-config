Simple backup system for Linux
==============================

This is a simple autobackup script set. It is intended to use on 
ubuntu desktop with any external media (external hard-drives, large flash-usb,
large SD cards and so on).

The key feature of this script set is that backup process starts automatically,
when backup media inserted and mounted. Yes, you do not have to do anything
else - just plug in your backup media and take some coffee break, while all
your necessary files are backing up.

Another feature, is rsync under the cover. It does incremental transfers. So
the more has been changed so far from the last time you inserted your backup
media, the more copying routine will be performed. But if there is a little
changes - backup update will be very quick.

INSTALL
-------

Copy files:
```
sudo cp backup.sh backup.list /root/
sudo cp logrotate /etc/logrotate.d/backup
sudo cp 62-autobackup.rules /etc/udev/rules.d/
```

Edit BACKUP_PATH variable in /root/backup.sh script. It must be a
mountpoint of all of your removable storages. Yes, all of your storages, that
you want to use for backup, must have the same mountpoint. To change mountpoint
in /media/user directory for a particular UUID change partition label. For ex
you might use `gparted` for it: unmount a partition and then you could change
it's label with a menu.

Now edit /etc/udev/rules.d/62-autobackup.rules. You have to specify UUIDs of
all backup storage media devices you want to use. I used to backup on two
similar USB hard drives - so i have two UUIDs here. The one can be obtained
from /dev/disk/by-uuid/ directory when the drive is mounted.

Finally, install crontab:
```
sudo cp root.crontab /etc/cron.d/backup
```

Crontab checks every 5 minutes, so you have to wait not more than 5 minutes
for a backup process to start. If anything goes wrong - check log files at
/var/log/syslog and /var/log/backup.log.

NOTE: rsync do NOT delete any files by default. So if you remove some file
from your file system, rsync will NOT remove it on a backup media storage. You
have to cleanup uneccesary files yourself. This is not a problem since you
use to reformat and rebuild all backup storage media periodically.

RESTORATION
-----------

Packages:
```
sudo apt-mark auto $(cat /root/dpkgAuto.txt)
sudo apt-mark manual $(cat /root/dpkgManual.txt)
```
