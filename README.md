# Windows git bash Setting
bash 를 관리자 모드로 실행
## git bash 에서 link 생성 되도록 설정
export MSYS=winsymlinks:nativestrict
cd /c/Users/jklee/Dropbox/ENV
ln -s /c/Users/jklee/Dropbox/ENV/bash_profile_win_git_bash  ~/.bash_profile
ln -s /c/Users/jklee/Dropbox/ENV/vim/vimrc ~/.vimrc
ln -s /c/Users/jklee/Dropbox/ENV/vim/vimrc ~/_vimrc
ln -s /c/Users/jklee/Dropbox/ENV/vim ~/.vim
ln -s /c/Users/jklee/Dropbox/ENV/vim ~/vimfiles

# MAC Setting
cd /Users/jklee/Dropbox/ENV
rm -rf ~/.zshrc
ln -s /Users/jklee/Dropbox/ENV/zshrc ~/.zshrc
ln -s /Users/jklee/Dropbox/ENV/vim/vimrc ~/.vimrc
ln -s /Users/jklee/Dropbox/ENV/vim/ ~/.vim
