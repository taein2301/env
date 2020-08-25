"======================================================================
" MAC Vim 설정
"======================================================================
"======================================================================
"" PlugIn Setting Start
"======================================================================
call plug#begin('~/.vim/plugged_mac')
Plug 'blueyed/vim-diminactive'     		" 비활성화 창 어둡게
Plug 'scrooloose/nerdtree'              " File 네비게이터
Plug 'nathanaelkane/vim-indent-guides'  " Indent 선 화면 출력
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'vimwiki/vimwiki', { 'branch': 'dev' }  " Vimwiki
"Plug 'mhinz/vim-startify'                    " Vim 첫화면
Plug 'parkr/vim-jekyll'
Plug 'itspriddle/vim-marked'       " Mac Marked2 앱 열기
Plug 'majutsushi/tagbar'           " 소스 네비게이터
Plug 'airblade/vim-rooter'         " project root 디렉토리
Plug 'scrooloose/nerdcommenter'    " 주석
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'      " git 소스 수정 내용 화면 프린트
Plug 'tpope/vim-fugitive'          " git
Plug 'ekalinin/dockerfile.vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/a.vim'

"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
call plug#end()

"======================================================================
" Plug 'mileszs/ack.vim'
"cnoreabbrev Ack Ack!
"nnoremap <F7> :Ack
nnoremap <Leader>A :Ack!<Space><CR>

" * [ ] Plugin 'elzr/vim-json'               " For Json
" * [ ] Plugin '907th/vim-auto-save'         " 자동 저장
"
"======================================================================
" Plug 'airblade/vim-rooter'         " project root 디렉토리
" 2019-07-24
let g:rooter_patterns = ['README.md', '.git/']
" let g:rooter_silent_chdir = 1
" let g:rooter_manual_only = 1

"======================================================================
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'bubblegum'
let g:airline_section_z = "%l/%L : %c"
let g:airline#extensions#tabline#enabled = 1               " buffer 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'           " buffer 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1        " buffer number를 보여준다

"======================================================================
" Plug 'blueyed/vim-diminactive'     " 비활성화 창 어둡게
let g:diminactive_enable_focus = 1

"==============================================================
" Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
let g:indent_guides_tab_guides = 0
let g:indent_guides_indent_levels = 5
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

"======================================================================
" Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']    "Ignore in .gitignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'                                        "Ignore node_modules
let g:ctrlp_custom_ignore = {
			\ 'file': '\v\.(pyc|so|dll)$',
			\ }

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
	execute ':CtrlP' . a:ctrlp_command_end
	call feedkeys(a:search_text)
endfunction

nmap <Leader>f :call CtrlPWithSearchText(expand('<cword>'), '')<CR>

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

"======================================================================
" Plug 'majutsushi/tagbar'           " 소스 네비게이터
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
"======================================================================

"======================================================================
" Plug 'scrooloose/nerdcommenter'    " 주석
let g:NERDSpaceDelims = 1      " // int foo=2;


"======================================================================
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" pip install pynvim 먼저 해야 에러 안남
let g:pymode_python = 'python3'

let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint_bind = '<leader>b'

let g:pymode_rope_show_doc_bind = '<leader>pd'
let g:pymode_rope_goto_definition_bind = '<leader>B'
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_rename_bind = '<leader>pr'
let g:pymode_rope_module_to_package_bind = '<leader>p1p'
let g:pymode_rope_extract_method_bind = '<leader>pm'
let g:pymode_rope_extract_variable_bind = '<leader>pl'
let g:pymode_rope_use_function_bind = '<leader>pu'
let g:pymode_rope_move_bind = '<leader>pv'
let g:pymode_rope_change_signature_bind = '<leader>ps'

"======================================================================
" Plug 'parkr/vim-jekyll'
let g:jekyll_post_dirs = ['_posts', 'jklee/Dropbox/BLOG/_posts']
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
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }



"======================================================================
" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

let g:vimwiki_list = [
    \{
    \   'path': '/Users/jklee/Dropbox/memo',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
\]

let maplocalleader = "\\"

" vimwiki의 conceallevel 을 끄는 쪽이 좋다
let g:vimwiki_conceallevel = 1

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
" Plug 'itspriddle/vim-marked'       " Mac Marked2 앱 열기
let g:marked_filetypes = ["markdown", "mkd", "ghmarkdown", "vimwiki"]
nmap <LocalLeader>e :MarkedToggle<CR>

"======================================================================
" Plug 'parkr/vim-jekyll'
let g:jekyll_post_dirs = ['_posts', 'jklee/Dropbox/BLOG/_posts']
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
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"======================================================================
"" PlugIn Setting End
"======================================================================

map <silent> <Leader>P :!/Users/jklee/Dropbox/TOOL/blog_deploy.sh<CR><CR>

"======================================================================
" For MacVim ( GUI )
"======================================================================
if has("gui_macvim")
	set guifont=Monaco:h15
endif

nnoremap <Leader>q :e /Users/jklee/Dropbox/memo/Quick memo.md<CR>
"======================================================================
" End of File
"======================================================================
