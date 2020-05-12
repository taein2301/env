"======================================================================
" 단축키 설정 Part1 : F1 ~ F12 : 정리중
"======================================================================
inoremap <silent> <F2>  ![img](/Users/jklee/Dropbox/memo/img/ )
inoremap <silent> <F3>  ![img](/assets/images/ )

"======================================================================
" 단축키 설정 Part2 : Map 을 이용한 단축키
"======================================================================
function! TogglePaste()
	let &paste = 1 - &paste
endf

function! ToggleNu()
	let &nu = 1 - &nu
endf

function! TogglePaste()
	let &paste = 1 - &paste
endf

if exists('g:loaded_checkbox')
	" finish
endif

function! ToggleCB()
	let line = getline('.')

	if(match(line, "\\[ \\]") != -1)
		let line = substitute(line, "\\[ \\]", "[X]", "")
	elseif(match(line, "\\[X\\]") != -1)
		let line = substitute(line, "\\[X\\]", "[ ]", "")
	else
		let line = substitute(line, "", "* [ ] ", "")
	endif

	call setline('.', line)
endf


"======================================================================
" vim terminal 으로 명령어 보내면서 terminal 실행
function! Termrun(prefix)
	" find first buffer that is from :term
	highlight Terminal ctermbg=None ctermfg=None guibg=#262626 guifg=#dadada
	let l:bufnum = bufnr("!/bin/zsh")
	" let l:bufnum = bufnr("!/bin/bash")
	"let l:cmd = a:prefix . expand("%:p") . "\<CR>"
	let l:cmd = a:prefix ."\<CR>"
	"   if l:bufnum < 0
	"let l:bufnum = term_start("/bin/bash", {"term_finish": "close","term_rows":20 })
	let l:bufnum = term_start("/bin/zsh", {"term_finish": "close","term_rows":20 })
	"   endif
	call term_sendkeys(l:bufnum,l:cmd)
endfunction

