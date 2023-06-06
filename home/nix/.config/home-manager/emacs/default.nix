{config, pkgs, ...}:

{
  programs.emacs = {
    enable = true;
    #config = /home/nix/.emacs.d/init.el;
    # Optionally provide extra packages not in the configuration file.
    #extraEmacsPackages = epkgs: [
    #    epkgs.use-package;
    # ];
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

    '';
  };
}

