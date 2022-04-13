" Keymaps
" Nerdtree, tagbar, term and ranger (see toggleterm.lua) toggles
nnoremap <F5> :call NtToggle() <CR>
nnoremap <F6> :TagbarToggle <CR>
nnoremap <F7> :ToggleTerm <CR>
nnoremap <F8> :lua _RANGER_TOGGLE() <CR>
nnoremap <F9> :lua _HTOP_TOGGLE() <CR>

" Quit, write, w&q
nnoremap <C-q> :q! <CR>
nnoremap <C-w> :w! <CR>
nnoremap <C-s> :wq <CR>

" Color picker
nnoremap <A-h> :VCoolor <CR>
nnoremap <A-r> :VCoolIns r <CR>

" Tabs
nnoremap <C-Left> :BufferPrevious <CR>
nnoremap <C-Right> :BufferNext <CR>
nnoremap <A-1> :BufferGoto 1 <CR> 
nnoremap <A-2> :BufferGoto 2 <CR>
nnoremap <A-3> :BufferGoto 3 <CR>
nnoremap <A-4> :BufferGoto 4 <CR>
nnoremap <A-5> :BufferGoto 5 <CR>
nnoremap <A-6> :BufferGoto 6 <CR>
nnoremap <A-7> :BufferGoto 7 <CR>
nnoremap <A-8> :BufferGoto 8 <CR>
nnoremap <A-9> :BufferGoto 9 <CR>
