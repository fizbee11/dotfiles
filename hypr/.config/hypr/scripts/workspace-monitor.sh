#!/usr/bin/env bash

EXTERNAL="HDMI-A-1"
INTERNAL="desc:Samsung Display Corp. ATNA40CU05-0"

if hyprctl monitors | grep -q "^Monitor $EXTERNAL"; then
    PRIMARY="$EXTERNAL"
else
    PRIMARY="$INTERNAL"
fi

# Move workspaces 1-9 to the primary monitor
for ws in {1..9}; do
    hyprctl dispatch moveworkspacetomonitor "$ws" "$PRIMARY"
done

# Optional: dedicate workspace 10 to the laptop display when docked
if [ "$PRIMARY" = "$EXTERNAL" ]; then
    hyprctl dispatch moveworkspacetomonitor 10 "$INTERNAL"
else
    hyprctl dispatch moveworkspacetomonitor 10 "$INTERNAL"
fi


# Reload Waybar
pkill -x waybar
nohup waybar >/dev/null 2>&1 &
