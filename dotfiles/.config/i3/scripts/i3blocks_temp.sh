#!/usr/bin/env sh

# Author: AISK11
# Description: This script make png print screen in ${DIRECTORY} with time as a name.
# Created for: ~/.config/i3/config:
# bindsym Print exec ~/.config/i3/scripts/i3_prtsc.sh
# Installation:
# sudo apt install lm-sensors

BOARD_TEMP=$(vcgencmd measure_temp | egrep -o '[0-9][0-9]\.[0-9]')
CPU_TEMP=$(sensors | grep temp1 | egrep -o '[0-9][0-9]\.[0-9]')

echo "CPU ${CPU_TEMP}; BRD ${BOARD_TEMP}"
