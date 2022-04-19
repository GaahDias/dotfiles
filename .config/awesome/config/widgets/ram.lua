local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shape = require("gears.shape")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local cmd_ram_total = "top -b -n 1 | awk '/MiB Mem/ { print $4 }'"
local cmd_ram_used = "top -b -n 1 | awk '/MiB Mem/ { print $8 }'"
local cmd_swap_used = "top -b -n 1 | awk '/MiB Swap/ { print $7 }'"

function os_output(cmd)
	local reader = io.popen(cmd, 'r')
	local output = reader:read()

	reader:close()

	return output
end

function split_str(input_str, sep)
	local t = {}
	for s in string.gmatch(input_str, "([^"..sep.."]+)") do
		table.insert(t, s)
	end
	return t
end

local ram_widget = wibox.widget{
	{
		id = "text_container",
		{
			id = "text",
			font = beautiful.font_type .. "8",
			text = "RAM:",
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
				max_value = tonumber(os_output(cmd_ram_total)),
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
	layout = wibox.layout.align.horizontal,
}

local ram_tt = awful.tooltip{
	objects = { ram_widget },
	mode = "outside",
}

awful.widget.watch("sh -c \"" .. cmd_ram_used .. " ; " .. cmd_swap_used .. "\"", 3, function(widget, stdout)
	local split_stdout = split_str(stdout, "\n")
	ram_widget:get_children_by_id("bar")[1].value = tonumber(split_stdout[1])
	ram_tt.text = "RAM: " .. split_stdout[1] .. "\nSwap: " .. split_stdout[2]
end, ram_widget)

return ram_widget
