#depends rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#depends nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#depends phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
