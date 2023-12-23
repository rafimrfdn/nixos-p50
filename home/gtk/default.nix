{config, pkgs, ...}:

{
  gtk = {
    enable = true;
    font = {
      name = "Cantarel";
      package = pkgs.cantarell-fonts;
      size = 11;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
      #package = pkgs.qogir-icon-theme;
      #name = "Qogir";
      #package = pkgs.pop-icon-theme;
      #name = "Pop";
      #package = pkgs.whitesur-icon-theme;
      #name = "WhiteSur";
    };
    theme = {
      # package = pkgs.qogir-theme;
      # name = "Qogir";
      # name = "Qogir-Dark";
      # package = pkgs.whitesur-gtk-theme;
      # name = "WhiteSur-dark";
      # name = "WhiteSur";
      package = pkgs.arc-theme;
      name = "Arc";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/shell/extensions/user-theme" = {
        name = "Arc";
      };
    };
  };
}
