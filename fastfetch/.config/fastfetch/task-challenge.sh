#!/bin/bash
time2="01/31/2027 12:00AM"
let current=$(date +%s)
time1="2026-03-07"
timestamp1=$(date -d "$time1" +%s)
time_progression=$((current - timestamp1))
days_done=$((time_progression/ 86400))
echo $days_done days done        $days_difference days left
