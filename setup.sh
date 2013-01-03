#!/bin/bash

DOT_FILES=( .zshrc .zshenv .emacs.d .gitconfig .screenrc)

for file in ${DOT_FILES[@]}
do
ln -s $HOME/config/$file $HOME/$file
done
