local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shape = require("gears.shape")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local clock_widget = wibox.widget{
	{
		{
			{
				{
					id = "clock",
					font = beautiful.other_font_type .. "10.5",
    				format = '%a %d %b, %H:%M',
					widget = wibox.widget.textclock,
				},
				right = 11,
				left = 11,
				top = 7,
				bottom = 7,
				layout = wibox.container.margin,
			},
			shape = function (cr, width, height)
							shape.rounded_rect(cr, width, height, 12) end,
			shape_border_width = 1.75,
			fg = beautiful.primary_fg_color,
			shape_border_color = beautiful.dark_primary_color .. "d9",
			bg = beautiful.primary_bg_color .. "4d",
			widget = wibox.container.background,
		},
		top = 3,
		bottom = 3,
		right = 4,
		left = 4,
		layout = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal
}

return clock_widget
