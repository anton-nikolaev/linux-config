Helpers for Linux
=================

Mount VDI/VMDK images 
---------------------

Create and mount:
```
sudo qemu-nbd -c /dev/nbd0 VBoxVMs/localbox.vdi
sudo mount /dev/nbd0p1 /mnt 
```

Umount and remove (it is safe - vdi file will NOT be removed):
```
sudo umount /mnt
sudo qemu-nbd -d /dev/nbd0
```
