{config, pkgs, ...}:

{
  gtk = {
    enable = true;
    font = {
      name = "Cantarell";
      package = pkgs.cantarell-fonts;
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
      #package = pkgs.qogir-theme;
      #name = "Qogir";
      #package = pkgs.whitesur-gtk-theme;
      #name = "WhiteSur-dark";
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
    };
  };
}
