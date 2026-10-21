#!/bin/sh

## vim
# installing
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vimrc ~/.vimrc

# installing
ln -sf ~/dotfiles/gitignore ~/.gitignore
ln -sf ~/dotfiles/gitconfig ~/.gitconfig

## zsh
# cleaning
rm -rf ~/.zsh ~/.zshrc
mkdir -p ~/.zsh/plugins ~/.zsh/themes
# dependencies
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/themes/powerlevel10k
# install
ln -sf ~/dotfiles/zshrc ~/.zshrc
touch ~/.zshrc.local

vim -E -s -u ~/.vimrc +'PlugInstall --sync' +qa || true
