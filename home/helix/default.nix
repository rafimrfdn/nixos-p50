{config, pkgs, ...}:

{
  programs.helix = {
    enable = true; 
    settings = 
    '' 
      ${builtins.readFile ./config.toml}
    '';
  };
}
