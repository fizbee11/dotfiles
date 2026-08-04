#!/bin/bash

# Rofi Power Menu for Waybar
# Options: Logout, Lock, Reboot, Shutdown, Suspend

rofi -dmenu -p "Power Menu" \
    -theme-str 'entry { placeholder: "Select an option"; } listview { lines: 5; }' \
    -l 5 \
<<< "Logout
Lock
Reboot
Shutdown
Suspend" | while read -r choice; do
    case "$choice" in
        Logout) loginctl terminate-user "$(whoami)" ;;
        Lock) loginctl lock-session ;;
        Reboot) systemctl reboot ;;
        Shutdown) systemctl poweroff ;;
        Suspend) systemctl suspend ;;
    esac
done