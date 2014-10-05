set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on      " required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 NeoBundle 'Shougo/neocomplcache'
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'flazz/vim-colorschemes'
 NeoBundle 'slim-template/vim-slim'
 NeoBundle 'tpope/vim-endwise'

 " インデントに色を付けて見やすくする
 NeoBundle 'nathanaelkane/vim-indent-guides'
 " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
 let g:indent_guides_enable_on_vim_startup = 1

 " コメントON/OFFを手軽に実行
 NeoBundle 'tomtom/tcomment_vim'

 " Rails向けのコマンドを提供する
 NeoBundle 'tpope/vim-rails'

 " ファイルをtree表示してくれる
 NeoBundle 'scrooloose/nerdtree'

 " Gitを便利に使う
 NeoBundle 'tpope/vim-fugitive'
 " grep検索の実行後にQuickFix Listを表示する
 autocmd QuickFixCmdPost *grep* cwindow
 " ステータス行に現在のgitブランチを表示する
 set statusline+=%{fugitive#statusline()}

 " You can specify revision/branch/tag.
 NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
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

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.html set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.jbuilder set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.slim set nowrap tabstop=2 shiftwidth=2

" color
:colorscheme darkblue
