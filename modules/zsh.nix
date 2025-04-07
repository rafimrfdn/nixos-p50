{ inputs, hostname, config, pkgs, host, ...}: 

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      package = pkgs.zsh-syntax-highlighting;
    };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"

      #because when type which $TERM it returns "xterm-kitty not found"
      # TERM="kitty"

      # everything will be easy when you can use vim keybind on terminal
      bindkey -v

      # PROMPT='%F{226}%>%f '

      export CLICOLOR=1
      export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

      export EDITOR=nvim
      export PATH="$HOME/.config/emacs/bin:$PATH"
    '';
    shellAliases = {
      ll="ls -alG";
      ls="exa";
      cat="bat";

      alphp="./.alphp/7.4-full/bin/alphp";

      hs="hugo server --renderToMemory";
      hse="hugo serve --environment production";
      nrs="npm run start";
      dev="npm run dev";
      firefox="firefox-esr";
      
      #TMUX
      ta="tmux attach -t";
      tn="tmux new-session -s";
      #tk="tmux kill-session -t";
      tl="tmux list-sessions";
      td="tmux detach";

      sqlite3="rlwrap sqlite3";
    };

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

  # programs.zoxide = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  # programs.oh-my-posh = {
  #     enable = true;
  #     enableZshIntegration = true;
  #     enableBashIntegration = true;
  #      useTheme = "powerlevel10k_lean";
  # };


# programs.starship = {
#     enable = true;
#
#     enableBashIntegration = true;
#     enableZshIntegration = true;
#     enableNushellIntegration = true;
#
#     settings = {
#       right_format = "$cmd_duration";
#       
#       directory = {
#         format = "[ ](bold #89b4fa)[ $path ]($style)";
#         style = "bold #b4befe";
#       };
#
#       character = {
#         success_symbol = "[ ](bold #89b4fa)[ ➜](bold green)";
#         error_symbol = "[ ](bold #89b4fa)[ ➜](bold red)";
#         # error_symbol = "[ ](bold #89dceb)[ ✗](bold red)";
#       };
#
#       cmd_duration = {
#         format = "[󰔛 $duration]($style)";
#         disabled = false;
#         style = "bg:none fg:#f9e2af";
#         show_notifications = false;
#         min_time_to_notify = 60000;
#       };        
#
#       # palette = "catppuccin_mocha";
#     }; 
#   };


}

