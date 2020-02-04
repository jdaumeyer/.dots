" Quality of Life Settings
set nu! 
set noshowmode
set hidden
set splitbelow
set splitright
set linebreak

" Theme
colo minima

let mapleader = "`"

" Source other files
so ~/.config/nvim/plugins.vim
so ~/.config/nvim/abbr.vim
so ~/.config/nvim/status.vim

"----------
" USABILITY
"----------

" Better word wrap key bindings
map j gj
map k gk

" Better Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Scroll Wheel Mappings
noremap <ScrollWheelUp> <C-Y>
noremap <S-ScrollWheelUp> <C-U>
noremap <ScrollWheelDown> <C-E>
noremap <S-ScrollWheelDown> <C-D>

" Better word wrapping
set textwidth=0
set wrapmargin=0
set formatoptions+=l

"-------------
" KEY MAPPINGS
"-------------

" Toggle Spell Check
noremap <leader>s :set spell!<CR>

" Goyo Hotkey
noremap <leader>f :Goyo<CR>

" Relative Line numbering
noremap <leader>r :set rnu!<CR>

" Display Buffers and numbers and wait for a number to switch to 
noremap <leader>b :ls<CR>:b<space>

" Display Buffers for splitting
noremap <leader>B :ls<CR>:vert sb<space>


"----------------
" CUSTOM COMMANDS
"----------------

" vimrc (~/.config/nvim/init.vim)
command -nargs=0 Vimrc e ~/.config/nvim/init.vim

autocmd BufNewFile *.md :set spell!
