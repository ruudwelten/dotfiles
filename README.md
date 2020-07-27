# Rudi's Dotfiles

Welcome to my collection of dotfiles and scripts for customizing macOS and
Ubuntu to my liking. So far it contains only Mac specific code and as such it is
still a work in progress.

## Setup

**Do not** run the `setup` if you do not fully understand what it does! First
check out the script and when you fully understand it you can continue.

For now there's just a macOS setup, Ubuntu will follow in the future. To set up
these dotfiles run the following command in the terminal:

    $ bash -c "$(curl -LsS https://raw.github.com/ruudwelten/dotfiles/master/setup.sh)"

Or clone the repository first and install it from there:

    $ git clone https://github.com/ruudwelten/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ chmod +x .setup
    $ ./.setup

## To do

- Install Python & PHP
- Install macOS services
- Install Atom packages
  - fold-functions?
    ```yaml
    "fold-functions":
      autofold: true
      autofoldGrammars: []
      shortfileCutoff: 42
      skipAutofoldWhenNotFirstLine: true
      skipAutofoldWhenOnlyOneFunction: true
    ```
  - ide-python
    ```yaml
    "ide-python":
      pylsPlugin:
        autopep8:
          enabled: false
        flake8:
          enabled: true
        jedi_hover: {}
        mccabe:
          enabled: false
        preload: {}
        pycodestyle:
          enabled: false
        pydoctstyle:
          enabled: true
        pyflakes:
          enabled: false
    ```
  - markdown-preview-plus
    ```yaml
    "markdown-preview-plus":
      previewConfig: {}
      useGitHubStyle: true
    ```
  - platformio-ide-terminal *
    ```yaml
    "platformio-ide-terminal":
      ansiColors:
        normal:
          blue: "#0080ff"
          green: "#80d200"
          yellow: "#eec700"
        zBright:
          brightBlue: "#0080ff"
          brightGreen: "#80d200"
          brightYellow: "#eec700"
      toggles:
        runInsertedText: false
        selectToCopy: false
        showToolbar: false
    ```
- Install Atom themes
  - One Dark UI theme *
    ```yaml
    "one-dark-ui":
      hideDockButtons: true
    ```
- Other atom settings:
  - config.cson:
    ```yaml
    "bracket-matcher":
      autocompleteBrackets: false
      highlightMatchingLineNumber: true
    editor:
      autoIndentOnPaste: false
      showInvisibles: true
    tabs:
      enableMruTabSwitching: false
    ```
  - keymap.cson:
    ```yaml
    'atom-text-editor':
      'ctrl-e': 'emmet:expand-abbreviation'
    '.platform-darwin atom-workspace':
      'ctrl-`': 'platformio-ide-terminal:toggle'
      'cmd-`': 'platformio-ide-terminal:focus'
    '.platform-darwin .platformio-ide-terminal .terminal':
      'cmd-c': 'platformio-ide-terminal:copy'
      'cmd-v': 'platformio-ide-terminal:paste'
    ```
  - snippets.cson:
    ```yaml
    '.text.html.php':
      'PHP':
        'prefix': 'php'
        'body': '<?php\n\t$1\n?>'
      'PHP full':
        'prefix': '<?php'
        'body': '<?php\n\t$1\n?>'
      'echo':
        'prefix': 'echo'
        'body': '<?= $1 ?>$2'
      'Debug data':
        'prefix': 'debug'
        'body': 'echo \'<xmp>\' . print_r($1, true) . \'</xmp>\';$2'

    '.html.text':
      'HTML':
        'prefix': 'html'
    'body': '<!DOCTYPE html>\n<html lang="${1:en}" dir="${2:ltr}">\n\t<head>\n\t\t<meta charset="utf-8">\n\t\t<meta content="width=device-width, initial-scale=1" name="viewport">\n\t\t<title>$3</    title>\n\t</head>\n\t<body>\n\t\t$4\n\t</body>\n</html>'

    '.source.php':
      'Debug data':
        'prefix': 'debug'
        'body': 'echo \'<xmp>\' . print_r($1, true) . \'</xmp>\';$2'

    '.source.asp':
      'Debug data':
        'prefix': 'debug'
        'body': 'Response.Write("<xmp>" & $1 & "</xmp>")$2'
    ```
- GNU Stow implementation?

*\* Settings for `.atom/config.cson`*

## Thanks:

- [Cătălin Mariș](https://catlanmaris.com/) for his awesome [dotfiles repository](https://github.com/alrra/dotfiles)
- [Mathias Bynens](https://mathiasbynens.be/) for his excellent [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
