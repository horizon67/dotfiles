if &compatible
  set nocompatible
endif

set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim


call dein#begin(expand('~/.vim/bundle'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet.vim')

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
call dein#add('avdgaag/vim-phoenix')
call dein#add('slim-template/vim-slim')
call dein#add('alpaca-tc/alpaca_tags')
call dein#add('posva/vim-vue')
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

" color
syntax on
colorscheme darkblue
map <C-n> :NERDTreeToggle<CR>
