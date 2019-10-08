set nocompatible              " be iMproved, required
filetype on			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Goyo Distraction free mode
Plugin 'junegunn/goyo.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Node Vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'flazz/vim-colorschemes'
Plugin 'rust-lang/rust.vim'


set nu!
" colorscheme materhorn 
colorscheme sexy-railscasts
if has("gui_running")
	set guifont=Hack\ 11
	set guioptions -=T
	set guioptions -=L
	set guioptions -=r
endif

" Convert modes to strings
let g:currentMode={
    \ 'n'  : '  Normal ',
    \ 'no' : '  N·Operator Pending ',
    \ 'v'  : '  Visual ',
    \ 'V'  : '  V·Line ',
    \ '^V' : '  V·Block ',
    \ 's'  : '  Select ',
    \ 'S'  : '  S·Line ',
    \ '^S' : '  S·Block ',
    \ 'i'  : '  Insert ',
    \ 'R'  : '  Replace ',
    \ 'Rv' : '  V·Replace ',
    \ 'c'  : '  Command ',
    \ 'cv' : '  Vim Ex ',
    \ 'ce' : '  Ex ',
    \ 'r'  : '  Prompt ',
    \ 'rm' : '  More ',
    \ 'r?' : '  Confirm ',
    \ '!'  : '  Shell ',
    \ 't'  : '  Terminal '
    \}

function StatuslineMode()
	if (mode()=~#'\v(n|no)')
		exe 'hi! StatusLine guibg=#E3E9E7'
	elseif (mode()==#'i')
		exe 'hi! StatusLine guibg=#7EAF6E'
		exe 'hi! Cursor     guibg=#7EAF6E guifg=#272D2D' 
	elseif (mode()==#'v')
		exe 'hi! StatusLine guibg=#EF8196'
		exe 'hi! Cusor      guibg=#8C4C58 guifg=#272D2D'
	endif

	return toupper(g:currentMode[mode()])
endfunction

let g:netrw_banner = 0
let g:netrw_liststyle = 2
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
syn on
" Set Hotkeys for easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Custom Status Line
set laststatus=2
set statusline=
set statusline+=  
set statusline+=%{StatuslineMode()}
set statusline+=%#StatusLineBg#
set statusline+=\ %n
set statusline+= | 
set statusline+=%f
set statusline+=%Y
