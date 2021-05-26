#-------------------------------------------------------------
# Init settings: These aren't mine. I adapted most 
# from the old Linux Mint ones and Ubuntu Budgie init .bashrc
#-------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------------------------------------------------------
# Some settings: I wrote most of the ones below
#-------------------------------------------------------------

ulimit -S -c 0      # Don't want coredumps.
set -o notify
set -o noclobber
set -o ignoreeof
alias ls='ls --color=auto'
alias ll='ls -alF'

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Lazy and Personal
alias please='sudo $(history -p !!)'
alias ll='ls -alF'
alias cs='cd'
alias xs='cd'
alias vf='cd'
alias zd='cd'
alias xs='cd'
alias vf='cd'
alias xd='cd'

# Software Shortcuts
alias be='bundle exec'
alias debug="set -o nounset; set -o xtrace"
alias r='sudo -i R'
alias exe='source ~/.bashrc'
alias serv='php -S localhost:8000'  
alias ytb='youtube-dl -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata --verbose' 
alias get='wget -r -np -R "index.html*"'

# Git Shortcuts
alias gs='git status'
alias gp='git push'
alias gpm='git pull origin master'
alias gpo='git pull origin'
alias gc='git checkout'
alias gcm='git checkout -m'
alias gg='git commit -S -m'

# System Specific Shortcuts: Server, Desktop. Uncomment as nessesary.
## alias perms="sudo curl -L -o 'perms.sh' https://raw.githubusercontent.com/subsevenx/dotfiles/master/configs/server/wp_fixperms.sh && sudo bash perms.sh"
## alias perms="sudo curl -L -o 'perms.sh' https://raw.githubusercontent.com/subsevenx/dotfiles/master/configs/server/wp_fixperms.sh && sudo bash perms.sh"
## alias hdd='sudo mount -t drvfs E: /mnt/e && cd /mnt/e/'
## alias home='cd /mnt/c/Users/$USER/' #Windows

#-------------------------------------------------------------
# Fun Stuff: Greeting, motd
# PS1 Settings
#-------------------------------------------------------------
# I suck at the {PS1} stuff so just pretend it makes sense
PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u\[$(tput bold)\]\[\033[38;5;32m\]@\[$(tput bold)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;32m\]\t\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;32m\][\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;32m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]> \[$(tput sgr0)\]"
alias say='echo "$1" | espeak -s 120 2>/dev/null' #This is just a little fun thing for me use.

date
fortune | cowsay -f tux | lolcat -a  -s 100 -F 0.5  -d 5 # Requires fortune, cowsay, and lolcat.
