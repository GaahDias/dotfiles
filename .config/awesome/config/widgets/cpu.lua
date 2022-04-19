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
		id = "text_container",
		{
			id = "text",
			font = beautiful.font_type .. "8",
			text = "CPU:",
			widget = wibox.widget.textbox,
		},
		right = 7,
		left = 10,
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
		margins = 2.5,
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
	cpu_widget:get_children_by_id("bar")[1].value = tonumber(split_stdout[1])
	cpu_tt.text = "Usg: " .. split_stdout[1] .. "%\nTemp: " .. split_stdout[2]
end, cpu_widget)

return cpu_widget