"プラグイン管理(dein.vim) ####################################################
if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"日本語の有効化 ####################################################
set encoding=utf-8
scriptencoding utf-8

"表示設定 ##########################################################
"ファイル名の表示
set title
"行番号の表示
set number
"括弧入力時の対応括弧をハイライト
set showmatch
"showmatchにかかる時間
" set matchtime=1 なぜか対応する括弧の表示が遅れることがあったのでコメントアウト
"コードの色分け
syntax on

"ファイル管理
"バックアップファイルやスワップファイルを作成しない
set nowritebackup
set nobackup
set noswapfile

"動作設定 #########################################################
"タブ押しをスペース4つ分に
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
"オートインデント
set smartindent
"バックスペースを，空白，行末，行頭でも使用可能に
set backspace=indent,eol,start "バックスペースを，空白・行末・行頭でも使用可
filetype plugin indent on "自動インデント

"検索設定 #########################################################
"文字列検索
"1文字入力ごとに検索
set incsearch
"検索時，最後まで行ったら最初に戻る
"検索結果のハイライト
set hlsearch
"ESCキー2度押しでハイライトの無効化
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>
" 同様に<C-l>に割り当て
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"コピペの有効化
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc[200~ XTermPasteBgin("")
endif

"カーソルの次の文字列を取得（引数は取得したい文字列）
function! GetNextString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = l:str.getline(".")[col(".")-1+i]
	endfor
	return l:str
endfunction

"カーソルの前の文字列を取得（引数は取得したい文字列）
function! GetPrevString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = getline(".")[col(".")-2-i].l:str
	endfor
	return l:str
endfunction

"アルファベットかどうか取得
function! IsAlphabet(char) abort
	let l:charIsAlphabet = (a:char =~ "\a")
	return (l:charIsAlphabet)
endfunction

"全角かどうかを取得
function! IsFullWidth(char) abort
	let l:charIsFullWidth = (a:char =~ "[^\x01-\x7E]")
	return (l:charIsFullWidth)
endfunction

"数字かどうかを取得
function! IsNum(char) abort
	let l:charIsNum = (a:char >= "0" && a:char <= "9")
	return (l:charIsNum)
endfunction

"括弧の中にいるかどうかを取得
function IsInsideParentheses(prevChar, nextChar) abort
	let l:cursorIsInsideParentheses1 = (a:prevChar == "{" && a:nextChar == "}")
	let l:cursorIsInsideParentheses2 = (a:prevChar == "[" && a:nextChar == "]")
	let l:cursorIsInsideParentheses3 = (a:prevChar == "(" && a:nextChar == ")")
	return (l:cursorIsInsideParentheses1 || l:cursorIsInsideParentheses2 || l:cursorIsInsideParentheses3)
endfunction

"括弧の入力
function! InputParentheses(parenthesis) abort
    let l:nextChar = GetNextString(1)
    let l:prevChar = GetPrevString(1)
    let l:parentheses = { "{": "}", "[": "]", "(": ")" }

    let l:nextCharIsEmpty = (l:nextChar == "")
    let l:nextCharIsCloseParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
    let l:nextCharIsSpace = (l:nextChar == " ")
    if l:nextCharIsEmpty || l:nextCharIsCloseParenthesis || l:nextCharIsSpace
        return a:parenthesis.l:parentheses[a:parenthesis]."\<LEFT>"
    else
        return a:parenthesis
    endif
endfunction

inoremap <expr> { InputParentheses("{")
inoremap <expr> [ InputParentheses("[")
inoremap <expr> ( InputParentheses("(")

"とじ括弧の入力
function! InputCloseParenthesis(parenthesis) abort
    let l:nextChar = GetNextString(1)
    if l:nextChar == a:parenthesis
        return "\<RIGHT>"
    else
        return a:parenthesis
    endif
endfunction

inoremap <expr> } InputCloseParenthesis("}")
inoremap <expr> ] InputCloseParenthesis("]")
inoremap <expr> ) InputCloseParenthesis(")")

"クォーテーションの入力
function! InputQuot(quot) abort
    let l:nextChar = GetNextString(1)
    let l:prevChar = GetPrevString(1)
    
    " let l:cursorIsInsideQuotes = (l:nextChar == a:quot)
    let l:nextCharIsEmpty = (l:nextChar == "")
    let l:nextCharIsCloseingParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
    let l:nextCharIsSpace = (l:nextChar == " ")
    let l:nextCharIsQuot = (l:nextChar == "\'" || l:nextChar == "\"")
    let l:prevCharIsAlphabet = IsAlphabet(l:prevChar)
    let l:prevCharIsFullWidth = IsFullWidth(l:prevChar)
    let l:prevCharIsNum = IsNum(l:prevChar)
    let l:prevCharIsQuot = (l:prevChar == "\'" || l:prevChar == "\"")

    if l:nextCharIsQuot
        return "\<RIGHT>"
    elseif l:prevCharIsAlphabet || l:prevCharIsNum || l:prevCharIsFullWidth || l:prevCharIsQuot
        return a:quot
    elseif l:nextCharIsEmpty || l:nextCharIsCloseingParenthesis || l:nextCharIsSpace
        return a:quot.a:quot."\<LEFT>"
    else
        return a:quot
    endif
endfunction

inoremap <expr> ' InputQuot("\'")
inoremap <expr> " InputQuot("\"")

