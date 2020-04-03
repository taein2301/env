# =====================================================================================
#           Filename    : .zshrc
#           Description : ZSH shell 설정 파일
#			Last Modification Day: 2019/12/30 JKLEE
# =====================================================================================
set -o vi

PATH=/usr/local/bin:.:~/bin:/usr/local/bin:/usr/local/ssl/bin:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/usr/ccs/bin:/usr/ucb:/etc:/usr/etc:
PATH=$PATH:/usr/local/sbin:/Users/jklee/Dropbox/env/SSH:~/.jklee/env
PATH=$PATH:/Users/jklee/TOOL:/Users/jklee/Dropbox/Source/TOOL:/Users/jklee/Dropbox/TOOL
PATH=$PATH:/Applications/CMake.app/Contents/bin:/usr/local/opt/mysql-client/bin
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/DEV/flutter/bin:/usr/local/go/bin:/Users/jklee/go/bin

export ZSH="/Users/jklee/.oh-my-zsh"
export PYENV_ROOT=/Users/jklee/DEV/pyenv

HIST_STAMPS="yyyy-mm-dd"

ZSH_THEME="robbyrussell"
GOPATH=/usr/local/go/bin
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
#export LANG="ko_RK.UTF-8"
#export LC_ALL=ko_RK.UTF-8

export LC_ALL="ko_KR.UTF-8"

#=====================================
# .zshrc (use zplug)
#=====================================
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git",   from:oh-my-zsh
zplug "lib/completion",   from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug "lib/directories",  from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
#=====================================

#=====================================
# Alias Setting
#=====================================
alias cls=clear
alias h=history
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias agrep='find . -type f -name * |grep -v tags |grep -v .svn|xargs grep -n --color=auto $1'
alias cgrep='find . -type f -name "*.[ch]"|grep -v tags |grep -v .svn|xargs grep -n --color=auto $1'
alias cpgrep='find . -type f -regex ".*\.[ch]\(pp\)?$"|grep -v tags |grep -v .svn|xargs grep -n --color=auto $1'
alias pgrep='find . -type f -name "*.py"|grep -v .svn|xargs grep -n --color=auto $1'
alias diff='diff  --recursive --ignore-blank-lines --ignore-all-space --ignore-space-change'
alias valgrind='valgrind --leak-resolution=high --leak-check=yes -v'

alias zshrc='vim ~/.zshrc'
alias run='. ~/.zshrc'
alias vimrc='vim ~/.vim/vimrc'
alias findcore='find ~/ -name "core*"'
alias ff='find ./ -name '
alias mm='make clean; make'
alias ls='ls -ltGF'
alias cdblog='cd /Users/jklee/Dropbox/BLOG'
alias down='cd ~/Downloads'
alias cddown='cd ~/Downloads'
alias src='cd  ~/Source'
alias cdasrc='cd  /Users/jklee/Dropbox/ARIEL_Source'
alias cdenv='cd  ~/.jklee/env'
alias cat='ccat'
alias ali='alias | grep '
alias cdmemo='cd /Users/jklee/Dropbox/memo'
alias memo='cd /Users/jklee/Dropbox/memo'


alias cdsrc='cd /Users/jklee/Dropbox/Source'
alias getpcap='scp root@219.250.188.124:*.pcap .'

#=====================================
# Application Env Setting
#=====================================
export OCS_HOME=/Users/jklee/G-Drive/Source/ccs


alias cdccs='cd /Users/jklee/Source/ccs'
alias cdinbox='cd /Users/jklee/Dropbox/INBOX'
alias cdtil='cd /Users/jklee/Dropbox/TIL'
alias til='cd /Users/jklee/Dropbox/TIL'
alias cdpyenv='/Users/jklee/Source/python_env/pyenv/versions'

alias runlambdaenv='docker run -it --rm  --volume /Users/jklee/Source:/Source --volume /Users/jklee/Downloads:/Download --name lambda taein2301/lambda_dev_env'
alias lamdaenv='docker run -it --rm  --volume /Users/jklee/Source:/Source --volume /Users/jklee/Downloads/:/Download --name lambda lambda_dev_env'

#=====================================
# Python env Setting 2019/04/22
#=====================================
## pyenv 가 설치할 python 위치
export PYENV_ROOT=/Users/jklee/DEV/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

## direnv
#eval "$(direnv hook bash)"
eval "$(direnv hook zsh)"

## jenv : 자바 버전 설정
#eval "$(jenv init -)"

## ruby 버전 설정
#eval "$(rbenv init -)"


#=====================================
# Color man pages:
#=====================================
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[01;32m' # begin underline



