{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    syntaxHighlighting = true;
  };
}
