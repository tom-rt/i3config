#!/bin/bash

# Usage: volume-cap.sh up | down | toggle

SINK="@DEFAULT_SINK@"

case "$1" in
  up)
    # Get current volume (first channel)
    vol=$(pactl get-sink-volume "$SINK" | grep -o '[0-9]\+%' | head -1 | tr -d '%')

    if [ "$vol" -lt 100 ]; then
        pactl set-sink-volume "$SINK" +5%
    fi
    ;;
  down)
    pactl set-sink-volume "$SINK" -5%
    ;;
  toggle)
    pactl set-sink-mute "$SINK" toggle
    ;;
esac
