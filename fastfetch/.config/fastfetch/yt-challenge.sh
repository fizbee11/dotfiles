#!/bin/bash
target_videos=100
let videos_completed=$(find ~/dev/fb/youtube/videos/Completed/ -maxdepth 1 -mindepth 1 -type d | wc -l)
videos_remaining=$((target_videos - videos_completed))

echo $videos_completed done, $videos_remaining left

