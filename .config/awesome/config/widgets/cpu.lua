local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shape = require("gears.shape")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local cmd_usg = "top -b -n 1 | awk '/Cpu/ { print $2 }'"
local cmd_temp = "sensors | awk '/Package id 0:/ { print $4 }' | sed 's/+//'"

function split_str(input_str, sep)
	local t = {}
	for s in string.gmatch(input_str, "([^"..sep.."]+)") do
		table.insert(t, s)
	end
	return t
end

local cpu_widget = wibox.widget{
	{
		{
			{
				{
					id = "text",
					font = beautiful.font_type .. "10",
					text = "﬙ 0%",
					widget = wibox.widget.textbox,
				},
				right = 11,
				left = 11,
				layout = wibox.container.margin,
			},
			shape = function (cr, width, height)
							shape.rounded_rect(cr, width, height, 10) end,
			shape_border_width = 2,
			fg = beautiful.light_primary_color,
			shape_border_color = beautiful.dark_primary_color,
			bg = beautiful.primary_bg_color .. "40",
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

local cpu_tt = awful.tooltip{
	objects = { cpu_widget },
	mode = "outside",
}

awful.widget.watch("sh -c \"" .. cmd_usg .. " ; " .. cmd_temp .. "\"", 1.5, function(widget, stdout)
	local split_stdout = split_str(stdout, "\n")
	cpu_widget:get_children_by_id("text")[1].text = "  " .. split_str(split_stdout[1], ".")[1] .. "%"
	cpu_tt.text = "Usg: " .. split_stdout[1] .. "%\nTemp: " .. split_stdout[2]
end, cpu_widget)

return cpu_widget
