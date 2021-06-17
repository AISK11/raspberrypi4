#!/usr/bin/env sh

# Author: AISK11
# Description: This script shows how much RAM is used (buff/cache) in percentage.
# Created for: i3blocks

# https://github.com/KittyKatt/screenFetch/issues/386#issuecomment-249312716
# USED_MEM = MemTotal + Shmem - MemFree - Buffers - Cached - SReclaimable
# values are in kb from /proc/meminfo

MemTotal=$(cat /proc/meminfo | grep MemTotal | tr -s ' ' | cut -d' ' -f2)
Shmem=$(cat /proc/meminfo | grep Shmem | tr -s ' ' | cut -d' ' -f2)
MemFree=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d' ' -f2)
Buffers=$(cat /proc/meminfo | grep Buffers | tr -s ' ' | cut -d' ' -f2)
Cached=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d' ' -f2)
SReclaimable=$(cat /proc/meminfo | grep SReclaimable | tr -s ' ' | cut -d' ' -f2)

USED_MEM=$((${MemTotal} + ${Shmem} - ${MemFree} - ${Buffers} - ${Cached} - ${SReclaimable}))

# Show RAM usage in percentage.
echo "$((USED_MEM * 100 / MemTotal))%"
