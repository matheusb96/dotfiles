## My Dotfiles

Fresh macOS setup, in order.

### 1. Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Ruby build dependencies

```sh
brew install libyaml openssl@3 readline zlib gmp autoconf
```

### 3. Core tooling

```sh
brew install git-lfs gh gnupg neovim jq tmux node
```

Uses macOS system `git`; only `git-lfs` comes from Homebrew.

### 4. Version manager

```sh
brew install mise
```

Then install the runtimes (matches what this machine runs):

```sh
mise use -g ruby@3.4.9
mise install ruby@3.2.10
```

### 5. Databases

```sh
brew install postgresql@18 libpq redis
brew services start postgresql@18
brew services start redis
```

### 6. Dev tooling

```sh
brew install overmind heroku railway cloudflared docker docker-buildx k6 uv
brew install hashicorp/tap/terraform
```

Docker engine comes from the OrbStack cask below, not Docker Desktop.

### 7. CLI tools

```sh
brew install ripgrep fd fzf bat eza starship lazygit diff-so-fancy
brew install pandoc typst ffmpeg sox vips terminal-notifier opencode
```

### 8. Casks

```sh
brew install --cask ghostty google-chrome slack tableplus orbstack ngrok \
  claude codex chatgpt github linear notion spotify whatsapp postman
```

### 9. GitHub auth

```sh
gh auth login
```

Sets up the `gh auth git-credential` helper that `~/.gitconfig` relies on.

## Git config

Identity — fill in your own:

```sh
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
git lfs install
```

Diff-so-fancy. The pager and diffFilter lines are what actually turn it on;
the colors alone do nothing:

```sh
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"

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

Log alias:

```sh
git config --global alias.hist "log --pretty=format:'%C(yellow)[%ad]%C(reset) %C(green)[%h]%C(reset) | %C(red)%s %C(bold red){{%an}}%C(reset) %C(blue)%d%C(reset)' --graph --date=short"
```

## Symlink configs

Run from the repo root.

```sh
# Shell
ln -sf "$PWD/.zshrc" ~/.zshrc

# Ghostty — the file must be named config.ghostty, not config
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
ln -sf "$PWD/ghostty/config" \
  "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

# Neovim (LazyVim) — symlink the whole directory
ln -sfn "$PWD/nvim" ~/.config/nvim

# Claude Code — link individual items, never the whole ~/.claude directory
# (it also holds history.jsonl, caches, and credentials, which must stay out of git)
mkdir -p ~/.claude/skills
ln -sf  "$PWD/claude/CLAUDE.md"     ~/.claude/CLAUDE.md
ln -sf  "$PWD/claude/settings.json" ~/.claude/settings.json
ln -sfn "$PWD/claude/agents"        ~/.claude/agents
ln -sfn "$PWD/claude/hooks"         ~/.claude/hooks
for s in "$PWD"/claude/skills/*/; do ln -sfn "$s" ~/.claude/skills/"$(basename "$s")"; done
```

Back up any existing target before symlinking over it — `ln -sf` will replace it.

`~/.claude/skills` also fills up with plugin- and marketplace-installed skills.
Only the ones in `claude/skills/` here are ours; the rest are reinstalled by
Claude Code itself and are not tracked.

## Machine-local config

`~/.zshrc` sources `~/.zshrc.local` at the end if it exists. Anything
machine-specific or project-specific (deploy helpers, work paths, secrets-adjacent
functions) goes there. It is deliberately not tracked in this repo.

## Verify

```sh
ls -ld ~/.zshrc ~/.config/nvim ~/.claude/CLAUDE.md   # symlinks into this repo
ls -ld "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
ghostty +show-config | grep theme                    # config is actually being read
nvim --headless "+qa"                                # starts clean, no errors
git hist -3                                          # alias works
git config --global core.pager                       # diff-so-fancy is wired up
```