"改行の入力
function! InputCR() abort
    let l:nextChar = GetNextString(1)
    let l:prevChar = GetPrevString(1)
    let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar, l:nextChar)

    if l:cursorIsInsideParentheses
        return "\<CR>\<ESC>\<S-o>"
    else
        return "\<CR>"
    endif
endfunction

inoremap <expr> <CR> InputCR()

"バックスペースの入力
function! InputBS() abort
    let l:nextChar = GetNextString(1)
    let l:prevChar = GetPrevString(1)
    let l:nextTwoString = GetNextString(2)
    let l:prevTwoString = GetPrevString(2)

    let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar, l:nextChar)

    let l:cursorIsInsideSpace1 = (l:prevTwoString == "{ " && l:nextTwoString == " }")
    let l:cursorIsInsideSpace2 = (l:prevTwoString == "[ " && l:nextTwoString == " ]")
    let l:cursorIsInsideSpace3 = (l:prevTwoString == "( " && l:nextTwoString == " )")
    let l:cursorIsInsideSpace = (l:cursorIsInsideSpace1 || l:cursorIsInsideSpace2 || l:cursorIsInsideSpace3)

    let l:existsQuot = (l:prevChar == "'" && l:nextChar == "'")
    let l:existsDoubleQuot = (l:prevChar == "\"" && l:nextChar == "\"")

    if l:cursorIsInsideParentheses || l:cursorIsInsideSpace || l:existsQuot || l:existsDoubleQuot
        return "\<BS>\<RIGHT>\<BS>"
    else
        return "\<BS>"
    endif
endfunction

inoremap <expr> <BS> InputBS()

"jedi-vimの設定
"ポップアップの無効化
autocmd FileType python setlocal completeopt-=preview

"行頭行末の左右移動で行を跨ぐようにする
set whichwrap=b,s,h,l,<,>,[,]
"Backspaceの影響範囲に制限を設けないようにする
set backspace=indent,eol,start

"インサートモードのEscをjjにキーバインド
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>

"入力モードでのカーソル移動
"ほかの標準キーストロークを適用させたかったため，コメントアウト
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

"マウススクロール・方向キーを無視
"特に使うこともないためコメントアウト（マウススクロールは無視したいため，継続）
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>

"補完メニューの高さ
set pumheight=10

"対応する括弧の強調の仕方
hi MatchParen cterm=bold ctermbg=black ctermfg=blue

"自動補完メニュー
set wildmenu
set wildmode=full

" コマンドラインの履歴の保存数
set history=200

" バッファの変更を保存せずに警告なしの移動
set hidden

" 挿入モード中はカーソルの形を変化
let &t_ti .= "\e[1 q"
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"
let &t_te .= "\e[0 q"

" 自動整形のオフ
" set tw=0
autocmd FileType text setlocal textwidth=0

" Fernの設定 ##############################################################
nnoremap <silent><C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR> 
inoremap <silent><C-n> <Esc>:Fern . -reveal=% -drawer -toggle -width=40<CR><C-w>l

" vim-airlineの設定  ##########################################################   
" タブラインの表示
let g:airline#extensions#tabline#enabled=1
" ステータスラインに表示する項目の変更
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['y', 'x', 'z']]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3p%%' " %4l:%-4L
" 変更がなければdiffの行数を表示しない
let g:airline#extensions#hunks#non_zero_only = 1

" タブラインの表示を変更
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

" vim-code-darkの設定 ##########################################################
colorscheme codedark
let g:airline_theme = 'codedark'

" フォルダアイコンの表示
let g:fern#renderer = 'nerdfont'
let g:fern_disable_startup_warnings = 1

" アイコンに色付け
augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" アクティブなファイルが含まれているディレクトリを手早く展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ファイルシステムの探索
set nocompatible
filetype plugin on

" 表示行をより簡単に移動
nmap gj gj<SID>g
nmap gk gk<SID>g
nnoremap <script> <SID>gj gj<SID>g
nnoremap <script> <SID>gk gk<SID>g
nnoremap <script> <SID>gl l<SID>g
nnoremap <script> <SID>gh h<SID>g
nmap <SID>g <Nop>

" :T でターミナルをいい感じに開く
command! -nargs=* T bo term ++rows=15 <args>

" 画面上にまれに表示される文字列への処置
let &t_TI = ""
let &t_TE = ""

" 対となる括弧への移動（％）を強化
packadd! matchit

" バッファ間の移動をより簡単に
nnoremap <silent> <C-j> :bnext<CR>
nnoremap <silent> <C-k> :bprev<CR>

" ビジュアルモード中に続けてインクリメント
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
