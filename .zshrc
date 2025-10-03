export PATH="$HOME/Apps/homebrew/bin:$PATH" #Work specific
export PATH="$HOME/local/bin:$PATH"

#### NVM ####
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"

#### PYENV ####
export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

#### RBENV ####
[ -d "$HOME/.rbenv/bin" ] && export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"

#### PHPENV ####
[ -d "$HOME/.phpenv/bin" ] && export PATH="$HOME/.phpenv/bin:$PATH"
command -v phpenv >/dev/null 2>&1 && eval "$(phpenv init -)"

#### PROMPT ####
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
precmd() { print -rP "%F{green}%B[%~]%b%f" }
zstyle ':vcs_info:git:*' formats '%b'
export PROMPT='%F{magenta}%* %D{%a %b %d}%f %B%b> '

#### ALIASES ####
[ -f "$HOME/.zsh_aliases" ] && . "$HOME/.zsh_aliases"
