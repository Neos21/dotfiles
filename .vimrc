" ================================================================================
" .vimrc
" ================================================================================


" 文字コードを UFT-8 に設定する
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるようにする
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボード連携を有効にする (MacOS の場合は unnamedplus ではなく unnamed で有効にできた・vi ではなく vim を使うこと)
set clipboard&
set clipboard^=unnamed
" クリップボード連携を有効にした時に BackSpace (Delete) が効かなくなるので設定する
set backspace=indent,eol,start


" 見た目
" ------------------------------------------------------------

" Monokai カラースキーム
syntax on
colorscheme monokai
" 範囲選択が見づらいので変更する
hi Visual ctermbg=227

" 行番号を表示する
set number
" 現在の行を強調表示する
set cursorline
" カーソルラインの色をクリアする
hi clear CursorLine
" 行末の1文字先までカーソルを移動できるようにする
set virtualedit=onemore
" スマートインデントにする
set smartindent
" ビープ音を可視化する
set visualbell
" 括弧入力時の対応する括弧を表示する
set showmatch
" ステータスラインを常に表示する
set laststatus=2
" コマンドライン補完を有効にする
set wildmode=list:longest
" 折り返し時に表示行単位での移動をできるようにする
nnoremap j gj
nnoremap k gk


" Tab 文字
" ------------------------------------------------------------

" 不可視文字を可視化 (タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab 文字を半角スペースにする
set expandtab
" 行頭以外の Tab 文字の表示幅 (スペースの数)
set tabstop=2
" 行頭での Tab 文字の表示幅
set shiftwidth=2


" 検索
" ------------------------------------------------------------

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示する
set hlsearch


" ウィンドウ
" ------------------------------------------------------------

" ウィンドウを垂直縦分割する
nmap sv :vsplit<Return><C-w>w
" ウィンドウを水平横分割する
nmap sh :split<Return><C-w>w

" Space でウィンドウ移動する
nmap <Space> <C-w>w
" s + 矢印キーでウィンドウ移動する
map s<left> <C-w>h
map s<down> <C-w>j
map s<up> <C-w>k
map s<right> <C-w>l
" s + hjkl でウィンドウ移動する
map sh <C-w>h
map sj <C-w>j
map sk <C-w>k
map sl <C-w>l

" ウィンドウをリサイズする
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" タブ移動
nmap <Tab> :tabnext<Return>
nmap <S-Tab> :tabprev<Return>

" Ctrl + z で元に戻す (u)
nnoremap <C-z> u
" Ctrl + y でやり直す (Ctrl + r)
nnoremap <C-Y> <C-r>

" Esc 連打で :nohlsearch が出ないようにする
nnoremap <Esc><Esc> <Esc>
