highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

" Special
hi clear Cursor
hi Cursor     ctermfg=15 ctermbg=8
hi TermCursor ctermfg=0  ctermbg=8
hi CursorLine ctermfg=0  ctermbg=8
hi LineNr     ctermfg=8  ctermbg=0
hi MatchParen ctermfg=15 ctermbg=8

" Normal Styles
hi Normal    ctermfg=15 ctermbg=0
hi clear Comment
hi Comment   ctermfg=8  ctermbg=0
hi Constant  ctermfg=7  ctermbg=0
hi String    ctermfg=2  ctermbg=0 cterm=italic
hi Statement ctermfg=15 ctermbg=0 cterm=bold
hi Keyword   ctermfg=2  ctermbg=0 cterm=bold
hi Label     ctermfg=2  ctermbg=0 cterm=bold
hi Type      ctermfg=2  ctermbg=0 cterm=bold
hi Error     ctermfg=0  ctermbg=9 cterm=bold


" Selections
hi Visual ctermfg=15 ctermbg=12

" Spelling
hi SpellBad ctermfg=9  ctermbg=0  cterm=underline
