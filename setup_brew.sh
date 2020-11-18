#!/usr/bin/env zsh

set -ex

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update
brew tap homebrew/cask
brew update
brew install git leiningen go z packer awscli tig fzf gh trash starship kitty diff-so-fancy corretto
# rust toolchain
brew install exa procs dust bat ripgrep fd
brew cask install karabiner-elements sequel-pro emacs hammerspoon alfred telegram the-unarchiver gpg-suite
