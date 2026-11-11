
time2="04/26/2027 12:27PM"

let current=$(date +%s)
timestamp2=$(date -d "$time2" +%s)
time_difference=$((timestamp2 - current))
days_difference=$((time_difference / 86400))


#echo $days_difference days left

time1="04/26/2026 12:27PM"
let current=$(date +%s)
timestamp1=$(date -d "$time1" +%s)
time_progression=$((current - timestamp1))
days_done=$((time_progression/ 86400))
#echo $days_done days done

echo $days_done days done     $days_difference days left

