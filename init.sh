#!/bin/sh

# cleaning
rm -rf ~/.bash* ~/.profile
rm -rf ~/.dotfiles

# repo
git clone --recurse-submodules https://github.com/damjanek/dotfiles.git ~/.dotfiles

## vim
# cleaning
rm -rf ~/.vim*
# installing
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc

## .gitignore
# cleaning
rm -rf ~/.gitignore
# installing
ln -sf ~/.dotfiles/gitignore ~/.gitignore
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig

## zsh
# cleaning
rm -rf ~/.zsh ~/.zshrc
mkdir -p ~/.zsh/plugins ~/.zsh/themes
# dependiences
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/themes/powerlevel10k
# install
ln -sf ~/.dotfiles/zshrc ~/.zshrc
touch ~/.zshrc.local
