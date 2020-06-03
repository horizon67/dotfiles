if &compatible
  set nocompatible
endif

syntax on

filetype off
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', {'build': 'make'}

Plug 'bronson/vim-trailing-whitespace'
Plug 'rhysd/accelerated-jk'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'posva/vim-vue'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'mattn/vim-lsp-settings'
" Plug 'mattn/vim-goimports'
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
  autocmd FileType go          setlocal sw=4 ts=4 noexpandtab
endif

" color
syntax on
colorscheme darkblue

map <C-n> :NERDTreeToggle<CR>
let g:go_term_mode = 'split'

"-------------------------------------------------------------------------------
" vim-lsp設定
"-------------------------------------------------------------------------------
nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>h :LspHover<CR>
nnoremap <silent> <Leader>r :LspReferences<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>n :LspNextError<CR>
nnoremap <silent> <Leader>s :split \| :LspDefinition <CR>
nnoremap <silent> <Leader>v :vsplit \| :LspDefinition <CR>
