unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set bg=dark

inoremap <C-c> <Esc>

cmap w!! w !sudo tee > /dev/null %

set path+=**

set wildmenu

set undodir=~/.vim_undo
set undofile

set number
set tabstop=4
set expandtab

let g:netrw_banner=0
let g:netrw_liststyle=3

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Fix vim starting in replace mode.
" Taken from: https://superuser.com/questions/1284561/why-is-vim-starting-in-replace-mode
set t_u7=

" Always use tabs instead of spaces in Makefiles
autocmd FileType make setlocal noexpandtab
