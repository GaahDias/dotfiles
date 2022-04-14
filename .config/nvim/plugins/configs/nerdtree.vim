" NERDTree (nt) config:
" Start NERDTree when Vim starts with a directory argument.
function! StartUp()
    if 0 == argc()
        NERDTree ~/
    else
        if argv(0) == '.'
            execute 'NERDTree' getcwd()
        else
            execute 'NERDTree' getcwd() . '/' . argv(0)
        endif
    endif
endfunction

autocmd VimEnter * call StartUp()
autocmd VimEnter * wincmd p

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
