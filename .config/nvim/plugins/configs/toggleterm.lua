-- Toggleterm setup
require("toggleterm").setup{
	size = 12,
	open_mapping = [[<c-\>]],
	direction = 'horizontal',
	close_on_exit = true
}

-- New terminal utilities
local Terminal = require("toggleterm.terminal").Terminal
local ranger = Terminal:new({ cmd = "ranger " .. vim.v.argv[2], hidden = true, direction = "float" })
local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })

function _RANGER_TOGGLE()
	ranger:toggle()
end

function _HTOP_TOGGLE()
	htop:toggle()
end
