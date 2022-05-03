" Theming settings
syntax on
colorscheme colors-wal
hi! VertSplit cterm=bold gui=bold
hi! TabLineSel ctermfg=121 gui=bold guifg=Green 
hi! TabLineFill cterm=bold gui=bold
hi! TabLine cterm=bold gui=bold
hi! clear LineNr
hi! LineNr cterm=bold gui=bold

function TabLine()
	let s = ''
		for i in range(tabpagenr('$'))
	    	" select the highlighting
	    	if i + 1 == tabpagenr()
	      		let s .= '%#TabLineSel#'
	    	else
	      		let s .= '%#TabLineFill#'
	    	endif

	    	" set the tab page number (for mouse clicks)
	    	let s .= '%' . (i + 1) . 'T'

	    	" the label is made by MyTabLabel()
	    	let s .= ' %{TabLabel(' . (i + 1) . ')} '
	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s .= '%#TabLineFill#%T'

	  return s
endfunction

function TabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let path = bufname(buflist[winnr - 1])
    let label = fnamemodify(path, ":t")
    return label
endfunction

" Global sets
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showtabline=2
set tabline=%!TabLine() 
set makeprg=prog\  
set mouse=a
set number

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Configure runtime
runtime! archlinux.vim

" Autoinstall VimPlug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  augroup pluginstall | autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | augroup END
endif


" VimPlug Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'dylanaraps/wal.vim'

Plug 'rust-lang/rust.vim'

Plug 'evanleck/vim-svelte'

Plug 'scrooloose/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin' |
      \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'christoomey/vim-tmux-navigator'

Plug 'prabirshrestha/async.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc', 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'metakirby5/codi.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Keybindings
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-c> :make build<CR>
nmap <C-x> :make run<CR>
nmap <C-t> :tabnew +term<CR>
nmap <S-t> :split +term<CR>
nmap <C-s> :call Scratch()<CR>
nnoremap <C-f> :%s/
nnoremap <C-d> :bd<CR>
nnoremap <C-q> :wa<CR>:qa<CR>
inoremap <c-x><c-k> <c-x><c-k>
inoremap <Tab> <c-v><Tab>
tnoremap <Esc> <C-\><C-n>

" Custom functions
function! Scratch()
    tabnew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    execute "Codi python"
endfunction

function! DeleteBuf()
    bd
endfunction

" Global plugin variables
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python'

let g:webdevicons_enable_nerdtree = 1 


let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 0 
let g:airline_symbols.colnr = 'col:'
let g:airline_symbols.linenr = ' ln:'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.whitespace = ' '

let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeAutoDeleteBuffer=1
"let g:NERDTreeStatusline = '%#NonText#'
let g:NERDTreeStatusline = ''
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

" Autocommand Groups
augroup nerdTree
    autocmd!
	" Start NERDTree and put the cursor back in the other window.
	"autocmd VimEnter * NERDTreeVCS | wincmd p

	" Exit Vim if NERDTree is the only window remaining in the only remaining tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
      \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

	" Open the existing NERDTree on each new tab.
	"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END

augroup cocFormat
    autocmd!
    autocmd BufWritePre * | call CocActionAsync('format')
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

augroup python_tabs
    autocmd!
    autocmd Filetype python setlocal noexpandtab | setlocal preserveindent
augroup end

augroup scratch_buffer_exit
    autocmd!
    autocmd BufWinLeave scratch call DeleteBuf()
augroup end

augroup term_nums
	autocmd!
    autocmd TermOpen * setlocal nonumber | setlocal statusline=""
augroup end
