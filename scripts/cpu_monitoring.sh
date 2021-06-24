#!/bin/bash

# send alarm, if CPU is above ${ALERT_VALUE}% ${TIME_COUNT} times when measured, measure interval = ${TIME_INTERVAL} seconds.
# example: send alarm, if CPU is above 90% 5 times when measured, measure interval = 60 seconds

# customize vlaues:
ALERT_VALUE=0
TIME_INTERVAL=1
TIME_COUNT=5
AFTER_ALARM_SLEEP=10
LOG_FILE="/var/log/alarms.log"

# System variable, do not edit!
STRIKES=0
CPU_HISTORY=()

while true; do
    # get CPU percentage usage:
    CPU_USAGE=$((10000 - $(mpstat 1 1 | tail -n 1 | rev | cut -d' ' -f1 | rev | tr -d .)))
    CPU_USAGE_PERCENTILE=$((${CPU_USAGE} / 100))
          
    # compare percentage to alert value, if greater or equal, then add 1 strike, else remove strikes
    if [[ ${CPU_USAGE_PERCENTILE} -ge ${ALERT_VALUE} ]]; then
        STRIKES=$((${STRIKES} + 1))
        CPU_HISTORY[${STRIKES}+1]=${CPU_USAGE_PERCENTILE}
    else
        STRIKES=0
    fi  
        
    # if strikes are equal (or greater) than TIME_COUNT, append alarm to FILE
    if [[ ${STRIKES} -ge ${TIME_COUNT} ]]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ALERT! - CPU USAGE is above ${ALERT_VALUE}, measured every ${TIME_INTERVAL} seconds. Values: ${CPU_HISTORY}" >> ${LOG_FILE}        STRIKES=0
        sleep ${AFTER_ALARM_SLEEP}
    fi      

    # wait a little while before measuring CPU USAGE again:
    sleep ${TIME_INTERVAL}
done
