"--------------------
" 基本的な設定
"--------------------
"新しい行のインデントを現在行と同じにする
set autoindent
 
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup
 
"クリップボードをWindowsと連携する
set clipboard=unnamed
 
"vi互換をオフする
set nocompatible
 
"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup
 
"タブの代わりに空白文字を指定する
set expandtab
 
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
 
"インクリメンタルサーチを行う
set incsearch
 
"行番号を表示する
set number
 
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
 
"新しい行を作った時に高度な自動インデントを行う
"set smarttab
"新しい行を作った時に高度な自動インデントを行う
"set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap


" 全角スペース・行末のスペース・タブの可視化
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/
set list
set listchars=tab:>-,trail:-,nbsp:%

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
 
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" NeoComplcache有効化
let g:neocomplcache_enable_at_startup = 1

" ---------
" NERDTree
" ---------
let NERDTreeShowHidden = 1 
let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
	    autocmd VimEnter * execute 'NERDTree ./'
endif
" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
"b:nerdstatus = 1 : NERDTree 表示中
"b:nerdstatus = 2 : NERDTree 非表示中

if !exists('g:nerdstatus')
execute 'NERDTree ./'
let g:windowWidth = winwidth(winnr())
let g:nerdtreebuf = bufnr('')
let g:nerdstatus = 1

elseif g:nerdstatus == 1
execute 'wincmd t'
execute 'vertical resize' 0
execute 'wincmd p'
let g:nerdstatus = 2
elseif g:nerdstatus == 2
execute 'wincmd t'
execute 'vertical resize' g:windowWidth
let g:nerdstatus = 1

endif
endfunction
noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>

" --------
" SrcExpl
" --------
let g:SrcExpl_RefreshTime = 1
let g:SrcExpl_WinHeight = 9
let g:SrcExpl_GoBackMapKey = "<C-b>"
nmap <F8> :SrcExplToggle<CR>

" --------
" VUNDLE
" --------
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'gtags.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'Source-Explorer-srcexpl.vim'

" -------
" Color Scheme
" -------
colorscheme desert
set guifont=Ricty:h16

