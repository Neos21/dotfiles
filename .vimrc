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
" Esc 連打で :nohlsearch が出ないようにする
nnoremap <Esc><Esc> <Esc>
" コマンドラインウィンドウを開かないようにする
nnoremap q: <Esc>


" ファイラ
" ------------------------------------------------------------

" netrw プラグインを有効にする
filetype plugin on

" 画面上部の情報を非表示にする
let g:netrw_banner=0
" 表示形式をツリー形式にする
let g:netrw_liststyle=3
" サイズを K, M, G で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy-mm-dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y-%m-%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
" v でファイルを開くときは右側に開く
let g:netrw_altv=1
" o でファイルを開くときは下側に開く
let g:netrw_alto=1
" netrw 中の t (新しいタブで開く) キーを無効化しメタキーが動作するようにする
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  noremap <buffer> t <C-w>
endfunction


" 見た目
" ------------------------------------------------------------

" Monokai カラースキーム
syntax on
colorscheme monokai

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

" 不可視文字を可視化する
set list listchars=tab:\▸\-,space:·,trail:·
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

" t + \ ・ t + | でウィンドウを垂直縦分割する
nmap t<Bslash> :vsplit<Return><C-w>w
nmap t<Bar> :vsplit<Return><C-w>w
" t + - でウィンドウを水平横分割する
nmap t- :split<Return><C-w>w

" t + hjkl でウィンドウ移動する
map th <C-w>h
map tj <C-w>j
map tk <C-w>k
map tl <C-w>l
" t + HJKL でウィンドウをリサイズする
nmap tH <C-w>>
nmap tJ <C-w>-
nmap tK <C-w>+
nmap tL <C-w><

" t + 矢印キーでウィンドウ移動する
map t<Left> <C-w>h
map t<Down> <C-w>j
map t<Up> <C-w>k
map t<Right> <C-w>l
" Ctrl + w → 矢印キーでウィンドウをリサイズする
nmap <C-w><Left> <C-w>>
nmap <C-w><Down> <C-w>-
nmap <C-w><Up> <C-w>+
nmap <C-w><Right> <C-w><

" Space でウィンドウ移動する
nmap <Space> <C-w>w

" Tab・Space + Tab でタブ移動
nmap <Tab> :tabnext<Return>
nmap <S-Tab> :tabprev<Return>

" Ctrl + z で元に戻す (u)
nnoremap <C-z> u
" Ctrl + y でやり直す (Ctrl + r)
nnoremap <C-y> <C-r>

" 新しいウィンドウを右に開く
set splitright
" 新しいウィンドウを下に開く
set splitbelow
