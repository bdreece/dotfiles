scripte cp932
syntax on
 
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

set mouse=a

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  augroup pluginstall | autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | augroup END
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/argtextobj.vim'

call plug#end()

nmap <C-n> :NERDTreeToggle<CR>
inoremap <c-x><c-k> <c-x><c-k>
tnoremap <Esc> <C-\><C-n>

let g:python_host_prog = '/usr/bin/python'

augroup termOptions
    autocmd TermOpen * setlocal norelativenumber | file zsh
augroup END
