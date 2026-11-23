#!/bin/sh
# Remap Caps Lock to Control on the X11 layer (XWayland).
# Plasma 6 has no GUI option for Caps Lock remap on Wayland; see
# /home/asus/dev/home/ai-workstation/kde-plasma.md for details.
export DISPLAY="${DISPLAY:-:0}"
if [ -z "$XAUTHORITY" ] || [ ! -f "$XAUTHORITY" ]; then
    XAUTHORITY="$(ls /run/user/"$(id -u)"/xauth_* 2>/dev/null | head -n1)"
    export XAUTHORITY
fi
# Xwayland starts lazily; retry until the X server is up (max 60s).
for _ in $(seq 1 120); do
    if setxkbmap -option ctrl:nocaps 2>/dev/null; then
        exit 0
    fi
    sleep 0.5
done
exit 1