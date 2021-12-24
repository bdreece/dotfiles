scripte cp932
syntax on
" colorscheme ~/.vim/colors-wal.vim

" Set tabs to 2 spaces
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" Enable mouse input
set mouse=a
"set ttymouse=sgr

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  augroup pluginstall | autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | augroup END
endif

call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'

Plug 'scrooloose/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin' |
      \ Plug 'ryanoasis/vim-devicons' |
      \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'christoomey/vim-tmux-navigator'

Plug 'prabirshrestha/async.vim'

Plug 'dense-analysis/ale' |
  \ Plug 'prabirshrestha/vim-lsp' |
  \ Plug 'rhysd/vim-lsp-ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'p00f/godbolt.nvim'

call plug#end()

nmap <C-g> :Godbolt<CR>
nnoremap <S-g> :'<.'>Godbolt<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-s> :terminal<CR>
nmap <S-s> :! 

nnoremap <C-f> :%s/

let g:airline_theme='minimalist'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.colnr = 'col:'
let g:airline_symbols.linenr = ' ln:'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.whitespace = ' '

let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:ale_fix_on_save = 1


augroup nerdTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTreeVCS | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && 
      \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') &&
      \ b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END

if executable('clangd')
  augroup lsp_clangd
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
              \ 'name': 'clangd',
              \ 'cmd': {server_info->['clangd']},
              \ 'whitelist': ['c', 'cpp'],
              \ })
  augroup end
endif

if executable('zls')
  augroup lsp_zls
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'zls',
          \ 'cmd': {server_info->['zls']},
          \ 'whitelist': ['zig'],
          \ })
  augroup end
endif

let g:ale_linters = { 'cpp': ['clangd'],
                    \ 'c': ['clangd'],
                    \ 'python': ['pylint'],
                    \ 'javascript': ['eslint'],
                    \ 'json': ['eslint'],
                    \ 'vim': ['vint'],
                    \ 'yaml': ['yamlfix'],
                    \}

let g:ale_fixers = { 'cpp': ['clang-format', 'clangtidy'],
                   \ 'c': ['clang-format', 'clangtidy'],
                   \ 'python': ['pylint'],
                   \ 'javascript': ['eslint'],
                   \ 'json': ['eslint'],
                   \ 'yaml': ['yamlfix'],
                   \}
lua << EOF
  require("godbolt").setup({
      c = { compiler = "cg112", options = { userArguments = "-Wall -Og", } },
      cpp = { compiler = "g112", options = {} },
      rust = { compiler = "r1560", options = {} },
      -- any_additional_filetype = { compiler = ..., options = ... },
      quickfix = {
          enable = false, -- whether to populate the quickfix list in case of errors
          auto_open = false -- whether to open the quickfix list if the compiler outputs errors
      }
})
EOF
