if &compatible
  set nocompatible
endif

set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim


call dein#begin(expand('~/.vim/bundle'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('bronson/vim-trailing-whitespace')
call dein#add('rhysd/accelerated-jk')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('kien/ctrlp.vim')
call dein#add('flazz/vim-colorschemes')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-endwise')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-rails')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive')
call dein#add('kchmck/vim-coffee-script')
call dein#add('rking/ag.vim')
call dein#add('elixir-lang/vim-elixir')
call dein#add('awetzel/elixir.nvim')
call dein#add('avdgaag/vim-phoenix')
call dein#add('slim-template/vim-slim')
call dein#add('posva/vim-vue')
call dein#add('fatih/vim-go')

call dein#end()
if dein#check_install()
  call dein#install()
endif

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
