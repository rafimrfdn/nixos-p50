{config, pkgs, input, ...}:

{
programs.neovim = 
  {
    enable = true;

    defaultEditor = true;
    withNodeJs = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
      vimPlugins.solarized-nvim
    ];


    extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
    '';

  };



}
