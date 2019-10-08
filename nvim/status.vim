let g:currentmode={
    \ 'n'      : '[NORMAL]',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : '[VISUAL]',
    \ 'V'      : 'V·Line',
    \ '\<C-V>' : 'V·Block',
    \ 's'      : 'Select',
    \ 'S'      : 'S·Line',
    \ '\<C-S>' : 'S·Block',
    \ 'i'      : '[INSERT]',
    \ 'R'      : '[REPLACE',
    \ 'Rv'     : 'V·Replace',
    \ 'c'      : '[COMMAND]',
    \ 'cv'     : 'Vim Ex',
    \ 'ce'     : 'Ex',
    \ 'r'      : 'Prompt',
    \ 'rm'     : 'More',
    \ 'r?'     : 'Confirm',
    \ '!'      : 'Shell',
    \ 't'      : 'Terminal'
    \}

function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermbg = black ctermfg = white'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermbg = black ctermfg = red'
    exe 'hi! Cursor ctermfg = red'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermbg = black ctermfg = green'
    exe 'hi! Cursor ctermfg = green'
  elseif (mode() ==# 'c')
    exe 'hi! Statusline ctermbg = black ctermfg = white'
  else
    exe 'hi! StatusLine ctermbg = black ctermfg = white'
  endif

  return ''
endfunction

set laststatus=2
set statusline=
set statusline=%1*\ 
set statusline+=%{ChangeStatuslineColor()}
set statusline+=%0*%{toupper(g:currentmode[mode()])}
set statusline+=%4*\ %t
set statusline+=%1* 
set statusline+=%=
set statusline+=%4*\ %y
set statusline+=%1*\ 
set statusline+=%4*
set statusline+=%p
set statusline+=%4*\ 
set lazyredraw!

hi User1 ctermfg = 15 ctermbg = 0 
hi User2 ctermfg = 0  ctermbg = 2
hi User3 ctermfg = 0  ctermbg = 15
hi User4 ctermfg = 15 ctermbg = 0
