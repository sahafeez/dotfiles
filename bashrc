# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

#alias ls='ls -p --color=auto'
#alias ll='ls -pla --color=auto'
PS1="\[\033[1;30m\][\[\033[1;34m\]\u\[\033[1;30m\]@\[\033[0;35m\]\h\[\033[1;30m\]]\[\033[0;34m\] \W\[\033[1;30m\]\$\[\033[0m\]"
PATH=$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
VISUAL=vi
EDIOTR=vi
set -o vi

if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new; exit
fi
