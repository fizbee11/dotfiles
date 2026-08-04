#!/bin/bash

# NVIDIA GPU Power State Monitor for Waybar
# Check GPU power state via PCI runtime status (safe - doesn't wake GPU)
# Output JSON for Waybar

PCI_DEVICE="/sys/bus/pci/devices/0000:64:00.0"
GPU_STATUS_FILE="$PCI_DEVICE/power/runtime_status"

# Check if NVIDIA GPU PCI device exists
if [[ ! -d "$PCI_DEVICE" ]]; then
    exit 0
fi

# Read GPU runtime status (safe to read, doesn't wake GPU)
if [[ -f "$GPU_STATUS_FILE" ]]; then
    STATUS=$(cat "$GPU_STATUS_FILE" 2>/dev/null | tr -d '\n')
else
    exit 0
fi

# Initialize output
TEXT="󰢮"
CLASS=""
COLOR=""

# Determine state and styling based on runtime_status
# "active" = D0 (GPU awake/running), "suspended" = D3cold (GPU suspended)
if [[ "$STATUS" == "active" ]]; then
    CLASS="active"
    COLOR="#a6e3a1"
else
    CLASS="suspended"
    COLOR="#cdd6f4"
fi

# Build tooltip with runtime status info
TOOLTIP="NVIDIA GPU: ${STATUS^^}"
if [[ "$STATUS" == "active" ]]; then
    TOOLTIP="NVIDIA GPU: Active"
fi

# Output JSON for Waybar
if [[ -n "$CLASS" ]]; then
    echo "{\"text\": \"$TEXT\", \"class\": \"$CLASS\", \"color\": \"$COLOR\", \"tooltip\": \"$TOOLTIP\"}"
fi