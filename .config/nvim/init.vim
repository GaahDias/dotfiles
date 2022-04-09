" Basic config
:set number
:set tabstop=4
:set shiftwidth=4
:set mouse=a

" Plugins
call plug#begin()

Plug 'https://github.com/nvim-lualine/lualine.nvim' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NERDTree
Plug 'https://github.com/tpope/vim-commentary' " Comments - gcc
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Colorschemes (Favs: purify, minimalist, nord, pyte, onedark, oceanic_material, tender, 
														" gruvbox, hybrid, deep-space, archery, sonokai)
														" To get a list with all themes, run: 
														" ls $HOME/.local/share/nvim/plugged/awesome-vim-colorschemes/colors
Plug 'https://github.com/preservim/tagbar' " Tagbar - requires ctags
Plug 'https://github.com/neovim/nvim-lspconfig'

call plug#end()

" NERDTree (nt) config:
" Starts nt with nvim
autocmd vimEnter * NERDTree | wincmd p

" Quit nt if it's the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Set nt window size
:let NERDTreeWinSize = 24

" Func for toggling nt
function NtToggle()
	if g:NERDTree.IsOpen()
    	:NERDTreeToggle 
		echon ''
	else
		:NERDTree | wincmd p
		echon ''
	endif
endfunction

" Keymaps
nnoremap <F5> :call NtToggle() <CR>
nnoremap <F6> :TagbarToggle <CR>

" Colorscheme
:colorscheme sonokai

" Lua code
lua << END
-- Lualine config
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END
