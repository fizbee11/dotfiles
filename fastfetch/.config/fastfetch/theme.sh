
time3="7/29/2024 9:00PM"
let current=$(date +%s)
timestamp3=$(date -d "$time3" +%s)
theme_progression=$((current - timestamp3))


echo $theme_progression Days on Nord

