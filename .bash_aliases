#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Lazy and Personal
alias please='sudo $(history -p !!)'
alias ll='ls -AhlF --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'
alias cs='cd'
alias xs='cd'
alias vf='cd'
alias zd='cd'
alias xs='cd'
alias vf='cd'
alias xd='cd'

# CMD Utilities
alias breload='source ~/.bashrc'
alias exe='exec "$SHELL" -l'
alias hidden='ls -d .[!.]*'

# Run Servers
alias php-serve='php -S localhost:8000'
alias bridgetown-serve='bin/bridgetown start'

# Software Utilities
alias sample-song='yt-dlp -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata --verbose' 
alias get-index='wget -r -np -R "index.html*"'

# Updater Utilities
rubylatest() {
	latest=$(rbenv install -l | awk '/^[0-9]/{v=$1} END{print v}')
	echo "You are using Ruby $(ruby -v)"
	echo "Latest Ruby version: $latest"
	read -p "Install Ruby $latest? [y/N] " confirm
	
	if [[ $confirm == [yY] ]]; then
	rbenv install -s "$latest"
	rbenv global "$latest"
  fi
}

alias ruby-latest='rubylatest'

pythonlatest() {
	latest=$(pyenv install -l | sed 's/^[[:space:]]*//' | grep -E '^[0-9]+(\.[0-9]+){1,2}$' | tail -1)
	echo "You are using: $(python --version 2>&1)"
	echo "Latest : $latest"
	
	read -r -p "Install Python $latest? [y/N] " confirm
	[[ $confirm =~ ^[Yy]$ ]] || return
	pyenv install -s "$latest"
	pyenv global "$latest"
	python --version
}

alias python-latest='pythonlatest'

nodelatest() {
	current=$(node -v 2>/dev/null)
    latest=$(nvm ls-remote | awk '{print $1}' | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | tail -1)
    lts=$(nvm ls-remote --lts | awk '{v=$1} END{print v}')

    echo "You are using Node $current"
    echo "Latest Node version     : $latest"
    echo "Latest Node LTS version : $lts"

    read -r -p "Which release do you want to install and use? [latest/lts] " choice

    if [ "$choice" = "latest" ]; then
        target=$latest
        label="Node"
    elif [ "$choice" = "lts" ]; then
        target=$lts
        label="Node LTS"
    else
        echo "Invalid choice. Please enter 'latest' or 'lts'."
        return 1
    fi

    read -r -p "Install and use $label $target? [y/N] " confirm

    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        nvm install "$target"
        nvm use "$target"
        echo "Now using Node $(node -v 2>/dev/null)"
    else
        echo "Aborted."
    fi
}

alias node-latest='nodelatest'

# System Specific Shortcuts: Server, Desktop. Uncomment as nessesary.
## alias perms="sudo curl -L -o 'perms.sh' https://raw.githubusercontent.com/subsevenx/scriptsandtinkerings/master/configs/server/wp_fixperms.sh && sudo bash perms.sh"
## alias wpinstall="sudo curl -L -o 'wp.sh' https://raw.githubusercontent.com/subsevenx/scriptsandtinkerings/master/configs/server/wp_install.sh && sudo bash wp.sh"
