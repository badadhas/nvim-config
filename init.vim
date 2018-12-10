" dein.vim
let s:plugins_dir = expand('~/.cache/dein')
let s:dein_dir = s:plugins_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
	endif
	execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:plugins_dir)
	call dein#begin(s:plugins_dir)
	call dein#load_toml('~/.config/nvim/plugins.toml', {})
	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax on

if dein#check_install()
	call dein#install()
endif

" display
set breakindent  " wrapした行もインデントする
set cursorline  " カーソルがある行にアンダーラインを引く
set laststatus=2  " ステータスラインを常に表示する
set noequalalways  " 分割したウィンドウのサイズを他のウィンドウと同じにしない
set number  " 行頭に行番号を表示する
set ruler  " ルーラー(カーソルが何行目の何列目にあるか)を表示する。
set scrolloff=5 " 画面端から指定した行を残してスクロールする
set statusline=%<%F%h%m%r%w\ %y%=[0x%B]\ %l/%L,%v\ %p%% " ステータスラインのフォーマット
set title  " ウィンドウのタイトルを設定する。デフォルトではファイル名やパスなどを表示する
set wrap  " 折り返しを有効にする
set wildmenu    " コマンドライン補完の候補をステータスラインに表示する
set list listchars=tab:>-,trail:-,nbsp:+	" 空白文字を可視化する

" search
set ignorecase  " 検索するときに大文字小文字の違いを無視する
set smartcase  " 大文字を含めて検索するときには大文字小文字を区別する
set wrapscan  " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set hlsearch  " 検索にマッチした文字列を全て強調表示する
set incsearch  " インクリメンタルサーチを有効にする

" edit
set autoindent  " 新しい行のインデントを現在の行と同じくする
set backspace=indent,eol,start  " 挿入モードでバックスペースを使って削除できる文字を指定する
set directory=~/.local/var/vim/tmp  " スワップファイルを保存するディレクトリ
"set iminsert=1  " 挿入モードを抜けるとIMEをオフにする
set mouse=a  " マウスを有効にする
set showmatch  " 閉じ括弧を入力した時に対応する括弧を表示する
set showmode  " 現在のモードを表示する
set smartindent  " プログラミング言語のブロック開始時のインデントを自動で行う
set inccommand=split    " 文字列置換をインタラクティブに行う(nvim)

" tab
set tabstop=4  " タブを表示する幅を設定する
set shiftwidth=4  " タブを表示する幅を設定する
set noexpandtab  " 入力したタブをスペースに置き換えない
set smarttab  " 行頭ではshiftwidthの数だけ空白を挿入。他の場所ではtabstopまたはsofttabstopの数だけ空白を挿入

" misc
colorscheme japanesque  " カラースキームを設定する
set helplang=ja,en  " ヘルプファイルを検索する言語の順番を指定する
set encoding=utf-8

" filetypes
aug MyAutoCmd
	au!
	au FileType html set tabstop=4 shiftwidth=4
	au FileType javascript,json set tabstop=4 shiftwidth=4
	au FileType css set tabstop=2 shiftwidth=2
	au FileType dart set tabstop=2 shiftwidth=2 expandtab
	au FileType python set tabstop=4 shiftwidth=4 expandtab
	au FileType python inoremap # X#
	au FileType ruby set tabstop=2 shiftwidth=2 expandtab
	au FileType vim set tabstop=4 shiftwidth=4
	au BufRead,BufNewFile /etc/nginx/* set ft=nginx
augroup END

" remap
noremap <ESC><ESC> :noh<CR>
