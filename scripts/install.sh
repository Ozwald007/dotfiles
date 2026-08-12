#!/bin/sh
set -eu

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(brew shellenv)"

# Packages
#brew list zsh >/dev/null 2>&1 || brew install zsh
#brew list vim >/dev/null 2>&1 || brew install vim

# Login shell
current_shell="$(dscl . -read /Users/$USER UserShell | awk '{print $2}')"

if [ "$current_shell" != "$(command -v zsh)" ]; then
    chsh -s "$(command -v zsh)"
fi

# dein
if [ ! -d "$HOME/.cache/dein/repos/github.com/Shougo/dein.vim" ]; then
    curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh \
        | sh /dev/stdin "$HOME/.cache/dein"
fi
