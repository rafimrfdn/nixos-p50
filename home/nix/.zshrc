# Created by newuser for 5.8.1# Created by newuser for 5.8.1
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nix/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"
alias ls="exa --icons"

#PROMPT='%F{208}%n%f in %F{226}%~%f -> '
PROMPT='%F{226}%~%f '

alias vim="nvim"
alias alphp="./.alphp/7.4-full/bin/alphp"

export EDITOR=nvim
export XDG_RUNTIME_DIR=~/.tmp/xdg

#alias lf="/home/nix/.local/bin/lf-gadgets/lf-ueberzug/lf-ueberzug"
alias lf="/run/current-system/sw/bin/lf"
alias hs="hugo server"
alias hse="hugo serve --environment production"

# to enable lsp config install npm-packages
#export PATH=~/.npm-packages/bin:$PATH
export PATH=~/.npm/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules

alias rustyvibes="/home/nix/rustyvibes/target/debug/rustyvibes /home/nix/.config/rustyvibes/cherrymx-brown-pbt"
alias hme="home-manager edit"
alias hms="home-manager switch"

alias jt="cd /home/nix/Project/jagotekno"
alias jf="cd /home/nix/Project/jfhugo"
alias pm="cd /home/nix/Project/pmhugo"
alias iz="cd /home/nix/Project/izzulislam.com"
alias mrfdn="cd /home/nix/Project/mrfdn.com"

alias dev="npm run dev"

# my dotfiles alias
alias p50="/home/nix/.nix-profile/bin/git --git-dir=$HOME/.nixos-p50/ --work-tree=/"
