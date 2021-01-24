# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#add 3rd party stuff to default path
#PATH=$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python3.8/bin:~/Library/Python/3.8/bin:/
PATH=$PATH:~/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin/python3
export PATH

#load bash completion
if [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
  . $(brew --prefix)/etc/profile.d/bash_completion.sh
fi

#set hints for compiler
export ARCHFLAGS="-arch x86_64"

#set terminal stuff correct for tmux
export TERM=xterm-256color
export LC_CTYPE=en_US.UTF-8

#git
git config --global user.name "sahafeez"
git config --global user.email "sean.hafeez@gmail.com"

#shut up apple
export BASH_SILENCE_DEPRECATION_WARNING=1

#change default commands to something better
alias cat='bat'
alias ping='prettyping --nolegend'
alias top='htop'
alias ls='ls-go -alkSi'

#powerline for bash/tmux/vim
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source  /opt/homebrew/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh

#color ls
#export CLICOLOR=1
#export export LSCOLORS=ExFxBxDxCxegedabagacad

#vim bindings
set -o vi
VISUAL=vi
EDITOR=vi

source /Users/sah/.config/broot/launcher/bash/br

[ -z "$TMUX"  ] && { tmux attach || tmux new-session && exit;}

