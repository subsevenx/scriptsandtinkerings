# Set the prompt
autoload -Uz vcs_info
add-zsh-hook precmd vcs_info

precmd() {
  print -rP "%F{green}%B[%~]%b%f"
}

export PROMPT='%F{magenta}%* %D{%a %b %d}%f %B>%b '

#### PATH EXPORTS ####

export PATH="$HOME/local/bin:$PATH"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH=/opt/homebrew/bin:$PATH

# Load aliases
source ~/.zsh_aliases
