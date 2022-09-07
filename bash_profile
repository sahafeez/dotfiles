# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#add correct homebrew path based on CPU type and export/start the right stuff
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
 export BREWPATH=/opt/homebrew
 export ARCHFLAGS="-arch arm64"
else
 export BREWPATH=/usr/local
 export ARCHFLAGS="-arch x86_64"
fi

#add homebrew to path
export PATH=$BREWPATH/bin:$BREWPATH/sbin:$PATH

#set old school editor hints
export EDITOR=$BREWPATH/bin/vim
export VISUAL=$BREWPATH/bin/vim

#setup path powerline for bash and tmux 
export PLBASH=$BREWPATH/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh
export PLTMUX=$BREWPATH/lib/python3.9/site-packages/powerline/bindings/tmux/powerline.conf

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

#bash history clean up & append
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
shopt -s histappend

#colour in grep
export GREP_OPTIONS='--colour'

#set terminal stuff correct for tmux
export TERM=xterm-256color

#export TERM=tmux-256color
export LC_CTYPE=en_US.UTF-8

#shut up apple, i am not switching to zsh
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
source $PLBASH

#old ls tweaks for systems without ls-go
#export CLICOLOR=1
#export export LSCOLORS=ExFxBxDxCxegedabagacad

#fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

#vim bindings
#set -o vi
set editting-mode vi
set keymap vi-command

#config for broot tool
source /Users/sah/.config/broot/launcher/bash/br

# check if there is a tmux session, connect if there is otherwise start new one
[ -z "$TMUX"  ] && {  tmux new-session && exit;}

