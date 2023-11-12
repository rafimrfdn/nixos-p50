{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellInit = ''
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

# everything will be easy when you can use vim keybind on terminal
bindkey -v

#because when type which $TERM it returns "xterm-kitty not found"
TERM="kitty"
EDITOR="nvim"

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"
#alias ls="exa --icons"
alias ls="exa"
alias cat="bat"

#PROMPT='%F{208}%n%f in %F{226}%~%f -> '
PROMPT='%F{226}%~%f '

#alias vim="/home/nix/neovim-nightly/build/bin/nvim"
alias alphp="./.alphp/7.4-full/bin/alphp"

export EDITOR=nvim
export PATH="$HOME/.config/emacs/bin:$PATH"

#export XDG_RUNTIME_DIR=~/.tmp/xdg

#alias lf="/home/nix/.local/bin/lf-gadgets/lf-ueberzug/lf-ueberzug"
#alias lf="/run/current-system/sw/bin/lf"
alias hs="hugo server"
alias hse="hugo serve --environment production"
alias nrs="npm run start"

#TMUX
alias ta="tmux attach -t"
alias tn="tmux new-session -s"
#alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias td="tmux detach"
alias tc="clear; tmux clear-history; clear"

bindkey "^[[3~" delete-char

# to enable lsp config install npm-packages
#export PATH=~/.npm-packages/bin:$PATH
export PATH=~/.npm/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules

#for nix home-manager
#. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

alias rustyvibes="/home/nix/rustyvibes/target/debug/rustyvibes /home/nix/.config/rustyvibes/cherrymx-brown-pbt"
alias hms="cd ~/.dotfiles/ && home-manager switch --flake ."

alias jt="cd /home/nix/Project/hugo/jagotekno"
alias jf="cd /home/nix/Project/hugo/jfhugo"
alias pm="cd /home/nix/Project/hugo/pmhugo"
alias iz="cd /home/nix/Project/hugo/izzulislam.com"
alias mrfdn="cd /home/nix/Project/hugo/mrfdn.com"

alias dev="npm run dev"

alias pas="php artisan serve"

# my dotfiles alias
alias p50="/home/nix/.nix-profile/bin/git --git-dir=$HOME/.nixos-p50/ --work-tree=/"

alias biznet="/home/nix/.ssh/mysshport"
   ''; 
  };
}
