#!/bin/bash

/bin/dd if=/home/anton/win7backup.dd of=/dev/sda3 status=progress bs=1M conv=sync,noerror
