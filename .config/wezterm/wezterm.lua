local wezterm = require("wezterm")
-- local sessionizer = require("lua.sessionizer")
local config = wezterm.config_builder()

-- doesn't work on wayland, have to fallback to x11
config.enable_wayland = false

config.bidi_enabled = true
-- config.bidi_direction = "LeftToRight"

-- appearance
config.window_background_opacity = 0.9
config.font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Medium" })

config.font_size = 16
config.color_scheme = 'rose-pine'
config.colors = {
	background = "black",
    selection_bg = '#524f67', -- Rosé Pine "Highlight High"
    selection_fg = '#e0def4', -- Rosé Pine "Text"
}

config.window_padding = {
	left = 5,
	right = 0,
	top = 10,
	bottom = 0,
}

config.max_fps = 165
config.animation_fps = 165
config.front_end = "WebGpu"
config.prefer_egl = true

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = true
config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0" }

-- map shift+enter to correctly do what its supposed to do
config.keys = {
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendString('\x1b[13;2u'),
  },
}

return config
