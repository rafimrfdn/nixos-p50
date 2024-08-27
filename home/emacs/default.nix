{config, epkgs, ...}:

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
      epkgs.vterm
      epkgs.vterm-toggle
      epkgs.neotree
      epkgs.which-key
      epkgs.dired-open
      epkgs.sudo-edit
      epkgs.evil-collection
      epkgs.evil-tutor
      epkgs.general
      epkgs.org-bullets
    ];
    extraConfig = ''
      ${builtins.readFile ./sanemacs.el}
      ${builtins.readFile ./init.el}
    '';
  };
}
