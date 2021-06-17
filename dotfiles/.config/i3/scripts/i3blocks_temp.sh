#!/usr/bin/env sh

# Author: AISK11
# Description: This script make png print screen in ${DIRECTORY} with time as a name.
# Created for: ~/.config/i3/config:
# bindsym Print exec ~/.config/i3/scripts/i3_prtsc.sh
# Installation:
# sudo apt install lm-sensors

BRD_TEMP_FULL=$(vcgencmd measure_temp | egrep -o '[0-9][0-9]\.[0-9]')
CPU_TEMP_FULL=$(sensors | grep temp1 | egrep -o '[0-9][0-9]\.[0-9]')

BRD_TEMP=${BRD_TEMP_FULL:0:2}
CPU_TEMP=${CPU_TEMP_FULL:0:2}

echo "CPU ${CPU_TEMP_FULL}; BRD ${BRD_TEMP_FULL}"
echo "CPU ${CPU_TEMP_FULL}; BRD ${BRD_TEMP_FULL}"

# Color
if [ ${CPU_TEMP} -lt 50 ] && [ ${BRD_TEMP} -lt 50 ]; then
    echo "#4BFF57"
elif [ ${CPU_TEMP} -lt 65 ] && [ ${BRD_TEMP} -lt 65 ]; then
    echo "#FFFF4A"  
elif [ ${CPU_TEMP} -lt 80 ] && [ ${BRD_TEMP} -lt 80 ]; then
    echo "#FF994A"
elif [ ${CPU_TEMP} -lt 85 ] && [ ${BRD_TEMP} -lt 85 ]; then
    echo "FFFF4A"
else
    echo "#FF4A4A"
fi
