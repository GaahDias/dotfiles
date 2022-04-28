local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local power_widget = wibox.widget{
	{
		font = beautiful.font_type .. "12",
		markup = '<span foreground="' .. beautiful.light_secundary_color .. '"> </span>',
		buttons = awful.button({ }, 1, function() awful.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu -theme miat") end),
		widget = wibox.widget.textbox,
	},
	left = 5,
	right = 12,
	layout = wibox.container.margin,
}

return power_widget
