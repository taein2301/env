"==============================================================
" vim_plugin_win.vim					          by JKLEE
"                                                 2020-05-12 
"==============================================================

if has("win32")
	call plug#begin('~/vimfiles/plugged')
elseif has("nvim")
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif
Plug 'scrooloose/nerdtree'              " File 네비게이터
call plug#end()
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
