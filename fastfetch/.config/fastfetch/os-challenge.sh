#!/usr/bin/env bash
# Host-aware OS challenge progress for fastfetch.
# Reads os-challenges.conf next to this script and prints one line, e.g.:
#   CachyOS: 207 days done, 158 days left
# Prints nothing (and fastfetch hides the module) when no entry matches.
set -euo pipefail

conf="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/os-challenges.conf"
[ -r "$conf" ] || exit 0

os_key="$(. /etc/os-release && printf '%s' "$ID")"
if grep -qiE 'microsoft|wsl' /proc/version 2>/dev/null; then
    os_key="${os_key}-wsl"
fi

host="$(hostname 2>/dev/null || cat /etc/hostname 2>/dev/null || true)"

line="" osline="" default=""
while read -r key label start end _ || [ -n "$key" ]; do
    case "$key" in '' | \#*) continue ;; esac
    if [ "$key" = "$host" ] && [ -z "$line" ]; then
        line="$key $label $start $end"
    elif [ "$key" = "$os_key" ] && [ -z "$osline" ]; then
        osline="$key $label $start $end"
    elif [ "$key" = '*' ] && [ -z "$default" ]; then
        default="$key $label $start $end"
    fi
done < "$conf"

line="${line:-${osline:-$default}}"
[ -n "$line" ] || exit 0
# shellcheck disable=SC2086
set -- $line
label="$2" start="$3" end="$4"

now="$(date +%s)"
s="$(date -d "$start" +%s)"
e="$(date -d "$end" +%s)"

if [ "$now" -lt "$s" ]; then
    echo "$label: starts in $(( (s - now) / 86400 )) days"
elif [ "$now" -ge "$e" ]; then
    echo "$label: finished $(( (now - e) / 86400 )) days ago"
else
    echo "$label: $(( (now - s) / 86400 )) days done, $(( (e - now) / 86400 )) days left"
fi