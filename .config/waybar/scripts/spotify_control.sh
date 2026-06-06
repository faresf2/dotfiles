#!/usr/bin/env bash

# Fetch status and title in one single command to be faster
# format: "status|title" (e.g., "playing|Song Name")
metadata=$(playerctl metadata --player=spotify --format '{{lc(status)}}|{{title}}' 2>/dev/null)

# Split the string into variables
class=$(echo "$metadata" | cut -d'|' -f1)
title=$(echo "$metadata" | cut -d'|' -f2-)
icon=""

# Handle empty metadata (Spotify closed)
if [[ -z "$class" ]]; then
    echo -e "{\"text\":\"\", \"class\":\"stopped\"}"
    exit 0
fi

# Escape quotes in title to prevent JSON breakage
title=$(echo "$title" | sed 's/"/\\"/g')
# Remove brackets/parentheses for cleaner look
title=$(echo "$title" | sed -E 's/[-(].*//')

if [[ ${#title} -gt 40 ]]; then
    title=$(echo "$title" | cut -c1-40)"..."
fi

if [[ $class == "playing" ]]; then
    text="$icon $title"
elif [[ $class == "paused" ]]; then
    text=" $icon $title"
else
    text=""
fi

echo -e "{\"text\":\"$text\", \"class\":\"$class\"}"
