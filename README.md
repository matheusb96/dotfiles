## My Dotfiles


Install Homebrew
  ```
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```
  
Install Oh-My-ZSH
  ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```

Install brew formulas
  ```
    brew install asdf coreutils curl git the_silver_searcher gpg gawk yarn kubectl kubectx stern
  ```

Install brew databases formulas
  ```
    brew install mysql postgresql
  ```
  
Install brew casks
  ```
    brew install --cask iterm2 postman spotify brave-browser tableplus slack
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

## Miscellaneous

 `git config --global alias.hist "log --pretty=format:'%C(yellow)[%ad]%C(reset) %C(green)[%h]%C(reset) | %C(red)%s %C(bold red){{%an}}%C(reset) %C(blue)%d%C(reset)' --graph --date=short"`



