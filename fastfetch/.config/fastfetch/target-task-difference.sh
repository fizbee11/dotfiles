#!/bin/bash
time2="01/31/2027 12:00AM"
let current=$(date +%s)
timestamp2=$(date -d "$time2" +%s)
time_difference=$((timestamp2 - current))
days_difference=$((time_difference / 86400))
time1="08/01/2026 12:00AM"
let current=$(date +%s)
timestamp1=$(date -d "$time1" +%s)
time_progression=$((current - timestamp1))
days_done=$((time_progression/ 86400))
echo "$days_done days done,  $days_difference days remaining"