map <Leader>` :call Termrun("source ~/.zshrc")<CR>

"======================================================================
" 오늘 날짜로 DailyMemo 폴더에 파일 저장
function! WriteDailyFileName()
	let g:ddir='/Users/jklee/Dropbox/DailyMemo/'
	let fname = strftime("%Y-%m-%d")."."."md"
	let path_and_file = g:ddir . fname
	silent exe ":e " . path_and_file
	echo path_and_file
endfun

function! WriteDailyFileNameTab()
if has("win32")
	let g:ddir='C:\Users\jklee\GoogleD/TIL/'
else
	"let g:ddir='/Users/jklee/G-Drive/TIL/'
	let g:ddir='/Users/jklee/Dropbox/TIL/'
endif
	let fname = strftime("%Y-%m-%d")."."."md"
	let path_and_file = g:ddir . fname
	silent exe ":tabnew " . path_and_file
	echo path_and_file
endfun

let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint_bind = '<leader>b'

" let g:pymode_rope_goto_definition_bind = '<leader>x'
" let g:pymode_rope_move_bind = '<leader>X'
" let g:pymode_rope_show_doc_bind = '<leader>pd'
" let g:pymode_rope_rename_bind = '<leader>pr'
" let g:pymode_rope_module_to_package_bind = '<leader>p1p'
" let g:pymode_rope_extract_method_bind = '<leader>pm'
" let g:pymode_rope_extract_variable_bind = '<leader>pl'
" let g:pymode_rope_use_function_bind = '<leader>pu'
" let g:pymode_rope_change_signature_bind = '<leader>ps'

" inoremap <Leader>w<Leader>w <ESC>:e WriteDailyFileName()<CR><CR>
" nnoremap <Leader>w<Leader>w :call WriteDailyFileName()<CR><CR>
" inoremap <Leader>w<Leader>t <ESC>:e WriteDailyFileNameTab()<CR><CR>
" nnoremap <Leader>w<Leader>t :call WriteDailyFileNameTab()<CR><CR>

nnoremap <Leader>S :call WriteDailyFileNameTab()<CR><CR>

" inoremap <Leader>ww <ESC>:e /Users/jklee/Dropbox/memo/index.md<CR><CR>
" nnoremap <Leader>ww :e /Users/jklee/Dropbox/memo/index.md<CR><CR>
" inoremap <Leader>wt <ESC>:tabfind /Users/jklee/Dropbox/memo/index.md<CR><CR>
" nnoremap <Leader>wt :tabfind /Users/jklee/Dropbox/memo/index.md<CR><CR>
"======================================================================

map <silent> <leader>g :call ToggleCB()<cr>
map <Leader>n :call ToggleNu()<CR>
map <Leader>pt :call TogglePaste()<CR>
map <silent> <Leader>P :!/Users/jklee/Dropbox/TOOL/blog_deploy.sh<CR><CR>
"JEKYLL_TITLE""JEKYLL_TITLE"
" 날짜관련
inoremap <Leader>a # <ESC>"=strftime("%Y-%m-%d")<CR>PA<CR>
nnoremap <Leader>a A# <ESC>"=strftime("%Y-%m-%d")<CR>PA<CR>
inoremap <Leader>s ## <ESC>"=strftime("%H:%M")<CR>PA<CR>
nnoremap <Leader>s A## <ESC>"=strftime("%H:%M")<CR>PA<CR>
nnoremap <Leader>d A~ <ESC>"=strftime("%H:%M")<CR>PA
inoremap <Leader>d ~ <ESC>"=strftime("%H:%M")<CR>PA

"======================================================================
" BOOKMARK Setting
"======================================================================
map <Leader>1 :NERDTree<CR> :OpenBookmark Download<CR><CR>
map <Leader>2 :NERDTree<CR> :OpenBookmark BLOG<CR><CR>
map <Leader>3 :NERDTree<CR> :OpenBookmark stock_py<CR><CR>
map <Leader>4 :NERDTree<CR> :OpenBookmark JK_Project<CR><CR>

"======================================================================
" Buffer File
"======================================================================
map <Leader>! :buffer 1<CR>
map <Leader>@ :buffer 2<CR>
map <Leader># :buffer 3<CR>
map <Leader>$ :buffer 4<CR>
map <Leader>% :buffer 5<CR>

if v:version > 800
map <Leader>t :!rm -rf tags \| ctags -a *.c \|ctags -a *.cpp \| ctags -a *.sc \| ctags -a *.pc \| ctags -a *.hpp
endif
map <Leader>b :make clean ; make <CR>:copen<CR><CR>
map <Leader>r :! ./run.sh<CR>

" 영역이 지정된 상태에서 Tab 과 Shift-Tab 으로 들여쓰기/내어쓰기
vmap <Tab> >gv
vmap <S-Tab> <gv

cmap AL<CR> e %<.sc<CR>
cmap OR<CR> e %<.pc<CR>
autocmd BufRead,BufNewFile *.sc cmap A<CR> e %<.hpp<CR>
autocmd BufRead,BufNewFile *.pc cmap A<CR> e %<.hpp<CR>

" select All
nnoremap <C-A> ggVG
inoremap <C-A> <esc>ggVG
vnoremap <C-A> <esc>ggVG

" Tab navigation
nnoremap <C-N>   :tabnew<CR>
nnoremap <C-j>   :tabNext<CR>
nnoremap <C-k>   :tabnext<CR>
nnoremap <C-l>   :tabclose<CR>

inoremap <C-N>   <ESC>:tabnew<CR>
inoremap <C-j>   <ESC>:tabNext<CR>
inoremap <C-k>   <ESC>:tabnext<CR>
inoremap <C-l>   <ESC>:tabclose<CR>

"======================================================================
" Plugin 관련 단축키
"======================================================================
nnoremap <silent> <Leader>e :call NERDTreeToggleInCurDir()<cr>
nnoremap <silent> <F5> :TagbarToggle<CR>
nnoremap <silent> <Leader>w :Jpost! <c-r>=strftime("%Y/%m/%d %H:%M")<CR><CR>

"======================================================================
" 단축키 설정 Part3 : 축약
"======================================================================
iab test.   // JKLEE_TEST <c-r>=strftime("%Y/%m/%d %H:%M")<CR> :
iab jklee.  // <c-r>=strftime("%Y/%m/%d" )<CR> JKLEE :
iab todo.   // JKLEE_TODO <c-r>=strftime("%Y/%m/%d %H:%M")<CR> :
iab debug.  /* JKLEE_DEBUG <c-r>=strftime("%Y/%m/%d %H:%M")<CR> */  <CR>
iab jend.   /* JKLEE_END */
iab pppp    fprintf(stderr,"JKLEE_DEBUG FILE[%s] FUNC[%s] LINE[%d] \n",__FILE__,__func__,__LINE__);
iab ppp     fprintf(stderr,"
iab re.     RESULT :
iab tag.    Tag :
iab mail.   taein2301@gmail.com

iab del.    #if 0 // JKLEE_DELETE <c-r>=strftime("%Y/%m/%d %H:%M")<CR>
iab end.    #endif

iab img.   ![img](/Users/jklee/Dropbox/wiki/img/

iab jklog. g_pclsFileLog->Write(LOG_CRITICAL, "JKLEE_LOG [%s][%s]",__FILE__,__LINE__);
" iab logc.  g_pclsFileLog->Write(LOG_CRITICAL, "
" iab logd.  g_pclsFileLog->Write(LOG_INFO, "

iab logd.  g_cLog->LogMsg(AZI_INFO, "[%s][%s][%d] ",__FILE__,__func__,__LINE__);
iab logc.  g_cLog->LogMsg(AZI_ERR, "[%s][%s][%d] ",__FILE__,__func__,__LINE__);
iab --.    ----------------------------------------------------------------------------------------------------

