{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableBashCompletion.enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
}
