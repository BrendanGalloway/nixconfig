#! /bin/bash

dnf update
dnf install \
	alacritty \
	feh \
	gnome-screenshot \
	i3-gaps \
	kde-runtime \
	vim \
	vmctrl 

cp .bashrc $HOME/
cp .vimrc $HOME/
cp i3/config $HOME/.config/i3

