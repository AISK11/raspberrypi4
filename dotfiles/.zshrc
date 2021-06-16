##################################################################
# Author: AISK11

# Packages installed:
# sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting

# Packages installed for X:
# sudo apt --no-install-recommends install xserver-xorgxserver-xorg-video-fbdev xinit x11-xserver-utils

# Change default shell:
# user$ chsh -s /bin/zsh
# root# usermod -s /bin/zsh <USER>
##################################################################

# Security clear:
clear

# command prompt (https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion):
export PS1="%B%F{#d00000}%n%f%F{#faa307}@%f%F{#d00000}%m%f %F{#faa307}%~%f %F{#d00000}>%f%b %F{#ffffff}"
# export PS1=$'\n'"20%D %* %y"$'\n'"%n@%M %~ > "
# export PS1=$'\n'"20%D %* %y"$'\n'"%n@%M %~ > "

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

# enable auto-suggestions based on the history:
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color:
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# Syntax highlighting:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
