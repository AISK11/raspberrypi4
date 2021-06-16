##################################################################
# Author: AISK11

# Packages installed:
# sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting
##################################################################

# Security clear:
clear

# command prompt:
export PS1="%B%F{#d00000}%n%f%F{#faa307}@%f%F{#d00000}%m%f %F{#faa307}%~%f %F{#d00000}>%f%b %F{#ffffff}"

# Autocompletion:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Key compatibility
bindkey -v
export KEYTIMEOUT=1

# History settings:
export HISTSIZE=2000
export HISTFILE="${HOME}/.history"
export SAVEHIST=${HISTSIZE}

# Aliases:
alias ls='ls --color=always'
alias ip='ip -c'

# start X:
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; 
then 
    source /etc/profile
    startx
fi

# Syntax highlighting:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
