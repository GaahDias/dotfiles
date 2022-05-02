-- Default imports
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
-- Autofocus on windows
require("awful.autofocus")

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Since spotify is kinda buggy in regard to it's wm_class, we need this workaround
-- to set it's rules
client.connect_signal("property::class", function(c)
   if c.class == "Spotify" then
      c:move_to_tag(screen[1].tags[4])
      local tag = awful.tag.gettags(1)[4]
      if tag then
        awful.tag.viewonly(tag)
      end
   end
end)
