#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function log {
    echo "`date '+%Y-%m-%d %H:%M:%S'`   $1" >> "${DIR}/dotlog"
}

function continue_exit {
    while true; do
        tput bold
        if [ "$2" = "red" ]
        then
            tput setaf 1
        else
            tput setaf 3
        fi
        echo
        read -p "${1} Continue [Y|C] or Exit [E]?: " answer
        tput sgr0
        case $answer in
            [YyCc]* ) return 0 ;;
            [Ee]* ) exit ;;
            * ) echo "Please answer continue [Y|C] or exit [E]." ;;
        esac
    done
}

function continue_skip_exit {
    while true; do
        tput bold
        if [ "$2" = "red" ]
        then
            tput setaf 1
        else
            tput setaf 3
        fi
        echo
        read -p "${1} Continue [Y|C], Skip [N|S] or Exit [E]?: " answer
        tput sgr0
        case $answer in
            [YyCc]* ) return 0 ;;
            [NnSs]* ) return 1 ;;
            [Ee]* ) exit ;;
            * ) echo "Please answer continue [Y|C], skip [N|S] or exit [E]." ;;
        esac
    done
}



log "Running installer"

case "$(uname -s)" in
    Linux*)
        continue_exit "Linux detected."
        source "${DIR}/.linux" ;;
    Darwin*)
        continue_exit "macOS detected."
        source "${DIR}/.macos" ;;
esac

echo