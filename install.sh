#! /bin/bash
#
# IMPORTANT: This file is not yet completed. 
# DO NOT RUN IT!
#
# This file basically clears the current dotfiles
# on the system and links all of the ones in the 
# dot file directory

rm -rf ~/.bashrc
ln -s .bashrc ~/.bashrc

ln -s .xfiles/ ~/.xfiles/
