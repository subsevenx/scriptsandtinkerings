REQUIRED_PACKAGES=("fortune" "cowsay" "lolcat")

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

# Dev Utilities
alias php-serve='php -S localhost:8000'
alias bridgetown-serve='bin/bridgetown start'
alias py-env='[ -d .env ] || python -m venv .venv; source .venv/bin/activate'

# Software Utilities
alias sample-song='yt-dlp -f bestaudio[ext=m4a] --embed-thumbnail --add-metadata --verbose' 
alias get-index='wget -r -np -R "index.html*"'


#-------------------------------------------------------------
# Dev Env Updaters
#-------------------------------------------------------------
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

#-------------------------------------------------------------
# Helper Functions
#-------------------------------------------------------------

# Detect package manager
detect_pkg_manager() {
    if command -v apt-get &>/dev/null; then
        echo "apt-get"
    elif command -v dnf &>/dev/null; then
        echo "dnf"
    elif command -v yum &>/dev/null; then
        echo "yum"
    elif command -v pacman &>/dev/null; then
        echo "pacman"
    elif command -v zypper &>/dev/null; then
        echo "zypper"
    else
        echo "unknown"
    fi
}

# Install package
install_pkg() {
    local pkg="$1"
    case "$PKG_MANAGER" in
        apt-get) sudo apt-get install -y "$pkg" ;;
        dnf) sudo dnf install -y "$pkg" ;;
        yum) sudo yum install -y "$pkg" ;;
        pacman) sudo pacman -S --noconfirm "$pkg" ;;
        zypper) sudo zypper install -y "$pkg" ;;
        *) echo "Install $pkg manually." ;;
    esac
}

PKG_MANAGER=$(detect_pkg_manager)

for cmd in "${REQUIRED_PACKAGES[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "$cmd not found. Installing..."
        install_pkg "$cmd"
    fi
done

gen_seed() {
    date +%s%N | cut -b10-19
}
