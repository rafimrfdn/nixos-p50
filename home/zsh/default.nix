{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      package = pkgs.zsh-syntax-highlighting;
    };
    initExtra = ''
      # everything will be easy when you can use vim keybind on terminal
      bindkey -v
      
      #because when type which $TERM it returns "xterm-kitty not found"
      # TERM="kitty"
      # EDITOR="nvim"
      
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
      
      alias hs="hugo server"
      alias hse="hugo serve --environment production"
      alias nrs="npm run start"
      alias dev="npm run dev"
      
      #TMUX
      alias ta="tmux attach -t"
      alias tn="tmux new-session -s"
      #alias tk="tmux kill-session -t"
      alias tl="tmux list-sessions"
      alias td="tmux detach"
      alias tc="clear; tmux clear-history; clear"
      
      bindkey "^[[3~" delete-char
      
      alias rustyvibes="/home/nix/rustyvibes/target/debug/rustyvibes /home/nix/.config/rustyvibes/cherrymx-brown-pbt"
      alias hms="cd ~/.dotfiles/ && home-manager switch --flake ."
      
      alias pas="php artisan serve"
      
      # my dotfiles alias
      alias p50="/home/nix/.nix-profile/bin/git --git-dir=$HOME/.nixos-p50/ --work-tree=/"
      
    '';

    profileExtra = ''
    case $(basename "$(tty)" ) in  
    tty1)
    # WLR_NO_HARDWARE_CURSORS=1 exec Hyprland #prevents cursor disappear when using Nvidia drivers
    exec sway
    ;;
    #tty2)
    #exec Hyprland
    #;;
    esac
    '';

  };
}
