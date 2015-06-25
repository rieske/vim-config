#!/bin/bash

rm ~/.vimrc
ln -s ${PWD}/vim/.vimrc ~/.vimrc
rm -rf ~/.vim
ln -s ${PWD}/vim/.vim ~/.vim
