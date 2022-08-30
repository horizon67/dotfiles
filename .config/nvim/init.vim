if &compatible
  set nocompatible
endif

set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim


call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', {'build': 'make'}

Plug 'bronson/vim-trailing-whitespace'
Plug 'rainbowhxch/accelerated-jk.nvim'
Plug 'flazz/vim-colorschemes'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'awetzel/elixir.nvim'
Plug 'avdgaag/vim-phoenix'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve', { 'for': ['go'] }
Plug 'junegunn/seoul256.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

"-------------------------------------------------------------------------------
" 検索系
"-------------------------------------------------------------------------------
set ignorecase                     "小文字の検索でも大文字も見つかるようにする
set smartcase                      "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch                      "インクリメンタルサーチを行う
set nowrapscan                     "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set history=1000                   "コマンド、検索パターンを100個まで履歴に残す

"-------------------------------------------------------------------------------
" タブ系
"-------------------------------------------------------------------------------
set expandtab                      "Insertモードで<tab> を挿入するのに、適切な数の空白を使う
set tabstop=2                      "ファイル内の <tab> が対応する空白の数
set smarttab                       "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set shiftwidth=2
set softtabstop=0
set pastetoggle=<C-E>

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go          setlocal sw=4 ts=4 noexpandtab
  autocmd FileType go nmap <silent> ;d :DlvToggleBreakpoint<CR>
endif
nmap  gd (coc-definition)

" color
syntax on
colo seoul256

map <C-n> :NERDTreeToggle<CR>
let g:go_term_mode = 'split'


runtime coc.vim
