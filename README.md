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

## nvim
- Step1. 환경 설정 파일 위치로 이동
cd /c/Users/jklee/AppData/Local

- Step2. git 에서 땡겨오기
git clone https://github.com/taein2301/neovim.git nvim

- Step3. Plugin Install

# MAC Setting
## shell
cd /Users/jklee/Dropbox/ENV

### oh-my-zsh 설치
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
> 터미널 제접속
rm -rf ~/.zshrc
ln -s /Users/jklee/Dropbox/ENV/zshrc ~/.zshrc
ln -s /Users/jklee/Dropbox/ENV/vim/vimrc ~/.vimrc
ln -s /Users/jklee/Dropbox/ENV/vim/ ~/.vim

## vim
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
> :PlugInstall


Last Modify : `2019-12-09`
