# Set the prompt
autoload -U colors && colors
export PS1="%{$fg_bold[cyan]%}%n%{$reset_color%}@%{$fg_bold[white]%}%{$reset_color}%{$fg_bold[magenta]%}%m %{$reset_color%}%* : %D{%a %b %d}
%{$reset_color%}[%{$fg_bold[green]%}%~%{$reset_color%}] > %{$reset_color%}"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  


#### PATH EXPORTS ####

# Set PATH environment variable
export PATH="$HOME/local/bin:$PATH"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Load Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

## Required only when running locally.
export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"

## Load aliases
source ~/.zsh_aliases
