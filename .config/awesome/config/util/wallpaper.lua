local awful = require("awful")
local utils = require("config.util.utils")
local PATH = "~/.wallpapers/"

local wallpapers, i = utils.random_files(PATH), 1

function init_wallpaper()
	awful.spawn.with_shell("feh --bg-fill " .. PATH .. wallpapers[1])
end

function next_random_wallpaper()
	i = i + 1
	if i < #wallpapers then
		awful.spawn.with_shell("feh --bg-fill " .. PATH .. wallpapers[i])
	else
		i = 1
		awful.spawn.with_shell("feh --bg-fill " .. PATH .. wallpapers[i])
	end
end

function prev_random_wallpaper()
	i = i - 1
	if i > 0 then
		awful.spawn.with_shell("feh --bg-fill " .. PATH .. wallpapers[i])
	else
		i = #wallpapers
		awful.spawn.with_shell("feh --bg-fill " .. PATH .. wallpapers[i])
	end
end

