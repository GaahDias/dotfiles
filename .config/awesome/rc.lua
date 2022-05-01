-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

require("config.error")

-- Default apps
default_apps = require("config.util.apps")
terminal = default_apps.terminal
editor = os.getenv("EDITOR") or default_apps.code_editor
editor_cmd = terminal .. " -e " .. default_apps.code_editor

-- Default modkey
modkey = "Mod4"

-- Table with layout icons and names
layout_icons = {
	tile = beautiful.layout_tile,
	tileleft = beautiful.layout_tileleft,
	tilebottom = beautiful.layout_tilebottom,
	tiletop = beautiful.layout_tiletop,
	floating = beautiful.layout_floating,
	fairv = beautiful.layout_fairv,
	fairh = beautiful.layout_fairh,
}
layout_names = {
	tile = "Tile Right",
	tileleft = "Tile Left",
	tilebottom = "Tile Bottom",
	tiletop = "Tile Top",
	floating = "Float",
	fairv = "Fair Vertical",
	fairh = "Fair Horizontal",
}

require("config.screen")
require("config.keys")
require("config.client")
require("config.rules")

-- Autostart apps
awful.spawn.with_shell("picom")

-- Draw wallpaper
init_wallpaper()
