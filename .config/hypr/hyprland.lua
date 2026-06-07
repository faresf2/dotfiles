require("core.binds")
require("core.env")
require("core.monitors")
require("core.rules")
require("core.startups")
local colors = require("themes.mocha")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 3,

		border_size = 2,

		col = {
			active_border = colors.darkerMauve,
			inactive_border = colors.surface1,
		},
	},

	decoration = {
		rounding = 10,

		shadow = { enabled = false },
		blur = { enabled = false },
	},

	animations = {
		enabled = true,
	},
})

hl.curve("ease", { type = "bezier", points = { { 0, 0.9 }, { 0.18, 1 } } })

hl.animation({
	leaf = "workspaces",
	enabled = false,
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 2,
	bezier = "ease",
	style = "slide",
})

hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 2,
	bezier = "default",
	style = "default",
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		middle_click_paste = false,
	},
})

hl.config({
	input = {
		kb_layout = "us, ara",
		kb_options = "grp:win_space_toggle",

		follow_mouse = 2,

		float_switch_override_focus = 0,
		sensitivity = 0,
		accel_profile = "flat",
	},
})
