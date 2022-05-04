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

require("config.screen")
require("config.keys")
require("config.client")
require("config.rules")

-- Autostart apps and scripts
awful.spawn.with_shell("picom")
awful.spawn("/etc/lightdm/randomize-ldm-wallpaper.sh ~/.wallpapers")

-- Draw wallpaper
init_wallpaper()
