local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shape = require("gears.shape")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local power_widget = wibox.widget{
	{
		font = beautiful.font_type .. "13",
		markup = '<span foreground="' .. beautiful.light_primary_color .. '"> </span>',
		buttons = awful.button({ }, 1, function() awful.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu -theme miat") end),
		widget = wibox.widget.textbox,
	},
	left = 5,
	right = 8,
	layout = wibox.container.margin,
}

return power_widget
