local beautiful = require("beautiful")
local aww_volume_widget = require("config.widgets.volume-widget.volume")
beautiful.init("~/.config/awesome/themes/miat/theme.lua")

local volume_widget = aww_volume_widget{
	widget_type = 'my_custom_widget',
	font = beautiful.font_type .. "10",
}

function volume_widget.inc(v)
	aww_volume_widget.inc(v)
end

function volume_widget.dec(v)
	aww_volume_widget.dec(v)
end

function volume_widget.toggle()
	aww_volume_widget.toggle()
end

return volume_widget
