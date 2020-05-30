# Rudi's Dotfiles

Welcome to my collection of dotfiles and scripts for customizing macOS and Linux to my liking. Right now it is still a work in progress.

## Installation

```sh
$ git clone https://github.com/ruudwelten/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ chmod +x install.sh
$ ./install.sh
```

## To do

- Install Python & PHP
- Install macOS services
- Install Atom packages
  - duplicate-line-or-selection
  - fold-functions?
    ```yaml
    "fold-functions":
      autofold: true
      autofoldGrammars: []
      shortfileCutoff: 42
      skipAutofoldWhenNotFirstLine: true
      skipAutofoldWhenOnlyOneFunction: true
    ```
  - highlight-selected
  - language-asp
  - less-than-slash
  - markdown-preview-plus
    ```yaml
    "markdown-preview-plus":
      previewConfig: {}
      useGitHubStyle: true
    ```
  - pigments
  - project-manager
  - split-diff
  - platform-ide-terminal *
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
  - todo-show
  - emmet
- Install Atom themes
  - One Dark UI theme *
    ```yaml
    "one-dark-ui":
      hideDockButtons: true
    ```
  - Monokai Seti Syntax theme
- Other atom settings:
  - config.cson:
    ```yaml
    "bracket-matcher":
      autocompleteBrackets: false
      highlightMatchingLineNumber: true
    editor:
      autoIndentOnPaste: false
      showInvisibles: true
    ```
  - keymap.cson:
    ```yaml
    'atom-text-editor':
      'ctrl-e': 'emmet:expand-abbreviation'
    '.platform-darwin atom-workspace':
      'cmd-`': 'platformio-ide-terminal:toggle'
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

*\* Settings for `.atom/config.cson`*
