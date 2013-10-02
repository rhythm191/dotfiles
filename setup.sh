#!/bin/bash

DOT_FILES=( .bashrc .zshrc .zshenv .emacs.d .gitconfig .screenrc .tmux.conf .gemrc, .vimrc)

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git neobundle.vim

for file in ${DOT_FILES[@]}
do
ln -sf $HOME/dotfiles/$file $HOME
done
