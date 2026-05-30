updates=$HOME/.config/update.txt
dateup=$(cat $updates)
let current=$(date +%s)
time5="5/28/2024 9:30AM"
timestamp5=$(date -d "$dateup" +%s)
update_checker=$((current - timestamp5))
updater=$((update_checker/ 86400))


echo $updater Days Since Last Update
