local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shape = require("gears.shape")
local utils = require("config.util.utils")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local cmd_ram_total = "top -b -n 1 | awk '/MiB Mem/ { print $4 }'"
local cmd_ram_used = "top -b -n 1 | awk '/MiB Mem/ { print $8 }'"
local cmd_swap_used = "top -b -n 1 | awk '/MiB Swap/ { print $7 }'"

local ram_widget = wibox.widget{
	{
		{
			{
				{
					id = "text",
					font = beautiful.font_type .. "10",
					markup = '<span foreground="' .. beautiful.light_primary_color .. '"> </span> ' .. '0/0G',
					widget = wibox.widget.textbox,
				},
				right = 11,
				left = 11,
				layout = wibox.container.margin,
			},
			shape = function (cr, width, height)
							shape.rounded_rect(cr, width, height, 10) end,
			shape_border_width = 1.75,
			fg = beautiful.primary_fg_color,
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

local total_ram = string.format("%.1f", tostring(tonumber(utils.os_output(cmd_ram_total)) / 1000))

awful.widget.watch("sh -c \"" .. cmd_ram_used .. " ; " .. cmd_swap_used .. "\"", 3, function(widget, stdout)
	local split_stdout = utils.split_str(stdout, "\n")
	ram_widget:get_children_by_id("text")[1].markup = '<span foreground="' .. beautiful.light_primary_color .. '"> </span> ' ..
		string.format("%.1f", tostring((tonumber(split_stdout[1]) / 1000))) .. '/' .. total_ram .. 'G'
	ram_tt.text = "RAM: " .. split_stdout[1] .. "\nSwap: " .. split_stdout[2]
end, ram_widget)

return ram_widget
