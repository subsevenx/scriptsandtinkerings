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
alias debug="set -o nounset; set -o xtrace"
alias exe='source ~/.bashrc'
alias phpserve='php -S localhost:8000'
alias ytb='yt-dlp -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata --verbose' 
alias getindex='wget -r -np -R "index.html*"'
alias rubylatest='rbenv install $(rbenv install -l | grep -v - | tail -1)'
alias pythonlatest='pyenv install $(pyenv install -l | grep -v - | tail -1)'
# Git Shortcuts
alias gs='git status'
alias gp='git push'
alias gpm='git pull origin master'
alias gpo='git pull origin'
alias gc='git checkout'
alias gcm='git checkout -m'
alias gg='git commit -S -m'

alias hidden='ls -d .[!.]*'

# System Specific Shortcuts: Server, Desktop. Uncomment as nessesary.
## alias perms="sudo curl -L -o 'perms.sh' https://raw.githubusercontent.com/subsevenx/scriptsandtinkerings/master/configs/server/wp_fixperms.sh && sudo bash perms.sh"
## alias wpinstall="sudo curl -L -o 'wp.sh' https://raw.githubusercontent.com/subsevenx/scriptsandtinkerings/master/configs/server/wp_install.sh && sudo bash wp.sh"
## alias hdd='sudo mount -t drvfs E: /mnt/e && cd /mnt/e/'
## alias home='cd /mnt/c/Users/$USER/' #Windows
