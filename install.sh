#!/usr/bin/env bash

git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

setopt EXTENDED_GLOB
for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
  user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
  touch ${user_file}
  ( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
done

echo "Initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm -f ~/.profile
rm -f ~/.zimrc
rm -f ~/.zshrc
rm -f ~/.zsh_aliases
rm -f ~/.vimrc
rm -f ~/.gvimrc
rm -rf ~/.vim
rm -f ~/.gemrc
rm -f ~/.irbrc
rm -f ~/.gitconfig
rm -f ~/.gitignore
rm -f ~/.jshintrc
rm -f ~/.tmux.conf
rm -f ~/.ackrc
rm -f ~/.pythonstartup
rm -rf ~/.pip

echo "Symlinking files"
ln -s ~/dotfiles/profile ~/.profile
ln -s ~/dotfiles/zimrc ~/.zimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/gemrc ~/.gemrc
ln -s ~/dotfiles/irbrc ~/.irbrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/pythonstartup ~/.pythonstartup
ln -s ~/dotfiles/pip ~/.pip

echo "Done."


