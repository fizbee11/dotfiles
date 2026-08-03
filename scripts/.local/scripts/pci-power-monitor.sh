#!/bin/bash

status=$(cat /sys/bus/pci/devices/0000:64:00.0/power/runtime_status 2>/dev/null || echo "unknown")

if [[ "$status" == "active" ]]; then
    printf "Active\n"
elif [[ "$status" == "suspended" ]]; then
    printf "Suspended\n"
else
    printf "●<executor.css.red> $status\n"
fi
