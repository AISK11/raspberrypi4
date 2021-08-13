#!/bin/bash

# Crontab:
# */5 * * * * /home/pi/hard-disk-check.sh

ls /mnt/chia/hdd01 &&
ls /mnt/chia/hdd02 &&
ls /mnt/chia/hdd01/disk1_plots &&
ls /mnt/chia/hdd02/disk2_plots &&
echo "Disk check completed!" || echo "Error!"

