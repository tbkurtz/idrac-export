#!/bin/bash

echo -e "---\nStarting Power Consumption Monitoring\n---"

host="$1"
addr="$2"
user="$3"
pass="$4"

graphite=192.168.42.171
graphite_port=2003

date=$(date +%s)
result=$(
    ipmitool -I lanplus -H "${addr}" -U "${user}" -P "${pass}" \
        sdr get "Pwr Consumption" \
        | grep "Sensor Reading" \
        | awk -F'[^0-9]*' '$0=$2'
)
echo "stats.r730idrac.pwr.consumption.watts ${result} ${date}"
echo "stats.r730idrac.pwr.consumption.watts ${result} ${date}" \
    | nc -v -w 1 $graphite $graphite_port &


