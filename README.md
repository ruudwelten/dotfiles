# Rudi's Dotfiles

Welcome to my collection of dotfiles and scripts for customizing OS X and Linux to my liking. Right now it is still a work in progress.

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
  ```yaml
  "bracket-matcher":
    autocompleteBrackets: false
    highlightMatchingLineNumber: true
  editor:
    autoIndentOnPaste: false
    showInvisibles: true
  ```

*\* Settings for `.atom/config.cson`*
