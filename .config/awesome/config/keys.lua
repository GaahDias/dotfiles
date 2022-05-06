-- Default imports
local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
-- Widget imports
local hotkeys_popup = require("awful.hotkeys_popup")
local volume_widget = require('config.widgets.volume')
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

globalkeys = gears.table.join(
	-- AWESOME
	awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
	awful.key({ modkey            }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

	-- CLIENT
	awful.key({ modkey }, "Right", function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),
    awful.key({ modkey }, "Left", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),
	awful.key({ modkey, "Shift" }, "Right", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift" }, "Left", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Shift" }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey }, "Tab",
		function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = "go back", group = "client"}),
	awful.key({ modkey, "Shift" }, "n",
		function ()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", {raise = true})
			end
		end,
		{description = "restore minimized", group = "client"}),

	-- LAUNCHER
	awful.key({ modkey,           }, "Return", function () awful.spawn(default_apps.terminal) end,
              {description = "open " .. default_apps.terminal, group = "launcher"}),
	-- Rofi
    awful.key({ modkey }, "r", function()
		awful.spawn("rofi -show drun -show-icons -theme miat") end,
        {description = "rofi drun", group = "launcher"}),
	awful.key({ modkey }, ".", function()
		awful.spawn("rofi -show emoji -theme miat") end,
		{description = "rofi emoji", group = "launcher"}),
	awful.key({ modkey }, "=", function()
		awful.spawn("rofi -show calc -modi calc -no-show-match -no-sort -theme miat") end,
		{description = "rofi calc", group = "launcher"}),
	awful.key({ modkey }, "p", function()
		awful.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu -theme miat") end,
		{description = "rofi power off", group = "launcher"}),
	-- Apps
	awful.key({ modkey }, "b", function()
		awful.spawn(default_apps.browser) end,
		{description = "launch " .. default_apps.browser, group = "launcher"}),
	awful.key({ modkey, "Mod1" }, "b", function()
		awful.spawn(default_apps.alt_browser) end,
		{description = "launch " .. default_apps.alt_browser, group = "launcher" }),
	awful.key({ modkey }, "f", function()
		awful.spawn(default_apps.file_manager) end,
		{description = "launch " .. default_apps.file_manager, group = "launcher"}),
	awful.key({ modkey, "Mod1" }, "f", function()
		awful.spawn(terminal .. " -e " .. default_apps.alt_file_manager) end,
		{description = "launch " .. default_apps.alt_file_manager, group = "launcher"}),
	-- Popups
	awful.key({ modkey }, "c", function()
		popups.calendar_popup.visible = not popups.calendar_popup.visible end,
		{description = "launch calendar popup", group = "launcher"}),

	-- LAYOUT
	awful.key({ modkey, "Mod1"    }, "Right",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, "Mod1"    }, "Left",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "Up",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "Down",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "space",
		function ()
			awful.layout.inc( 1)
			naughty.notify({
					icon = layout_icons[awful.layout.getname()],
					title = layout_names[awful.layout.getname()],
					text="Layout changed"}) end,
        {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space",
		function ()
			awful.layout.inc(-1)
			naughty.notify({
					icon = layout_icons[awful.layout.getname()],
					title = layout_names[awful.layout.getname()],
					text="Layout changed"}) end,
        {description = "select previous", group = "layout"}),

	-- SCREEN
	-- Popups
	awful.key({ modkey }, "Escape", function()
			for k, v in pairs(popups) do
				v.visible = false
			end
		end,
		{description = "close popups", group = "screen"}),
		-- Screenshots
	awful.key({ modkey }, "Print", function()
		awful.util.spawn("flameshot full -c") end,
		{description = "capture full screen", group = "screen"}),
	awful.key({ modkey, "Shift" }, "Print", function()
		awful.util.spawn("flameshot gui") end,
		{description = "capture selected area", group = "screen"}),

	-- TAG
    awful.key({ modkey, "Control" }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey, "Control" }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

	-- MULTIMEDIA
	awful.key({ }, "XF86AudioRaiseVolume", function()
		volume_widget:inc(5) end,
		{description = "raise volume", group = "multimedia"}),
	awful.key({ }, "XF86AudioLowerVolume", function()
		volume_widget:dec(5) end,
		{description = "lower volume", group = "multimedia"}),
	awful.key({ }, "XF86AudioMute", function()
		volume_widget:toggle() end,
		{description = "mute audio", group = "multimedia"}),
	awful.key({ }, "XF86AudioPlay", function()
		awful.util.spawn("playerctl play-pause") end,
		{description = "play/pause current media", group = "multimedia"}),
	awful.key({ }, "XF86AudioNext", function()
		awful.util.spawn("playerctl next") end,
		{description = "go to next media", group = "multimedia"}),
	awful.key({ }, "XF86AudioPrev", function()
		awful.util.spawn("playerctl previous") end,
		{description = "go to previous media", group = "multimedia"}),

	-- Wallpaper
	awful.key({ modkey }, "w", function()
		next_random_wallpaper() end,
		{description = "next wallpaper", group = "screen"}),
	awful.key({ modkey, "Shift" }, "w", function()
		prev_random_wallpaper() end,
		{description = "previous wallpaper", group = "screen"})
)

-- Create binds for each tag
for i = 1, #tag_names do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}))
end

-- Set global keys
root.keys(globalkeys)

-- Other client keys
clientkeys = gears.table.join(
	awful.key({ modkey, "Control" }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey, "Control" }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})
)
