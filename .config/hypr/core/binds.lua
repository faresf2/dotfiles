local mainMod = "ALT"
local terminal = "foot"
local fileManager = "thunar"

local menu = [[$HOME/.config/rofi/launchers/launcher.sh]]

local sc_all = [[grim $HOME/Pictures/Screenshots/$(date +'%s_grim.png') && notify-send "Captured Screen"]]
local sc_area = [[grim -g "$(slurp -d)" - | wl-copy && notify-send "Captured Screen"]]

local clipboard =
	[[cliphist list | rofi -dmenu -p "" -display-columns 2 -theme ~/.config/rofi/launchers/style-1-emoji.rasi| cliphist decode | wl-copy]]
local emoji = [[rofi -modi emoji -show emoji -theme ~/.config/rofi/launchers/style-1-emoji.rasi]]

-- Master keybind to disable all binds
hl.bind("SUPER + SHIFT + P", hl.dsp.submap("clean"))
hl.define_submap("clean", function()
	hl.bind("SUPER + SHIFT + P", hl.dsp.submap("reset"))
end)

-- Wayscriber
hl.bind("F12", hl.dsp.exec_cmd("wayscriber --daemon-toggle"))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind("ALT + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd(sc_all))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(sc_area))
hl.bind("SUPER + code:60", hl.dsp.exec_cmd(emoji))
hl.bind("SUPER + V", hl.dsp.exec_cmd(clipboard))

-- Switching focus using arrow keys (moves focus and alters z-order to top)
hl.bind(mainMod .. " + LEFT", function()
	hl.dispatch(hl.dsp.focus({ direction = "l" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(mainMod .. " + UP", function()
	hl.dispatch(hl.dsp.focus({ direction = "u" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(mainMod .. " + RIGHT", function()
	hl.dispatch(hl.dsp.focus({ direction = "r" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(mainMod .. " + DOWN", function()
	hl.dispatch(hl.dsp.focus({ direction = "d" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Switching focus using H,J,K,L (moves focus and alters z-order to top)
hl.bind(mainMod .. " + H", function()
	hl.dispatch(hl.dsp.focus({ direction = "l" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(mainMod .. " + K", function()
	hl.dispatch(hl.dsp.focus({ direction = "u" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(mainMod .. " + L", function()
	hl.dispatch(hl.dsp.focus({ direction = "r" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(mainMod .. " + J", function()
	hl.dispatch(hl.dsp.focus({ direction = "d" }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Moving windows using arrow keys or H,J,K,L
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Switching workspace or moving windows to other workspace
for i = 1, 6 do
	local key = i
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- Secret workspace
hl.bind("SUPER + SHIFT + Z", hl.dsp.focus({ workspace = "name:secret" }))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "name:secret", follow = true }))

-- Resizing and moving workspaces using mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Global keybinds for discord mute/deafen
hl.bind("F6", hl.dsp.pass({ window = "class:^(discord)$" }))
hl.bind("PAGE_DOWN", hl.dsp.pass({ window = "class:^(discord)$" }))
