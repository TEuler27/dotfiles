# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/edoardo/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# CUSTOM CONFIGURATION

## PATH
export PATH="$PATH:$HOME/.local/bin:/opt/nvim-linux-x86_64/bin"
# Newest TeX Live install in /usr/local/texlive/<year>, if any
texlive_dir=( /usr/local/texlive/<->(N/On[1]) )
if (( $#texlive_dir )); then
    export PATH="$PATH:$texlive_dir/bin/x86_64-linux"
    export MANPATH="$MANPATH:$texlive_dir/texmf-dist/doc/man"
    export INFOPATH="$INFOPATH:$texlive_dir/texmf-dist/doc/info"
fi
unset texlive_dir
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## Keybinding for vi
bindkey -M viins 'jj' vi-cmd-mode

## Aliases
command -v thefuck >/dev/null && eval $(thefuck --alias)

## Environment variables
export EDITOR=nvim
export GIT_EDITOR=nvim

## Shell tools
source <(fzf --zsh)
eval "$(zoxide init zsh)"
