#!/usr/bin/env bash

# Currently phpenv/php-build do not work on Catalina, so I've
# temporarily switched to a simple brew install.
# https://github.com/php-build/php-build/issues

# When phpenv works again, delete this file
# and move ../ubuntu/php.sh to ../

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../os/utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PHP\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "PHP" "php"
brew_install "Composer" "composer"
