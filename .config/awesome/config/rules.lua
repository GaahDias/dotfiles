-- Default imports
local awful = require("awful")
local beautiful = require("beautiful")

-- Since spotify is kinda buggy regarding it's wm_class, we need
-- to set it's rules in client.lua

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- Firefox
	{ rule = { class = default_apps.browser },
  		properties = { tag = "www",
				   	   switch_to_tags = true } },

	-- Discord, Whatsapp
	{ rule_any = { class = { default_apps.discord }, name = { default_apps.messenger } },
  		properties = { tag = "apps",
					   switch_to_tags = true } },

	-- Steam, Lutris
	{ rule_any = { class = { default_apps.steam, default_apps.lutris } },
		properties = { tag = "games",
					   maximized = true,
					   switch_to_tags = true } },

	-- VLC, Ardour, Onlyoffice
	{ rule_any = { class = { default_apps.player, default_apps.office }, name = { default_apps.daw } },
		properties = { tag = "main",
					   maximized = true,
					   switch_to_tags = true } },

    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },
}

