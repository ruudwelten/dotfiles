#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_vscode_extension() {

    execute \
        "code --install-extension $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_vscode() {

    brew_install "Visual Studio Code" "visual-studio-code" "homebrew/cask" "cask"

}

install_vscode_extensions() {

    printf "\n"

    install_vscode_extension "Atom Keymap package" "ms-vscode.atom-keybindings"
    install_vscode_extension "DotENV package" "mikestead.dotenv"
    install_vscode_extension "EditorConfig package" "EditorConfig.EditorConfig"
    install_vscode_extension "HTML CSS Support package" "ecmel.vscode-html-css"
    install_vscode_extension "Markdown All in One package" "yzhang.markdown-all-in-one"
    install_vscode_extension "PHP Intelephense package" "bmewburn.vscode-intelephense-client"
    install_vscode_extension "Pylance package" "ms-python.vscode-pylance"
    install_vscode_extension "Python package" "ms-python.python"
    install_vscode_extension "Red Hat Commons package" "redhat.vscode-commons"
    install_vscode_extension "SQLite package" "alexcvzz.vscode-sqlite"
    install_vscode_extension "YAML package" "redhat.vscode-yaml"
    install_vscode_extension "XML package" "redhat.vscode-xml"

}

install_vscode_themes() {

    printf "\n"

    install_vscode_extension "CodeSandbox Black theme" "ziterz.codesandbox-black-theme"
    install_vscode_extension "Dracula theme" "dracula-theme.theme-dracula"
    install_vscode_extension "One Monokai theme" "azemoh.one-monokai"
    install_vscode_extension "Plastic theme" "will-stone.plastic"

}

ask_for_overwrite_or_diff() {

    ask "VSCode $NAME file already exists, would you like to overwrite this [y] or view the diff [d]? (y/n/d) "
    answer_is_yes && return 0
    answer_is_no && return 1

    printf "\n"
    [[ "$REPLY" =~ ^[Dd]$ ]] && git diff --color=always $2 $1 | sed 's/^/       /'
    printf "\n\n"

    ask "Would you like to overwrite this file? (y/n) "
    answer_is_yes && return 0 || return 1

}

copy_vscode_config() {

    local FILE=$1
    local NAME=$2

    local CONFIG_DIR="$HOME/.temp" # "$HOME/Library/Application\ Support/Code/User"
    local SOURCE="preferences/VSCode/$FILE"
    local DEST="$CONFIG_DIR/$FILE"

    # If file does not exist, copy the file and return
    if [[ ! -f "$CONFIG_DIR/$FILE" ]]; then
        execute "cp $SOURCE $CONFIG_DIR" "Copy VSCode $NAME"
        return
    fi

    if $(git diff --quiet $DEST $SOURCE) 2>/dev/null; then
        # Files are equal, return
        print_info "Existing $NAME is the same as $FILE"
        return
    else
        # Files are different, ask for overwrite or diff
        ask_for_overwrite_or_diff $SOURCE $DEST $CONFIG_DIR && \
            execute "cp $SOURCE $CONFIG_DIR" "Copy VSCode $NAME" && return
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Visual Studio Code\n\n"

    install_vscode
    install_vscode_extensions
    install_vscode_themes
    printf "\n"
    copy_vscode_config "settings.json" "settings"
    copy_vscode_config "keybindings.json" "key bindings"

}

main
