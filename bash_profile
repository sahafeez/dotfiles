# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#add correct homebrew path based on CPU type
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
   export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
   export EDITOR=/opt/homebrew/bin/vim
   export VISUAL=/opt/homebrew/bin/vim
   export PLBASH=/opt/homebrew/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh
   export PLTMUX=/opt/homebrew/lib/python3.9/site-packages/powerline/bindings/tmux/powerline.conf
 else 
   export PATH=/usr/local/bin:/usr/local/sbin:$PATH   
   export EDITOR=/usr/local/bin/vim
   export VISUAL=/usr/local/bin/vim
   export PLBASH=/usr/local/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh
   export PLTMUX=/usr/local/lib/python3.9/site-packages/powerline/bindings/tmux/powerline.conf
fi

#add my scripts to default path
export PATH=~/bin:$PATH

#clean up dups in path cause by nested shells/tmux
export PATH=$(printf %s "$PATH"| awk -vRS=: -vORS= '!a[$0]++ {if (NR>1) printf(":"); printf("%s", $0) }' );

#load bash completion
if [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
  . $(brew --prefix)/etc/profile.d/bash_completion.sh
fi
#sort for window size changes
shopt -s checkwinsize

#bash history clean up
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

#colour in grep
export GREP_OPTIONS='--colour'

#set hints for compiler
if [[ "$CPU" == "arm" ]]; then
   export ARCHFLAGS="-arch arm64"
 else
   export ARCHFLAGS="-arch x86_64"
fi

#set terminal stuff correct for tmux
#export TERM=xterm-256color
export TERM=tmux-256color
export LC_CTYPE=en_US.UTF-8

#shut up apple
export BASH_SILENCE_DEPRECATION_WARNING=1

#source aliases in .bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
#source bash_functions
if [ -e ~/.bash_functions ]; then
    source ~/.bash_functions
fi

#powerline for bash/tmux/vim
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#source  /opt/homebrew/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh
source $PLBASH

#old ls tweaks for systems without ls-go
#export CLICOLOR=1
#export export LSCOLORS=ExFxBxDxCxegedabagacad

#vim bindings
set -o vi

#config for broot tool
source /Users/sah/.config/broot/launcher/bash/br

# check if there is a tmux session, connect if there is otherwise start new one
[ -z "$TMUX"  ] && {  tmux new-session && exit;}
