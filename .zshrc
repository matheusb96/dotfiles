# Load Homebrew too, useful if some terminal doesn't load .zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# Keybindings
bindkey -e

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search compinit
compinit

zmodload zsh/complist

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' squeeze-slashes true

if bindkey -l | grep -q '^menuselect$'; then
  bindkey -M menuselect '^[[A' up-line-or-history
  bindkey -M menuselect '^[[B' down-line-or-history
  bindkey -M menuselect '^[[C' forward-char
  bindkey -M menuselect '^[[D' backward-char
fi

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Up/down arrows search based on what you've typed
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Ctrl-p / Ctrl-n also search history
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# Ctrl-r reverse search
bindkey '^R' history-incremental-search-backward

# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# Useful aliases
alias c='clear'
alias ll='ls -lah'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate'

eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
eval "$(mise activate zsh)"

# Better tools
alias ls='eza --icons'
alias ll='eza -lah --icons --git'
alias cat='bat'
alias grep='rg'

# Git
alias g='git'
alias gst='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'
alias gpr='git pull --rebase'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# Rails
alias be='bundle exec'
alias br='bin/rails'
alias bc='bin/rails console'
alias bs='bin/rails server'
alias bt='bin/rails test'
alias bdm='bin/rails db:migrate'
alias bdr='bin/rails db:rollback'
alias bdp='bin/rails db:prepare'
alias routes='bin/rails routes'

# RSpec / RuboCop
alias rs='bundle exec rspec'
alias rubo='bundle exec rubocop'
alias ruboa='bundle exec rubocop -A'

# Deploy/platforms
alias h='heroku'
alias hlog='heroku logs --tail'
alias hrc='heroku run rails console'
alias rw='railway'
alias rwrun='railway run'
alias rwlogs='railway logs'

# Option + Left / Right: move by word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
