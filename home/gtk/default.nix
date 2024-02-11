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
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
      # name = "Qogir";
      # package = pkgs.qogir-icon-theme;
      #name = "Pop";
      # package = pkgs.pop-icon-theme;
      # name = "WhiteSur";
      # package = pkgs.whitesur-icon-theme;
    };
    theme = {
      # name = "Qogir";
      # name = "Qogir-Dark";
      # package = pkgs.qogir-theme;
      # name = "WhiteSur";
      # name = "WhiteSur-dark";
      # package = pkgs.whitesur-gtk-theme;
      # name = "Arc";
      # package = pkgs.arc-theme;
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
      # name = "Juno";
      # package = pkgs.juno-theme;
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
      # "org/gnome/shell/extensions/user-theme" = {
      #   # name = "Arc";
      #   # name = "Qogir-Dark";
      #   name = "juno";
      # };
    };
  };
}
