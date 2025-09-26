#!/usr/bin/env bash

notification_timeout=1000

# Get brightness
get_backlight() {
	echo $(brightnessctl -m | cut -d, -f4)
}

# Notify
notify_user() {
	notify-send -h string:x-dunst-stack-tag:brightness_notif -h int:value:$current -u low "Brightness : $current%"
}

# Change brightness
change_backlight() {
	brightnessctl s "$1" && notify_user
}

# Execute accordingly
case "$1" in
	"--get")
		get_backlight
		;;
	"--inc")
		change_backlight "+10%"
		;;
	"--dec")
		change_backlight "10%-"
		;;
	*)
		get_backlight
		;;
esac
