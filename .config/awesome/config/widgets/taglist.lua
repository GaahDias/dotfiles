local awful = require("awful")
local wibox = require("wibox")
local shape = require("gears.shape")
local beautiful = require("beautiful")

local taglist_widget = {}

function taglist_widget.get_taglist(s, taglist_b)
	local taglist = awful.widget.taglist {
			screen  = s,
			filter  = awful.widget.taglist.filter.all,
			style = {
				shape = function(cr, width, height) shape.rounded_rect(cr, width, height, 10) end,
			},
			layout   = {
			spacing = 14,
			spacing_widget = {
					{
						color  = beautiful.dark_primary_color,
						shape  = shape.powerline,
						widget = wibox.widget.separator,
					},
					top = 10,
					bottom = 10,
					widget = wibox.container.margin
				},
				layout  = wibox.layout.fixed.horizontal
			},
			widget_template = {
			{
				{
					{
						{
							id     = 'text_role',
							widget = wibox.widget.textbox,
						},
						layout = wibox.layout.fixed.horizontal,
					},
					left  = 6,
					right = 6,
					widget = wibox.container.margin
				},
				id     = 'background_role',
				widget = wibox.container.background,
			},
			top = 5,
			bottom = 5,
			right = 3,
			left = 3,
			widget = wibox.container.margin,
		},
		buttons = taglist_b
	}
	return taglist
end

return taglist_widget
