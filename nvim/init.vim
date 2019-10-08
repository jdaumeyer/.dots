set nu! 
set noshowmode

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

"----------------
" CUSTOM COMMANDS
"----------------

" vimrc (~/.config/nvim/init.vim)
command -nargs=0 Vimrc tabe ~/.config/nvim/init.vim
