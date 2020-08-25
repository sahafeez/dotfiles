# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#load bash completion
if [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
  . $(brew --prefix)/etc/profile.d/bash_completion.sh
fi

#set hints for compiler
export ARCHFLAGS="-arch x86_64"

#set terminal stuff correct for tmux
export TERM=xterm-256color
export LC_CTYPE=en_US.UTF-8

#shut up apple
export BASH_SILENCE_DEPRECATION_WARNING=1

#apstra shortcuts
alias scliu='docker pull docker-registry.dc1.apstra.com:5000/slicercli:latest'
alias scli='docker run -i -t -v $HOME:/root  -v $PWD:/project docker-registry.dc1.apstra.com:5000/slicercli /usr/local/bin/slicercli -i'
alias aoscli='docker run --rm -ti -v $HOME:/root -v $PWD:/project docker-registry.dc1.apstra.com:5000/aoscli:latest aoscli'
alias vi='/usr/local/bin/vim'

#change default commands to something better
alias cat='bat'
alias ping='prettyping --nolegend'
alias top='htop'
alias ls='ls-go -alkSi'
source ~/Library/Preferences/org.dystroy.broot/launcher/bash/br

#add 3rd party stuff to default path
PATH=$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python3.8/bin
export PATH

#powerline for bash/tmux/vim
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh

#color ls
#export CLICOLOR=1
#export export LSCOLORS=ExFxBxDxCxegedabagacad

#vim bindings
set -o vi
VISUAL=vi
EDITOR=vi

[ -z "$TMUX"  ] && { tmux attach || tmux new-session && exit;}
