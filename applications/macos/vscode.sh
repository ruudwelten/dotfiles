#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_vscode_extension() {

    execute \
        "code --install-extension $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Visual Studio Code" "visual-studio-code" "homebrew/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

# TODO: Option to overwrite settings after prompt
if [ ! -f ~/Library/Application\ Support/Code/User/settings.json ]; then
    cp preferences/Visual\ Studio\ Code/settings.json ~/Library/Application\ Support/Code/User/
fi
if [ ! -f ~/Library/Application\ Support/Code/User/keybindings.json ]; then
    cp preferences/Visual\ Studio\ Code/keybindings.json ~/Library/Application\ Support/Code/User/
fi

print_result $? "Copy VSCode settings and key bindings"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

install_vscode_extension "Atom Keymap package" "ms-vscode.atom-keybindings"
install_vscode_extension "DotENV package" "mikestead.dotenv"
install_vscode_extension "EditorConfig package" "EditorConfig.EditorConfig"
install_vscode_extension "HTML CSS Support package" "ecmel.vscode-html-css"
install_vscode_extension "Markdown All in One package" "yzhang.markdown-all-in-one"
install_vscode_extension "PHP Intelephense package" "bmewburn.vscode-intelephense-client"
install_vscode_extension "phpcs package" "ikappas.phpcs"
install_vscode_extension "Pylance package" "ms-python.vscode-pylance"
install_vscode_extension "Python package" "ms-python.python"
install_vscode_extension "Red Hat Commons package" "redhat.vscode-commons"
install_vscode_extension "Smarty package" "imperez.smarty"
install_vscode_extension "SQLite package" "alexcvzz.vscode-sqlite"
install_vscode_extension "Twig Language 2 package" "mblode.twig-language-2"
install_vscode_extension "YAML package" "redhat.vscode-yaml"
install_vscode_extension "XML package" "redhat.vscode-xml"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

install_vscode_extension "CodeSandbox Black theme" "ziterz.codesandbox-black-theme"
install_vscode_extension "Dracula theme" "dracula-theme.theme-dracula"
install_vscode_extension "One Monokai theme" "azemoh.one-monokai"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

git config --global core.editor "code --wait"

print_result $? "Set VSCode as Git editor"
