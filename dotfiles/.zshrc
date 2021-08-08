##################################################################
# Author: AISK11

# Packages installed:
# sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting

# Change default shell:
# user$ chsh -s /bin/zsh
# root# usermod -s /bin/zsh <USER>
##################################################################

# Security clear:
clear

autoload -U colors && colors
# command prompt (https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion):
# Foreground: %F{XXX} ; bacKground: %K{XXX} (https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal/821163):
#export PS1="%n@%m %~ %# "
export PS1="%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[red]%}%m %{$fg[yellow]%}%~ %{$fg[red]%}%# %{$reset_color%}"

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
export HISTFILE="${HOME}/.zsh_history"
export SAVEHIST=${HISTSIZE}

# PATH variable:
export PATH=${PATH}:/sbin:/usr/sbin

# Fix error with rofi ("Failed to set locale"):
export LC_ALL="C"

# Aliases:
alias ls='ls --color=always'
alias ip='ip -c'
alias grep='grep --color'

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
