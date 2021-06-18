#!/bin/bash

# Author: AISK11
# Description: This script make png print screen in ${DIRECTORY} with time as a name.
# Created for: ~/.config/i3/config:
# bindsym Print exec ~/.config/i3/scripts/i3_prtsc.sh
# Installation:
# sudo apt install scrot

DIRECTORY="/home/$(whoami)/.screenshots/"

if [ -d ${DIRECTORY} ]
then
    scrot --silent ${DIRECTORY}$(date '+%Y-%m-%d_%H:%M:%S').png
else
    mkdir -p ~/.screenshots/
    scrot --silent ${DIRECTORY}$(date '+%Y-%m-%d_%H:%M:%S').png
fi
