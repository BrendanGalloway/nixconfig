#! /bin/bash

dnf update
dnf install i3-gaps vim

cp .bashrc $HOME/
cp .vimrc $HOME/
cp i3/config $HOME/.config/i3

