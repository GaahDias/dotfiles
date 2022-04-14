" Plugins
call plug#begin()

Plug 'nvim-lualine/lualine.nvim' " Status bar
Plug 'preservim/nerdtree' " NERDTree
Plug 'tpope/vim-commentary' " Comments - gcc
Plug 'rafi/awesome-vim-colorschemes' " Colorschemes (Favs: purify, minimalist, nord, pyte, onedark, oceanic_material, tender, 
									 " gruvbox, hybrid, deep-space, archery, sonokai)
									 " To get a list with all themes, run: 
									 " ls $HOME/.local/share/nvim/plugged/awesome-vim-colorschemes/colors
Plug 'drewtempelmeyer/palenight.vim' " Palenight theme
Plug 'preservim/tagbar' " Tagbar - requires ctags
Plug 'neovim/nvim-lspconfig' " Language server
Plug 'hrsh7th/nvim-cmp' " Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp' " Ac stuff
Plug 'hrsh7th/cmp-buffer' " Ac stuff
Plug 'hrsh7th/cmp-path' " Ac stuff
Plug 'hrsh7th/cmp-cmdline' " Ac stuff
Plug 'hrsh7th/cmp-vsnip' " Ac stuff
Plug 'hrsh7th/vim-vsnip' " Ac stuff
Plug 'andweeb/presence.nvim' " Discord rich presence
Plug 'glepnir/dashboard-nvim' " Dashboard
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder, and also a Dashboard dependencie 
Plug 'nvim-lua/plenary.nvim' " Telescope dependencie
Plug 'kyazdani42/nvim-web-devicons' " Icons
Plug 'romgrk/barbar.nvim' " Files bar
Plug 'akinsho/toggleterm.nvim' " Terminal
Plug 'KabbAmine/vCoolor.vim' " Color picker
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Color visualizer

call plug#end()

" Calling plugins configs
source ~/.config/nvim/plugins/configs/dashboard.vim
source ~/.config/nvim/plugins/configs/nerdtree.vim
source ~/.config/nvim/plugins/configs/rich-presence.vim
source ~/.config/nvim/plugins/configs/hexokinase.vim

luafile ~/.config/nvim/plugins/configs/lualine.lua
luafile ~/.config/nvim/plugins/configs/cmp.lua
luafile ~/.config/nvim/plugins/configs/lsp.lua
luafile ~/.config/nvim/plugins/configs/toggleterm.lua
