{config, pkgs, input, ...}:

{
programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    defaultEditor = true;
    withNodeJs = true;

    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard

      cargo
    ];


    plugins = with pkgs.vimPlugins; [

    ];
    

    extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
      ${builtins.readFile ./plugin/toggleterm.lua}

    '';
  };


}
