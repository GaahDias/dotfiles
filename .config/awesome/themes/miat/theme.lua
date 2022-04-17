----------------------------------------
-- MIAT (My Incredible Awesome Theme) --
--            by: Gaah                --
----------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/themes/"

local theme = {}

-- Defining theme main colors
theme.dark_primary_color      = "#226DE0"
theme.light_primary_color     = "#6DA3E7"
theme.dark_secundary_color    = "#6F26E7"
theme.light_secundary_color   = "#8A6AE9"
theme.primary_bg_color        = "#1A1919"
theme.secundary_bg_color      = "#232222"
theme.primary_fg_color        = "#C1BDBD"
theme.secundary_fg_color      = "#E9E5E5"

-- Font
theme.font_type  = "Sans "
theme.font       = theme.font_type .. tostring(dpi(9))

-- Background
theme.bg_normal     = theme.secundary_bg_color .. "b3"
theme.bg_focus      = theme.primary_bg_color .. "bf"
theme.bg_urgent     = theme.dark_secundary_color .. "b3"
theme.bg_minimize   = theme.secundary_bg_color .. "b3"

-- Foreground
theme.fg_normal     = theme.primary_fg_color
theme.fg_focus      = theme.secundary_fg_color
theme.fg_urgent     = theme.secundary_fg_color
theme.fg_minimize   = theme.secundary_fg_color

-- Border and gap
theme.useless_gap   = dpi(7.5)
theme.border_width  = dpi(3)
theme.border_normal = theme.light_primary_color
theme.border_focus  = theme.dark_primary_color
theme.border_marked = theme.dark_secundary_color

-- Systray
theme.bg_systray            = theme.secundary_bg_color .. "b3"
theme.systray_icon_spacing  = dpi(5)

-- Notification
theme.notification_font    = theme.font_type .. tostring(dpi(8))
theme.notification_bg      = theme.secundary_bg_color .. "bf"
theme.notification_fg      = theme.secundary_fg_color
theme.notification_width   = dpi(380)
theme.notification_height  = dpi(75)
theme.notification_margin  = dpi(10)

-- Progressbar
theme.progressbar_bg            = theme.secundary_bg_color .. "b3"
theme.progressbar_fg            = theme.light_secundary_color .. "cc"
theme.progressbar_border_color  = theme.dark_primary_color
theme.progressbar_border_width  = dpi(10)

-- There are other variable sets
-- overriding the miat one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."miat/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = themes_path.."miat/background.png"

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

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

theme.arch_logo = themes_path .. "miat/arch-linux-logo.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
