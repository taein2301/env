"======================================================================
" WINDOWS 설정
"======================================================================
colorscheme janah

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set gfn=JetBrains\ Mono:h13

" 마우스 우클릭 붙여넣기
set mousemodel=extend
map <RightMouse> <MiddleMouse>

imap <C-S> <ESC>:w<CR>
map <C-S> :w<CR>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
map <A-w> :q!<CR>


set grepprg=grep\ -snH

cd \%USERPROFILE\%\\Downloads
nnoremap <Leader>x :e \%USERPROFILE\%\\Dropbox\\ENV\\vim\\vimrc<CR><CR>

" 한글 깨지는것을 utf-8 로 다시 인코딩해서 읽기
" map <Leader>e :e ++enc=utf-8 <CR>
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.ex
set fileencodings=utf-8

if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>		"+gP
    cmap <C-V>		<C-R>+
endif

" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<Esc>:update<CR>gi

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>


"======================================================================
" End of File
"======================================================================
