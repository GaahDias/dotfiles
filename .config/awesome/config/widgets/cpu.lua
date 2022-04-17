local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shape = require("gears.shape")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local cmd = "sh -c \"top -b -n 1 | grep Cpu | awk '{ print $2 }'\""
local cpu_widget = wibox.widget{
	{
		id = "text_container",
		{
			id = "text",
			font = beautiful.font_type .. "8",
			text = "CPU:",
			widget = wibox.widget.textbox,
		},
		right = 7,
		layout = wibox.container.margin,
	},
	{
		{
			id = "bar_container",
			{
				id = "bar",
				opacity = 0.85,
				forced_height = 15,
 				forced_width  = 10,
				max_value = 100,
				paddings = 1,
				border_width = 2,
				shape = function (cr, width, height)
					shape.rounded_rect(cr, width, height, 3.5) end,
				widget = wibox.widget.progressbar,
			},
			layout        = wibox.container.rotate,
    		direction     = 'east',
		},
		margins = 2,
		layout = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal
}

awful.widget.watch(cmd, 2, function(widget, stdout)
	cpu_widget:get_children_by_id("bar")[1].value = tonumber(stdout)
end, cpu_widget)

return cpu_widget
