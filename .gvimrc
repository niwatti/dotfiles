"----------
" 基本的な設定
"----------
set showtabline=2
set transparency=10
set imdisable
set guioptions-=T
set antialias
set number
set nobackup
set visualbell t_vb=
set wrapscan
set lines=48
set nowrap
set noexpandtab

"----------
" カラースキーム
"----------
colorscheme desert

set guifont=Ricty:h16

"----------
" その他設定
"----------
" 全角スペースの視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
set list
set listchars=tab:>-,trail:-,nbsp:%

" ESCでIMEを確実にOFF
inoremap <ESC> <ESC>:set iminsert=0<CR> 

" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

" 挿入モード終了時に IME 状態を保存しない
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>

" タブ切り替え
nmap <Tab> gt
nmap <S-Tab> gT

" 隠しファイルを表示する
let NERDTreeShowHidden = 1
" 引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif
