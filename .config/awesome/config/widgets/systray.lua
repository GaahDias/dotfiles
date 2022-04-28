local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local systray = {}

function systray.get_launcher(systray_wibox)
	local systray_launcher_widget = wibox.widget{
			{
				font = beautiful.font_type .. "26",
				markup = '<span foreground="' .. beautiful.primary_fg_color .. '"></span>',
				align = "center",
				valign = "center",
				fg = beautiful.primary_dark_color,
				buttons = awful.button({ }, 1, function()
					systray_wibox.visible = not systray_wibox.visible
					systray_wibox.x = mouse.coords().x - 50
					systray_wibox.y = mouse.coords().y + 30
				end),
				widget = wibox.widget.textbox
			},
			right = 7,
			left = 5,
			top = 1,
			layout = wibox.container.margin,
		}
	return systray_launcher_widget
end

function systray.get_systray_widget()
	local systray_widget = wibox.widget{
		{
			id = "systray",
			opacity = 0.8,
			widget = wibox.widget.systray
		},
		margins = 5,
		layout = wibox.container.margin,
	}
	systray_widget.systray:set_horizontal(false)
	return systray_widget
end

return systray
