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

set guifont=JetBrains\ Mono:h11

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
"" PlugIn Setting Start
"======================================================================
call plug#begin('~/vimfiles/plugged_win')
"Plug 'scrooloose/nerdtree'              		" File 네비게이터
"Plug 'vimwiki/vimwiki', { 'branch': 'dev' }		" Vimwiki
"Plug 'mhinz/vim-startify'                    	" Vim 첫화면
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'parkr/vim-jekyll'
call plug#end()
"======================================================================
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
set updatetime=100

" 저장할 때 자동으로 formatting 및 import
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "camelcase"

let g:go_autodetect_gopath = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" quickfix 이동 및 open/close
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

" 테스트 커버리지 검사 및 색깔 표시 토글
nnoremap <LocalLeader>c :GoCoverageToggle<CR>

" 자주 쓰는 기능들
autocmd FileType go nnoremap <Tab>b :GoBuild<CR>
autocmd FileType go nnoremap <Tab>r :GoRun<CR>
autocmd FileType go nnoremap <Tab><Tab>r :GoRun %<CR>

autocmd FileType go nnoremap <Tab>t :GoTest<CR>
autocmd FileType go nnoremap <Tab><Tab>t :GoTestFunc<CR>
autocmd FileType go nnoremap <Tab>c :GoCoverageToggle<CR>



"======================================================================
" Plug 'scrooloose/nerdtree'         " File 네비게이터
let NERDTreeWinPos = "left"
let NERDTreeIgnore=['\.exe$','\.WMV$','\.doc$','\.pptx$','\.ico$','\.PNG$','\.jpg$','\.pdf$','\.pyc$','\.pyo$', '\~$']
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks=1
let NERDTreeAutoDeleteBuffer = 1

" NerdTree 창 만 남았을때 vim 닫기
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree in the directory of the current file (or /home if no file is open)
function! NERDTreeToggleInCurDir()
	" If NERDTree is open in the current buffer
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
		exe ":NERDTreeClose"
	else
		if (expand("%:t") != '')
			exe ":NERDTreeFind"
		else
			exe ":NERDTreeToggle"
		endif
	endif
endfunction

" vim 만 입력 했을때 자동으로 NerdTree 뜨게 하기
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"======================================================================
" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

let g:vimwiki_list = [
    \{
    \   'path': 'C:\Dropbox\memo',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
\]


" vimwiki의 conceallevel 을 끄는 쪽이 좋다
let g:vimwiki_conceallevel = 0

" wiki 경로 아닌 마크다운 파일에 vimwiki 기능 영향 안받도록 설정
let g:vimwiki_global_ext = 0


" 자주 사용하는 vimwiki 명령어에 단축키를 취향대로 매핑해둔다
command! WikiIndex :VimwikiIndex
nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>

" F4 키를 누르면 커서가 놓인 단어를 위키에서 검색한다.
nnoremap <F4> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

" Shift F4 키를 누르면 현재 문서를 링크한 모든 문서를 검색한다
nnoremap <S-F4> :execute "VWB" <Bar> :lopen<CR>

"======================================================================
" Plug 'parkr/vim-jekyll'
let g:jekyll_post_dirs = ['_posts', 'C:\Dropbox\BLOG\_posts']
let g:jekyll_post_extension = '.md'
let g:jekyll_post_template =  [
			\ '---',
			\ 'layout: post',
			\ 'title: ',
			\ 'date: "JEKYLL_DATE"',
			\ '---',
			\ '']
let g:jekyll_site_dir = '_site'

"======================================================================
" PlugIn Setting END
"======================================================================

"======================================================================
" End of File
"======================================================================
