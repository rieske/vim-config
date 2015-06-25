#!/bin/bash

rm -f ~/.vimrc
ln -s ${PWD}/vim/.vimrc ~/.vimrc
rm -rf ~/.vim
ln -s ${PWD}/vim/.vim ~/.vim

rm -f ~/.tmux.conf
ln -s ${PWD}/tmux/.tmux.conf ~/.tmux.conf
rm -rf ~/.tmux
ln -s ${PWD}/tmux/.tmux ~/.tmux
