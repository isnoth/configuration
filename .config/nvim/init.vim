" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged/')

  " nvim plug
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
  Plug 'Shougo/deoplete.nvim' " For async completion
  Plug 'Shougo/denite.nvim' " For Denite features

  " ctrlp
  Plug 'ctrlpvim/ctrlp.vim'

  " file manager
  Plug 'scrooloose/nerdtree'

  " auto complete?
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " gist
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  " gista
  Plug 'lambdalisue/vim-gista'

  " tagbar
  Plug 'majutsushi/tagbar'

  " for tslint
  Plug 'dense-analysis/ale'

call plug#end()

let g:deoplete#enable_at_startup = 1


:set termencoding=utf-8
:set fileencodings=utf-8-bom,ucs-bom,utf-8,cp936,gb18030,ucs,big5
:set fileformats=unix
:set encoding=utf-8

:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set autoindent " same level indent
:set smartindent " next level indent
:set cindent
:set nu
:set rnu
:set hlsearch
:set backspace=2
:set expandtab


au BufNewFile,BufRead *.sdl,*.scc set filetype=sdl
au BufNewFile,BufRead *.ts set filetype=javascript "set typescript type to javasciprt
au BufNewFile,BufRead *.less set filetype=css "set less syntax to css

set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python

filetype plugin on
set ofu=syntaxcomplete#Complete
"autocmd FileType python
set omnifunc=pythoncomplete#Complete
"#autocmd FileType python runtime! pythoncomplete.vim
"
autocmd FileType python setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript sw=4 sts=4
autocmd BufNewFile,BufRead *.js setlocal filetype=javascript sw=4 sts=4

"默认展开所有代码
set foldlevel=99
syntax on


"color sheme
set t_Co=256
"colorscheme Mustang
"colorscheme desert256
colorscheme molokai

"" NERDTree
map <F10> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" neovim exit term
tnoremap <Esc> <C-\><C-n>

" typescript tagbar
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
  \ }

" ts lint
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

" ts fixer
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1

