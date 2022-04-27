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
		{
			{
				{
					id = "text",
					font = beautiful.font_type .. "10",
					text = " 0/0",
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

local ram_tt = awful.tooltip{
	objects = { ram_widget },
	mode = "outside",
}

local total_ram = string.format("%.1f", tostring(tonumber(os_output(cmd_ram_total)) / 1000))

awful.widget.watch("sh -c \"" .. cmd_ram_used .. " ; " .. cmd_swap_used .. "\"", 3, function(widget, stdout)
	local split_stdout = split_str(stdout, "\n")
	ram_widget:get_children_by_id("text")[1].text = "  " .. string.format("%.1f", tostring((tonumber(split_stdout[1]) / 1000))) .. "/" .. total_ram .. "G"
	ram_tt.text = "RAM: " .. split_stdout[1] .. "\nSwap: " .. split_stdout[2]
end, ram_widget)

return ram_widget
