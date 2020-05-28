#!/usr/bin/env bash

function install_homebrew {
    which -s brew
    if [[ $? != 0 ]]; then
        log "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        log "Updating Homebrew"
        brew update
    fi
}

function install_node {
    which -s node
    if [[ $? != 0 ]]; then
        log "Installing Node"
        brew install node
    else
        log "Upgrading Node"
        brew upgrade node
    fi
}

log "Detected macOS"

continue_skip_exit "Install Homebrew and Node?"
if [ $? = 0 ]; then
    install_homebrew
    install_node
fi
