{config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    vimAlias = true;
    extraConfig = ''
      '';
  };
}
