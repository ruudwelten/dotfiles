#!/bin/bash

# Warn user this script will overwrite current dotfiles
while true; do
    echo -e "\033[31m\033[1m"
    read -p "Warning: This will overwrite your current dotfiles. Continue? [y/n] " yn
    echo -e "\033[0m"
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

install_atom() {
    
}
