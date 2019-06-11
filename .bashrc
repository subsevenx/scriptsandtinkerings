#-------------------------------------------------------------
# Init settings
#-------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

use_color=false

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#-------------------------------------------------------------
# Some settings
#-------------------------------------------------------------

ulimit -S -c 0      # Don't want coredumps.
set -o notify
set -o noclobber
set -o ignoreeof
alias ls='ls --color=auto'

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Lazy and Personal
alias please='sudo $(history -p !!)'
alias ll='ls -alF'
alias cs='cd'
alias xs='cd'
alias vf='cd'
alias hdd='sudo mount -t drvfs E: /mnt/e && cd /mnt/e/

# Software Shortcuts
alias be='bundle exec'
alias debug="set -o nounset; set -o xtrace"
alias r='sudo -i R'
alias exe='exec $SHELL' # Restart the shell
alias serv='php -S localhost:8000'  
alias dl='youtube-dl --extract-audio --audio-format mp3' 
alias get='wget -r -np -R "index.html*"'


# Git Shortcuts
alias gs='git status'
alias gp='git push'
alias gpm='git pull origin master'
alias gpo='git pull origin'
alias gc='git checkout'
alias gcm='git checkout -m'
alias gg='git commit -S -m'

#-------------------------------------------------------------
# Fun Stuff: Greeting, motd
# PS1 Settings
#-------------------------------------------------------------

# I suck at the {PS1} stuff so just pretend it makes sense
PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u\[$(tput bold)\]\[\033[38;5;32m\]@\[$(tput bold)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;32m\]\t\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;32m\][\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;32m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]> \[$(tput sgr0)\]"

