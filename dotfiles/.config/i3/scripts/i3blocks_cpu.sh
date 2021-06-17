#!/bin/bash

# Author: AISK11
# Description: This script shows CPU utilization in percentage.
# Created for: i3blocks

USAGE=$((10000 - $(mpstat 1 1 | tail -n 1 | rev | cut -d' ' -f1 | rev | tr -d .)))

USAGE1=$((${USAGE} / 100))
USAGE2=$((${USAGE} % 100))

# Add leading space in front of variable:
if [ ${#USAGE1} -eq 1 ]; then
    USAGE1="  ${USAGE1}"
elif [ ${#USAGE1} -eq 2 ]; then
    USAGE1=" ${USAGE1}";
fi

if [ ${#USAGE2} -eq 1 ]; then
    USAGE1=" ${USAGE1}"
fi

echo "${USAGE1}.${USAGE2}%"
echo "${USAGE1}.${USAGE2}%"

# Color
if [[ ${USAGE1} -le 33 ]]; then
    echo "#4BFF57"
elif [[ ${USAGE1} -le 66 ]]; then
    echo "#FF994A"
else
    echo "#FF4A4A"
fi

# grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'
