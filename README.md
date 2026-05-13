## My Dotfiles

Install Homebrew
  ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

Install Ruby build dependencies
  ```
    brew install libyaml openssl@3 readline zlib gmp autoconf
  ```

Install core tooling
  ```
    brew install git gh curl coreutils gnupg gawk tree neovim jq
  ```

Install version manager
  ```
    brew install mise
  ```

Install databases
  ```
    brew install postgresql@17 libpq redis
  ```

Install dev tooling
  ```
    brew install overmind heroku railway
  ```

Install CLI tools
  ```
    brew install ripgrep fd fzf bat eza starship
  ```

Install brew casks
  ```
    brew install --cask ghostty postman spotify brave-browser tableplus slack
  ```

Install Diff-so-fancy

  ```
    brew install diff-so-fancy

    git config --global color.ui true

    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"

    git config --global color.diff.meta       "yellow"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
  ```

## Symlink configs

  ```
    ln -sf "$PWD/.zshrc" ~/.zshrc
    mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
    ln -sf "$PWD/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
  ```

## Miscellaneous

 `git config --global alias.hist "log --pretty=format:'%C(yellow)[%ad]%C(reset) %C(green)[%h]%C(reset) | %C(red)%s %C(bold red){{%an}}%C(reset) %C(blue)%d%C(reset)' --graph --date=short"`
