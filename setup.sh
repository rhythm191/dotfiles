#!/bin/bash

DOT_FILES=( .bashrc .zshrc .zshenv .emacs.d .gitconfig .screenrc .tmux.conf .gemrc)

for file in ${DOT_FILES[@]}
do
ln -sf $HOME/dotfiles/$file $HOME
done
