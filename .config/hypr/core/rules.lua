-- Workspace Rules
hl.workspace_rule({ workspace = "1", monitor = "DP-3", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-3", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-3", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "DP-3", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-3", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", persistent = true })

-- Window Rules
hl.window_rule({
	name = "thunar-floating",
	match = { class = "[tT]hunar" },
	float = true,
	size = { 1300, 850 },
})

hl.window_rule({
	name = "waypaper-floating",
	match = { class = "waypaper" },
	float = true,
	size = { 1600, 900 },
})

hl.window_rule({
	name = "foot-opacity",
	match = { class = "foot" },
	opacity = "1 0.95",
})

hl.window_rule({
	name = "spotify-floating-workspace4",
	match = { class = "[sS]potify" },
	float = true,
	size = { 1100, 650 },
	workspace = "4",
})

hl.window_rule({
	name = "discord-floating-workspace5",
	match = { class = "discord" },
	float = true,
	center = true,
	size = { 1280, 720 },
	workspace = "5",
})

hl.window_rule({
	name = "pwvucontrol-floating",
	match = { class = "com.saivert.pwvucontrol" },
	float = true,
})

hl.window_rule({
	name = "vlc-floating",
	match = { class = "vlc" },
	float = true,
})

hl.window_rule({
	name = "mpv-floating",
	match = { class = "mpv" },
	float = true,
})

hl.window_rule({
	name = "open-files-floating-nautilus",
	match = { class = "org.gnome.Nautilus" },
	float = true,
	center = true,
	size = { 1100, 720 },
})

hl.window_rule({
	name = "open-files-floating",
	match = { class = "(Open File)" },
	float = true,
	center = true,
	size = { 1100, 720 },
})

hl.window_rule({
	name = "all-files-floating",
	match = { title = "^(All Files)" },
	float = true,
	size = { 1100, 720 },
})

hl.window_rule({
	name = "file-roller-floating",
	match = { class = "org.gnome.FileRoller" },
	float = true,
	size = { 1100, 720 },
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "fix-blur-under-chromium-context-menu",
	match = { class = "^()$", title = "^()$" },
	no_blur = true,
})

hl.layer_rule({
	name = "rofi-animation",
	match = { namespace = "rofi" },
	animation = "slide top",
})

hl.window_rule({
	name = "Sober-servermenu-float",
	match = { initial_class = "org.vinegarhq.Sober" },
	float = true,
	center = true,
	size = { 900, 900 },
})

-- SMART GAPS
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

-- JetBrains Fixes
hl.window_rule({
	name = "jetbrains-splash-center",
	match = { class = "jetbrains-.*", title = "splash", float = true },
	center = true,
})
hl.window_rule({
	name = "jetbrains-splash-no-focus",
	match = { class = "jetbrains-.*", title = "splash", float = true },
	no_focus = true,
})
hl.window_rule({
	name = "jetbrains-win-no-focus",
	match = { class = "jetbrains-.*", title = "win.*", float = true },
	no_focus = true,
})
hl.window_rule({
	name = "jetbrains-float-fixes",
	match = { class = "jetbrains-.*", float = true },
	no_blur = true,
	no_initial_focus = true,
	opacity = "1 override 1 override 1",
})
