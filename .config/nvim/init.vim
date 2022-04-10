" Basic config
:set number
:set tabstop=4
:set shiftwidth=4
:set mouse=a

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

call plug#end()

" Nvim theme
:colorscheme palenight

" True colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" Dashboard config
let g:dashboard_default_executive = 'telescope'

" Autocomplete
:set completeopt=menu,menuone,noselect

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

" Discord Rich Presence config
" let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "Using my keyboard a lot"
" let g:presence_main_image          = "neovim"
" let g:presence_editing_text        = "Editing %s"
" let g:presence_file_explorer_text  = "Browsing %s"
" let g:presence_git_commit_text     = "Committing changes"
" let g:presence_plugin_manager_text = "Managing plugins"
" let g:presence_reading_text        = "Reading %s"
" let g:presence_workspace_text      = "Working on %s"
" let g:presence_line_number_text    = "Line %s out of %s"

" Dashboard config
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" Lua code
lua << END
-- Lualine config
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'hostname', 'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

--Nvim lsp (https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
require'lspconfig'.pyright.setup{} -- Python
require'lspconfig'.sumneko_lua.setup{} -- Lua

-- Nvim-cmp (Autocomplete)
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  { name = 'path' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
END
