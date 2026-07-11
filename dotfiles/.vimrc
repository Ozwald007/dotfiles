"dein Scripts-----------------------------

if &compatible
  set nocompatible
endif

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Plugin executable file path.
execute 'set runtimepath+=' .. s:dein_src

" Path to directory to download plugins.
call dein#begin(s:dein_base)

" Let dein manage dein
if dein#load_state('~/.vim/dein')
  call dein#add(s:dein_src)

  " Add or remove your plugins here:
  " 補完機能が有効になる
  call dein#add('Shougo/neocomplete.vim')
  " スニペット機能が有効になる
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  " カーソル移動を加速する
  call dein#add('rhysd/accelerated-jk')
  " ステータスバーをカスタマイズ
  call dein#add('vim-airline/vim-airline')
  " ファイルに変更が加わった際に、Vimの行番号のところに「+」や「-」といった差分情報を表示する
  call dein#add('airblade/vim-gitgutter')
  " インデントを揃える
  call dein#add('junegunn/vim-easy-align')
  " コメントアウトを複数行選択が可能
  call dein#add('tpope/vim-commentary')
  " 空白行を可視化する
  call dein#add('preservim/vim-indent-guides')
  " ファイル末尾の余分なスペースをハイライト表示する
  call dein#add('bronson/vim-trailing-whitespace')

  " Finish dein initialization (required)
  call dein#end()
  call dein#save_state()
endif

filetype indent plugin on

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------

" Screen display settings
" 行番号を表示する
set number
" カーソル行を強調表示
set cursorline
" カーソル列を強調表示
set cursorcolumn
" 編集中のファイル名を表示
set title
" 対応する括弧を強調表示
set showmatch
" コードの色分け
syntax enable
" 不可視文字を表示
set list
" 不可視文字を表示記号指定
set listchars=tab:▸\ ,extends:❯,precedes:❮
" ハイライト有効
syntax enable
" カラースキーム    
colorscheme molokai
" カラースキームの表示をデフォルトに近づける
let g:rehash256 = 1

" Settings related to cursor movement
"deleteキーで削除
set backspace=indent,eol,start
" 行頭行末の左右移動で行を跨ぐ
set whichwrap=b,s,h,l,<,>,[,]
" 上下8行の視界を確保
set scrolloff=8
" 左右スクロール時の視界を確保
set sidescrolloff=16
" 左右スクロールは一文字づつ行う
set sidescroll=1

" File processing related settings
" 保存されていないファイルがあるときは終了前に保存確認
set confirm
" 外部でファイルに変更がされた場合は読み直す
set autoread
" ファイル保存時にバックアップファイルを作らない
set nobackup
" ファイル編集中にスワップファイルを作らない
set noswapfile

" Find/replace settings
" 検索文字列をハイライトする
set hlsearch
" インクリメンタルサーチを行う
set incsearch
" 大文字と小文字を区別しない
set ignorecase
" 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set smartcase
" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan
" 置換の時 g オプションをデフォルトで有効にする
set gdefault

" Setting tabs/indentation
" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=2
" 自動インデントでずれる幅
set shiftwidth=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" Setting up an integration relationship with the operating environment
" OSのクリップボードに Yank, Put 出来るようにする
set clipboard+=unnamed
" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=0

" Command line settings
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" Beep settings
"ビープ音すべてを無効にする
set visualbell t_vb=
"エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" Plugin settings
" ポジション駆動で加速する
nmap j <Plug>(accelerated_jk_gj_position)
nmap k <Plug>(accelerated_jk_gk_position)
" インデントガイドを有効化
let g:indent_guides_enable_on_vim_startup = 1
