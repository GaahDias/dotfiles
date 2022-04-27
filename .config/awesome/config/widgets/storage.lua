local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shape = require("gears.shape")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local cmd_size = [[df -h | awk '/^\/dev\/[A-Za-z]{3}[0-9]/ { print $2 }' | sed 's/G//']]
local cmd_used = [[df -h | awk '/^\/dev\/[A-Za-z]{3}[0-9]/ { print $3 }' | sed 's/G//']]

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

local storage_widget = wibox.widget{
		{
		{
			{
				{
					id = "text",
					font = beautiful.font_type .. "10",
					text = " 0/0",
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

local storage_tt = awful.tooltip{
	objects = { storage_widget },
	mode = "outside",
}

awful.widget.watch("sh -c \"" .. cmd_size .. " ; " .. cmd_used .. "\"", 5, function(widget, stdout)
	local split_stdout = split_str(stdout, "\n")
	storage_widget:get_children_by_id("text")[1].text = "  " .. split_stdout[2] .. "/" .. split_stdout[1] .. "G"
	storage_tt.text = split_stdout[2] .. "G / " .. split_stdout[1] .. "G"
end, storage_widget)


return storage_widget
