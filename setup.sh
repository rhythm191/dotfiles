#!/bin/bash

DOT_FILES=( .bashrc .zshrc .zshenv .emacs.d .gitconfig .screenrc .tmux.conf )

for file in ${DOT_FILES[@]}
do
ln -s $HOME/dotfiles/$file $HOME/$file
done
