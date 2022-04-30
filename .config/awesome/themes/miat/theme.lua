----------------------------------------
-- MIAT (My Incredibly Awesome Theme) --
--            by: Gaah                --
----------------------------------------

local xresources = require("beautiful.xresources")
local shape = require("gears.shape")
local dpi = xresources.apply_dpi

local themes_path = "~/.config/awesome/themes/"

local theme = {}

-- Defining theme main colors
theme.dark_primary_color      = "#285EE9"
theme.light_primary_color     = "#85A4F3"
theme.dark_secundary_color    = "#4152E3"
theme.light_secundary_color   = "#8D91F6"
theme.dark_urgent_color       = "#F33E48"
theme.light_urgent_color      = "#F97E93"

theme.primary_bg_color        = "#1A1919"
theme.secundary_bg_color      = "#232222"
theme.primary_fg_color        = "#CAC5C5"
theme.secundary_fg_color      = "#E7E1E1"

-- Font
theme.font_type         		= "JetBrainsMono Nerd Font "
theme.calendar_font_type   		= "UbuntuMono Nerd Font "
theme.notification_font_type 	= "Sans "
theme.font              		= theme.font_type .. "9"

-- Background
theme.bg_normal     = theme.secundary_bg_color .. "bf"
theme.bg_focus      = theme.primary_bg_color .. "c4"
theme.bg_urgent     = theme.dark_secundary_color .. "bf"
theme.bg_minimize   = theme.secundary_bg_color .. "bf"

-- Foreground
theme.fg_normal     = theme.primary_fg_color
theme.fg_focus      = theme.secundary_fg_color
theme.fg_urgent     = theme.secundary_fg_color
theme.fg_minimize   = theme.secundary_fg_color

-- Border and gap
theme.useless_gap   = dpi(5)
theme.border_width  = dpi(3)
theme.border_normal = theme.light_primary_color
theme.border_focus  = theme.dark_primary_color
theme.border_marked = theme.dark_secundary_color

-- Hotkeys
theme.hotkeys_bg            = theme.primary_bg_color .. "bf"
theme.hotkeys_fg            = theme.primary_fg_color
theme.hotkeys_modifiers_fg  = theme.primary_fg_color
theme.hotkeys_border_width  = 0
theme.hotkeys_font 			= theme.font_type .. "9.5"
theme.hotkeys_group_margin  = dpi(18)

-- Systray
theme.bg_systray            = theme.secundary_bg_color .. "b3"
theme.systray_icon_spacing  = dpi(5)
theme.systray_max_rows      = 2

-- Notification
theme.notification_icon_size        = dpi(60)
theme.notification_font             = theme.notification_font_type .. "8.5"
theme.notification_bg               = theme.secundary_bg_color .. "bf"
theme.notification_fg               = theme.primary_fg_color
theme.notification_shape            = function(cr, width, height)
                                    shape.rounded_rect(cr, width, height, 10) end
theme.notification_width            = dpi(330)
theme.notification_height           = dpi(65)
theme.notification_margin           = dpi(8)

-- Progressbar
theme.progressbar_bg            = theme.secundary_bg_color .. "b3"
theme.progressbar_fg            = theme.light_secundary_color .. "e6"
theme.progressbar_border_color  = theme.dark_primary_color
theme.progressbar_border_width  = dpi(10)

-- Default wallpaper
theme.wallpaper = themes_path.."miat/arch-wallpaper.png"

-- Icon theme
theme.icon_theme = "~/.icons/Papirus"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."miat/layouts/fairhw.png"
theme.layout_fairv = themes_path.."miat/layouts/fairvw.png"
theme.layout_floating  = themes_path.."miat/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."miat/layouts/magnifierw.png"
theme.layout_max = themes_path.."miat/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."miat/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."miat/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."miat/layouts/tileleftw.png"
theme.layout_tile = themes_path.."miat/layouts/tilew.png"
theme.layout_tiletop = themes_path.."miat/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."miat/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."miat/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."miat/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."miat/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."miat/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."miat/layouts/cornersew.png"

return theme
