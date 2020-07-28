ZSH_THEME="muse"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="sudo vim ~/.zshrc"

export PATH="/usr/local/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ngrok="~/Documents/ngrok"
alias php-up="php -S localhost:8080"
alias bi="bundle install"

alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

alias gprb="git pull --rebase"
alias be="bundle exec"
alias rs="rails s -p 3000"

export PATH="$HOME/Qt5.5.0/5.5/clang_64/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
