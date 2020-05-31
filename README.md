# JKLEE 환경 설정

- Mac / Linux / Windows 의 bash / zsh / vim 설정
- Linux 는 기존 사용자는 영향이 없어야 한다.

----------------------------------------------------------------------------------------------------
## MAC

## Linux
.jklee 로 디렉토리 만들고 git으로 설정 파일 받아서 iterm 에서 로그인시 트리거 걸어놓고 사용.

## Windows


##

setting $JKLEE_HOME

ln -s $JKLEE_HOME/env/vim/colors ~/.vim/colors

```
mkdir -p ~/.jklee
cd ~/.jklee
git clone https://github.com/taein2301/env.git ./
```

## shell
cd /Users/jklee/Dropbox/ENV

### oh-my-zsh 설치
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
> 터미널 제접속

rm -rf ~/.zshrc
ln -s /Users/jklee/Dropbox/ENV/zshrc ~/.zshrc
ln -s /Users/jklee/Dropbox/ENV/vim/vimrc ~/.vimrc
ln -s /Users/jklee/Dropbox/ENV/vim/ ~/.vim

# vim
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
> :PlugInstall

# Windows MSYS2 bash Setting
Windows 설정은 DropBox 가 연동 되어 있기 때문에 git clone 말고 DropBox 파일을 link 해서 사용한다.

## soft link 생성 되도록 설정
export MSYS=winsymlinks:nativestrict

## link 설정
cd /c/Users/jklee/Dropbox/ENV
ln -s /c/Users/jklee/Dropbox/ENV/Bash/bashrc_comm  ~/.bashrc
ln -s /c/Users/jklee/Dropbox/ENV/vim/vimrc ~/.vimrc
ln -s /c/Users/jklee/Dropbox/ENV/vim ~/.vim

# Windows Gvim 설정
ln -s /c/Users/jklee/Dropbox/ENV/vim ~/vimfiles
ln -s /c/Users/jklee/Dropbox/ENV/vim/vimrc ~/_vimrc


# DBever
DBeaver 설정 파일

Last Modify : `2020-05-14`


