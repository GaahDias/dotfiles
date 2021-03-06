local wibox = require("wibox")
local beautiful = require('beautiful')
local shape = require("gears.shape")

local widget = {}

--id = 'text',
--font = font,
--widget = wibox.widget.textbox


function widget.get_widget(widgets_args)
    local args = widgets_args or {}

    local font = args.font or beautiful.font

    return wibox.widget {
		{
			{
				{
					{
						id = "text",
						font = font,
						widget = wibox.widget.textbox,
					},
					right = 11,
					left = 11,
					layout = wibox.container.margin,
				},
				id = "container",
				shape = function (cr, width, height)
								shape.rounded_rect(cr, width, height, 10) end,
				shape_border_width = 1.75,
				fg = beautiful.light_primary_color,
				shape_border_color = beautiful.dark_primary_color,
				bg = beautiful.primary_bg_color .. "40",
				widget = wibox.container.background,
			},
			top = 3,
			bottom = 3,
			right = 4,
			left = 4,
			layout = wibox.container.margin,
		},
        layout = wibox.layout.align.horizontal,

        set_volume_level = function(self, new_value)
            if self.is_muted then
                self:get_children_by_id('text')[1].markup =  "婢 Mu"
				self:get_children_by_id('container')[1].fg = beautiful.light_urgent_color
            else
                local new_value_num = tonumber(new_value)
                if (new_value_num >= 0 and new_value_num < 25) then
                    self:get_children_by_id('text')[1].markup = '<span foreground="' .. beautiful.light_primary_color .. '">奄</span>' .. new_value
					self:get_children_by_id('container')[1].fg = beautiful.primary_fg_color
                elseif (new_value_num < 60) then
                     self:get_children_by_id('text')[1].markup = '<span foreground="' .. beautiful.light_primary_color .. '">奔</span>' .. new_value
					 self:get_children_by_id('container')[1].fg = beautiful.primary_fg_color
                else
                   self:get_children_by_id('text')[1].markup = '<span foreground="' .. beautiful.light_primary_color .. '">墳</span>' .. new_value
				   self:get_children_by_id('container')[1].fg = beautiful.primary_fg_color
                end
            end
        end,
        mute = function(self)
            self.is_muted = true
        end,
        unmute = function(self)
            self.is_muted = false
        end
    }

end


return widget
