#!/usr/bin/env zsh

set -ex

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install git leiningen go z packer awscli tig fzf gh trash starship kitty diff-so-fancy corretto
brew install exa procs dust bat ripgrep fd
brew tap caskroom/cask
brew tap caskroom/versions
brew cask install karabiner-elements dash sequel-pro emacs caffeine docker hammerspoon alfred telegram the-unarchiver gpg-suite
