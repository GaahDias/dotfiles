" Keymaps
" Nerdtree, tagbar, term and ranger (see toggleterm.lua) toggles
nnoremap <silent> <F5> :call NtToggle() <CR>
nnoremap <silent> <F6> :TagbarToggle <CR>
nnoremap <silent> <F7> :ToggleTerm <CR>
nnoremap <silent> <F8> :lua _RANGER_TOGGLE() <CR>
nnoremap <silent> <F9> :lua _HTOP_TOGGLE() <CR>

" Quit, write
nnoremap <C-q> :q! <CR>
nnoremap <C-s> :w <CR>

" Delete, cut
nnoremap d "_d
vnoremap d "_d
nnoremap x "+d
vnoremap x "+d

" Split screen
nnoremap <C-v> :vsplit <CR>
nnoremap <C-h> :split <CR>

" Color picker
nnoremap <A-h> :VCoolor <CR>
nnoremap <A-r> :VCoolIns r <CR>

" Tabs
nnoremap <C-j> :BufferPrevious <CR>
nnoremap <C-k> :BufferNext <CR>
nnoremap <A-1> :BufferGoto 1 <CR> 
nnoremap <A-2> :BufferGoto 2 <CR>
nnoremap <A-3> :BufferGoto 3 <CR>
nnoremap <A-4> :BufferGoto 4 <CR>
nnoremap <A-5> :BufferGoto 5 <CR>
nnoremap <A-6> :BufferGoto 6 <CR>
nnoremap <A-7> :BufferGoto 7 <CR>
nnoremap <A-8> :BufferGoto 8 <CR>
nnoremap <A-9> :BufferGoto 9 <CR>
