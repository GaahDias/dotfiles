local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local launcher_widget = wibox.widget{
	{
		font = beautiful.font_type .. "26",
		markup = '<span foreground="' .. beautiful.dark_primary_color .. '"> </span>',
		buttons = awful.button({ }, 1, function() awful.spawn("rofi -show drun -show-icons -theme miat") end),
		widget = wibox.widget.textbox,
	},
	left = 12,
	right = 4,
	top = 3,
	bottom = 4,
	layout = wibox.container.margin,
}

return launcher_widget
