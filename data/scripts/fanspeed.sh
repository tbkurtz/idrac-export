#!/bin/bash

echo -e "---\nStarting Fan Speed Monitoring\n----"

host="$1"
addr="$2"
user="$3"
pass="$4"

graphite=192.168.42.171
graphite_port=2003

date=$(date +%s)
for fan in Fan{1..6}; do
    rpm=''
    rpm=$(
        ipmitool -I lanplus -H "${addr}" -U "${user}" -P "${pass}" \
            sdr get "${fan}" \
            | grep 'Sensor Reading' \
            | awk -F'[^0-9]*' '$0=$2'
    )
    echo "stats.r730idrac.fans.${fan}.rpm ${rpm} ${date}"
    echo "stats.r730idrac.fans.${fan}.rpm ${rpm} ${date}" \
        | nc -v -w 1 $graphite $graphite_port &
done
