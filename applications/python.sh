#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../os/utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r PYENV_DIRECTORY="$HOME/.pyenv"
declare -r PYENV_GIT_REPO_URL="https://github.com/pyenv/pyenv.git"
declare -r XXENVLATEST_GIT_REPO_URL="https://github.com/momo-lab/xxenv-latest.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_pyenv_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Python Version Management

export PYENV_ROOT=\"$PYENV_DIRECTORY\"
export PATH=\"\$PYENV_ROOT/bin:\$PATH\"

if command -v pyenv 1>/dev/null 2>&1; then
  eval \"\$(pyenv init -)\"
fi

"

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "pyenv (update $LOCAL_SHELL_CONFIG_FILE)"

}

install_latest_stable_python() {

    # Install the latest stable version of Python
    # (this will also set it as the default).
    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && pyenv latest install" \
        "pyenv (install latest Python)"

}

install_pyenv() {

    # Install `pyenv` and add the necessary
    # configs in the local shell config file.
    execute \
        "git clone --quiet $PYENV_GIT_REPO_URL $PYENV_DIRECTORY" \
        "pyenv (install)" \
    && \
    execute \
        "git clone --quiet $XXENVLATEST_GIT_REPO_URL $PYENV_DIRECTORY/plugins/xxenv-latest" \
        "xxenv-latest (install)" \
    && add_pyenv_configs

}

update_pyenv() {

    execute \
        "cd $PYENV_DIRECTORY \
            && git fetch --quiet origin \
            && git checkout --quiet \$(git describe --abbrev=0 --tags)" \
        "pyenv (upgrade)"
    execute \
        "cd $PYENV_DIRECTORY/plugins/xxenv-latest \
            && git fetch --quiet origin \
            && git pull" \
        "xxenv-latest (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Python\n\n"

    if [ ! -d "$PYENV_DIRECTORY" ]; then
        install_pyenv
    else
        update_pyenv
    fi

    install_latest_stable_python

}

main
