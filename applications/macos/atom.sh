#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Atom\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_apm_package() {

    execute \
        "apm install --silent $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Atom" "atom" "homebrew/cask" "cask"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

install_apm_package "atom-ide-ui package" "atom-ide-ui"
install_apm_package "duplicate-line-or-selection package" "duplicate-line-or-selection"
install_apm_package "emmet package" "emmet"
install_apm_package "highlight-selected package" "highlight-selected"
execute \
    "pip install 'python-language-server[all]'" \
    "python-language-server for ide-python package"
install_apm_package "ide-python package" "ide-python"
install_apm_package "Docker language" "language-docker"
install_apm_package "AppleScript language" "language-applescript"
install_apm_package "less-than-slash package" "less-than-slash"
install_apm_package "pigments package" "pigments"
install_apm_package "platformio-ide-terminal package" "platformio-ide-terminal"
install_apm_package "project-manager package" "project-manager"
install_apm_package "split-diff package" "split-diff"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

install_apm_package "monokai-seti syntax theme" "monokai-seti"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

git config --global core.editor "atom --wait"

print_result $? "Set Atom as Git editor"
