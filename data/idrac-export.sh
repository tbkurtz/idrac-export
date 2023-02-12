#!/bin/bash

# wc -L < .secrets
HOST=$(sed -n '2 p' .secrets | awk -F ',' '{print $1}')
ADDR=$(sed -n '2 p' .secrets | awk -F ',' '{print $2}')
USER=$(sed -n '2 p' .secrets | awk -F ',' '{print $3}')
PASS=$(sed -n '2 p' .secrets | awk -F ',' '{print $4}')

LOG='idrac.log'
/bin/touch "$LOG"; /bin/chmod 777 "$LOG"
while true; do
    {
        /bin/bash /app/scripts/fanspeed.sh "$HOST" "$ADDR" "$USER" "$PASS"
        /bin/bash /app/scripts/pwr_consumption.sh "$HOST" "$ADDR" "$USER" "$PASS"
        /bin/bash /app/scripts/temp_board.sh "$HOST" "$ADDR" "$USER" "$PASS"
    } &> "$LOG"
    sleep 5
done
exit 0