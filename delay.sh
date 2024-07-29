#!/bin/sh

sleep_duration=${1:-30}
end_time=$(($(date +%s) + sleep_duration))

health_check() {
  [ $(date +%s) -ge $end_time ]
}

trap 'exit 0' TERM INT

while ! health_check; do
  sleep 1
done
