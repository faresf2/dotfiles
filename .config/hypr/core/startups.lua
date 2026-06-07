hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/lib/geoclue-2.0/demos/agent")

	hl.dispatch(hl.dsp.focus({ workspace = "1" })) -- focus workspace 1 on startup

	hl.exec_cmd("waypaper --restore")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
end)
