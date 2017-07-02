#!/bin/bash

DOT_FILES=( .bashrc .zsh .zshrc .zshenv .emacs.d .gitconfig .screenrc .tmux.conf .gemrc, .vimrc)

for file in ${DOT_FILES[@]}
do
  ln -sf $HOME/dotfiles/$file $HOME
done
