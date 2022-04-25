local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local cmd_size = [[df -h | awk '/^\/dev\/[A-Za-z]{3}[0-9]/ { print $2 }' | sed 's/G//']]
local cmd_avail = [[df -h | awk '/^\/dev\/[A-Za-z]{3}[0-9]/ { print $4 } | sed 's/G//'']]

function split_str(input_str, sep)
	local t = {}
	for s in string.gmatch(input_str, "([^"..sep.."]+)") do
		table.insert(t, s)
	end
	return t
end

local storage_widget = wibox.widget{
	{
		id = "text_container",
		{
			id = "text",
			font = beautiful.font_type .. "8",
			text = "Disk:",
			widget = wibox.widget.textbox,
		},
		right = 7,
		left = 10,
		layout = wibox.container.margin,
	},
	{
		{
			data_list = {
				{'used', 0},
				{'avail', 0},
			},
			display_labels = false,
			widget = wibox.widget.piechart,
		},
		margins = 2.5,
		layout = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal,
}

return storage_widget
