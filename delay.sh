#!/bin/sh

# Health check handler
if [ "$1" = "--check-health" ]; then
  if [ -f /tmp/end_time ]; then
    [ $(date +%s) -ge $(cat /tmp/end_time) ]
  else
    exit 1
  fi
  exit
fi

# Set sleep duration
sleep_duration=${1:-${DELAY_SECONDS:-30}}
end_time=$(($(date +%s) + sleep_duration))
echo $end_time > /tmp/end_time

# Set up trap for clean exit
trap 'rm -f /tmp/end_time; exit 0' TERM INT

# Main delay loop
while [ $(date +%s) -lt $end_time ]; do
  sleep 1
done

# Clean up
rm -f /tmp/end_time
