#!/bin/bash

# NVIDIA GPU Power State Monitor for Waybar
# Check GPU power state and output JSON for Waybar

GPU_CARD="/sys/class/drm/card1"
GPU_STATE_FILE="$GPU_CARD/device/power_state"

# Check if NVIDIA GPU exists
if [[ ! -d "$GPU_CARD" ]]; then
    exit 0
fi

# Read GPU power state
if [[ -f "$GPU_STATE_FILE" ]]; then
    STATE=$(cat "$GPU_STATE_FILE" 2>/dev/null | tr -d '\n')
else
    exit 0
fi

# Initialize output
TEXT="󰢮"
CLASS=""
COLOR=""

# Determine state and styling
if [[ "$STATE" == "D0" ]]; then
    CLASS="active"
    COLOR="#a6e3a1"
else
    CLASS="suspended"
    COLOR="#cdd6f4"
fi

# Get power draw from nvidia-smi if available and GPU active
TOOLTIP="NVIDIA GPU: ${STATE^^}"
if [[ "$STATE" == "D0" ]] && command -v nvidia-smi &>/dev/null; then
    POWER=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits 2>/dev/null | head -1)
    if [[ -n "$POWER" ]]; then
        TOOLTIP="NVIDIA GPU: Active (${POWER}W)"
    fi
fi

# Output JSON for Waybar
if [[ -n "$CLASS" ]]; then
    echo "{\"text\": \"$TEXT\", \"class\": \"$CLASS\", \"color\": \"$COLOR\", \"tooltip\": \"$TOOLTIP\"}"
fi