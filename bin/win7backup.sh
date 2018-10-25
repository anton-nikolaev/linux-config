#!/bin/bash

/bin/dd if=/dev/sda3 bs=1M conv=noerror,sync status=progress > /home/anton/win7backup.dd
