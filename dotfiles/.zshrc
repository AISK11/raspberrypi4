##################################################################
# Author: AISK11

# Packages installed:
# sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting

# Packages installed for X:
# sudo apt --no-install-recommends install xserver-xorg xserver-xorg-video-fbdev xinit x11-xserver-utils

# Change default shell:
# user$ chsh -s /bin/zsh
# root# usermod -s /bin/zsh <USER>
##################################################################

# Security clear:
clear

autoload -U colors && colors
# command prompt (https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion):
#export PS1="%B%F{#d00000}%n%f%F{#faa307}@%f%F{#d00000}%m%f %F{#faa307}%~%f %F{#d00000}>%f%b %F{#ffffff}"
export PS1=$'\n'"20%D %* %y"$'\n'"%n@%M %~ > "
# Foreground: %F{XXX} ; bacKground: %K{XXX} (https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal/821163):
#export PS1=$'\n'"%F{9}20%D %* %F{11}%y"$'\n'"%F{9}%n%F{11}@%F{9}%M %F{10}%~ %F{9}> %{$reset_color%}"

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
    #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# Syntax highlighting:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
