{config, pkgs, ...}:

{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.use-package
      epkgs.evil
      epkgs.org
      epkgs.modus-themes
      epkgs.web-mode
      epkgs.undo-tree
      epkgs.org-roam
      epkgs.vertico
      epkgs.markdown-mode
      epkgs.undo-tree  
    ];
    extraConfig = ''
      ${builtins.readFile ./sanemacs.el}
      ${builtins.readFile ./init.el}
    '';
  };
}

