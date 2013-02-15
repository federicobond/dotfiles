#!/usr/bin/env bash

echo "Initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm -f ~/.profile
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

echo "Symlinking files"
ln -s ~/dotfiles/profile ~/.profile
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/gemrc ~/.gemrc
ln -s ~/dotfiles/irbrc ~/.irbrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/jshintrc ~/.jshintrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

if [ `uname` == "Darwin" ]; then
    echo "Setting defaults for OS X"
    source osx
fi

echo "Done."


