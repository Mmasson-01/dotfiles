# Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew

```bash
xcode-select --install
```

2. Clone repo into new hidden directory.

```
# Use SSH if set up...
git clone git@gitlab.com:Nap0leon/dotfiles.git ~/.dotfiles

# ... or use HTTPS and switch remotes later.
git clone https://gitlab.com/Nap0leon/dotfiles.git ~/.dotfiles
```

3. Create symlinks in the Home directory to the real files in the repo.

```bash
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/kitty ~/.config/kitty
```

4. Install Homebrew, followed by the software listed in the Brewfile.

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Bundle Brewfile
brew bundle --file ~/.dotfiles/Brewfile
```

5. Configure ZSH

```bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Configure power10klevel
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

6. Install NVM

```bash
# Run the installer
brew install nvm

# Required steps to detect nvm fles
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

7. Install other Brew packages (and tap)
```bash
brew install htop fd ripgrep jq lolcat go lazygit kitty spotify discord neovim shellcheck
brew install caarlos0/tap/timer
```

# TODO

-   Learn how to use `defaults` to record and restore System Preferences and other macOS configurations.
-   Organize steps into multiple script files
-   Automate symlinking and run script files with a bootstraping tool like `Dotbot`.
-   Make a checklist of steps to decommission your computer before wiping your hard drive.
-   Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc)
-   Find inspiration and examples in other Dotfiles repositories at [dotfiles.github.io](https://dotfiles.github.io)
