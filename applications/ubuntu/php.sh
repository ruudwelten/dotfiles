#!/usr/bin/env bash

# Currently phpenv/php-build do not work on Catalina, so I've
# temporarily switched to a simple brew install.
# https://github.com/php-build/php-build/issues

# When phpenv works again, delete ../macos/php.sh
# and move ./php.sh to ../

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r PHPENV_DIRECTORY="$HOME/.phpenv"
declare -r PHPENV_GIT_REPO_URL="https://github.com/phpenv/phpenv.git"
declare -r PHPBUILD_GIT_REPO_URL="https://github.com/php-build/php-build.git"
declare -r XXENVLATEST_GIT_REPO_URL="https://github.com/momo-lab/xxenv-latest.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_phpenv_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# PHP Version Management

export PHPENV_ROOT=\"$PHPENV_DIRECTORY\"
export PATH=\"\$PHPENV_ROOT/bin:\$PATH\"

if command -v phpenv 1>/dev/null 2>&1; then
  eval \"\$(phpenv init -)\"
fi

"

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "phpenv (update $LOCAL_SHELL_CONFIG_FILE)"

}

install_latest_stable_php() {

    # Install the latest stable version of PHP
    # and set it as the global default.
    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && phpenv latest install \
            && phpenv latest global" \
        "phpenv (install latest PHP)"

}

install_phpenv() {

    # Install `phpenv` and add the necessary
    # configs in the local shell config file.
    execute \
        "git clone --quiet $PHPENV_GIT_REPO_URL $PHPENV_DIRECTORY" \
        "phpenv (install)" \
    && \
    execute \
        "git clone --quiet $PHPBUILD_GIT_REPO_URL $PHPENV_DIRECTORY/plugins/php-build" \
        "php-build (install)" \
    && \
    execute \
        "$PHPENV_DIRECTORY/plugins/php-build/install-dependencies.sh" \
        "php-build dependencies (install)" \
    && \
    execute \
        "git clone --quiet $XXENVLATEST_GIT_REPO_URL $PHPENV_DIRECTORY/plugins/xxenv-latest" \
        "xxenv-latest (install)" \
    && add_phpenv_configs \

}

update_phpenv() {

    execute \
        "cd $PHPENV_DIRECTORY \
            && git fetch --quiet origin \
            && git checkout --quiet \$(git describe --abbrev=0 --tags)" \
        "phpenv (upgrade)"
    execute \
        "cd $PHPENV_DIRECTORY/plugins/php-build \
            && git fetch --quiet origin \
            && git pull" \
        "php-build (upgrade)"
    execute \
        "cd $PHPENV_DIRECTORY/plugins/xxenv-latest \
            && git fetch --quiet origin \
            && git pull" \
        "xxenv-latest (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   PHP\n\n"

    if [ ! -d "$PHPENV_DIRECTORY" ]; then
        install_phpenv
    else
        update_phpenv
    fi

    install_latest_stable_php

}

main
