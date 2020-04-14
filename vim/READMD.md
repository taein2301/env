## VIM 설정

### MAC
- Step1. 환경 설정 파일 위치로 이동
cd ~/

- Step2. git 에서 땡겨오기
git clone  https://github.com/taein2301/vim .vim

- Step3. vimrc Link
ln -s ~/.vim/vimrc ~/.vimrc

- Step4. Plugin Install
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

> :PlugInstall

- Step5. For COC Install node.js
> brew install node

Last Modify : `2019-12-09`


### Windows NVIM

- Step1. 환경 설정 파일 위치로 이동
cd /c/Users/jklee/AppData/Local

- Step2. git 에서 땡겨오기
git clone https://github.com/taein2301/neovim.git nvim

- Step3. Plugin Install

### Linux VIM
