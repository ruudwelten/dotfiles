#!/usr/bin/env bash

# Source .dotfiles/.bash_profile from ~/.bash_profile
if ! tail -n 1 ~/.bash_profile | grep -Fxq "source ${DIR}/.bash_profile"; then
    log "Source ${DIR}/.bash_profile from ~/.bash_profile"
    # Remove any existing source-lines in the middle of the file
    sed -i'.backup' '/^source \/.*\/\.bash_profile$/d' ~/.bash_profile
    # Append source to the end of the file
    printf "\nsource ${DIR}/.bash_profile\n" >> ~/.bash_profile
fi

continue_skip_exit "Install or update Homebrew and Node?"
if [ $? = 0 ]; then
    # Homebrew
    which -s brew
    if [[ $? != 0 ]]; then
        log "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        log "Updating Homebrew"
        brew update
    fi

    # Node
    which -s node
    if [[ $? != 0 ]]; then
        log "Installing Node"
        brew install node
    else
        log "Upgrading Node"
        brew upgrade node
    fi
fi

continue_skip_exit "Install or upgrade Atom and its packages?"
if [ $? = 0 ]; then
    which -s atom
    if [[ $? != 0 ]]; then
        log "Installing Atom"
        brew install atom
    else
        log "Upgrading Atom"
        brew upgrade atom
    fi
fi
