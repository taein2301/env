"======================================================================
" MAC Vim 설정
"======================================================================
"
"======================================================================
"" PlugIn Setting Start
"======================================================================
call plug#begin('~/.vim/plugged_mac')
Plug 'scrooloose/nerdcommenter'         " 주석
Plug 'blueyed/vim-diminactive'     		" 비활성화 창 어둡게
Plug 'scrooloose/nerdtree'              " File 네비게이터
Plug 'majutsushi/tagbar'           		" 소스 네비게이터
Plug 'airblade/vim-gitgutter'      		" git 소스 수정 내용 화면 프린트
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'parkr/vim-jekyll'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-rooter'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
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
let g:rooter_silent_chdir = 1
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
let NERDTreeIgnore=['\.DS_Store','\.exe$','\.WMV$','\.doc$','\.pptx$','\.ico$','\.PNG$','\.jpg$','\.pdf$','\.pyc$','\.pyo$', '\~$']
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
" Plug 'itspriddle/vim-marked'       " Mac Marked2 앱 열기
let g:marked_filetypes = ["markdown", "mkd", "ghmarkdown", "vimwiki"]
nmap <LocalLeader>e :MarkedToggle<CR>

"======================================================================
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction


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

"======================================================================
" End of File
"======================================================================
