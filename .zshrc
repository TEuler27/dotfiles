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

## Keybinding for vi
bindkey -M viins 'jj' vi-cmd-mode

## Aliases
eval $(thefuck --alias)

## Environment variables
export GIT_EDITOR=nvim
