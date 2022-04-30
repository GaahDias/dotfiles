-- Default imports
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
-- Widgets imports
local volume_widget = require('config.widgets.volume')
local cpu_widget = require("config.widgets.cpu")
local ram_widget = require("config.widgets.ram")
local storage_widget = require("config.widgets.storage")
local calendar_widget = require("config.widgets.calendar")
local power_widget = require("config.widgets.power")
local launcher_widget = require("config.widgets.launcher")
local systray_widget = require("config.widgets.systray")
local taglist_widget = require("config.widgets.taglist")
-- Wallpaper import
require("config.util.wallpaper")

popups = {
	calendar_popup = calendar_widget.get_calendar_popup(),
}

local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
							  if client.focus then
								  client.focus:move_to_tag(t)
							  end
						  end),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
							  if client.focus then
								  client.focus:toggle_tag(t)
							  end
						  end)
)

-- Table of layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
	awful.layout.suit.floating,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", next_random_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "main", "www", "code", "apps", "games", "" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.taglist = taglist_widget.get_taglist(s, taglist_buttons)
	-- Create the wibar
    s.wibox = awful.wibar({ border_width = 6, height = dpi(38), position = "top", shape =
		function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 25) end})

	-- Create systray wibox
	s.systraywibox = wibox({ border_width = 0, height = dpi(48), width = dpi(95), ontop = true, visible = false })
	s.systraywibox:connect_signal("mouse::leave", function() s.systraywibox.visible = false end)

    -- Add widgets to the wibox
    s.wibox:setup {
		layout = wibox.layout.stack,
		{
        	layout = wibox.layout.align.horizontal,
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
				launcher_widget,
				s.taglist,
			},
			nil,
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
				storage_widget,
				ram_widget,
				cpu_widget,
				volume_widget,
				systray_widget.get_launcher(s.systraywibox),
				power_widget,
			}
		},
		{
			calendar_widget.get_calendar_widget(popups.calendar_popup),
        	valign = "center",
        	halign = "center",
        	layout = wibox.container.place
		}
    }

	s.systraywibox:setup {
		layout = wibox.layout.flex.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			systray_widget.get_systray_widget(),
		},
		{
			layout = wibox.layout.fixed.horizontal,
			s.mylayoutbox,
		}
	}
end)

