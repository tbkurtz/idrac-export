#!/bin/bash

# wc -L < .secrets
HOST=$(sed -n '2 p' .secrets | awk -F ',' '{print $1}')
ADDR=$(sed -n '2 p' .secrets | awk -F ',' '{print $2}')
USER=$(sed -n '2 p' .secrets | awk -F ',' '{print $3}')
PASS=$(sed -n '2 p' .secrets | awk -F ',' '{print $4}')

echo "$HOST"
echo "$ADDR"
echo "$USER"
echo "$PASS"

LOG='idrac.log'
/bin/touch "$LOG"; /bin/chmod 777 "$LOG"
while true; do
    {
        /bin/bash scripts/fanspeed.sh "$HOST" "$ADDR" "$USER" "$PASS"
        /bin/bash scripts/pwr_consumption.sh "$HOST" "$ADDR" "$USER" "$PASS"
        /bin/bash scripts/temp_board.sh "$HOST" "$ADDR" "$USER" "$PASS"
    } | tee "$LOG"
    sleep 5
done
exit 0