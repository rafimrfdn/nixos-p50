{config, pkgs, ...}:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      # "org/gnome/shell/extensions/user-theme" = {
        # name = "Arc";
        # name = "Qogir-Dark";
        # name = "Nordic";
        # name = "Pop";
        # name = "Adapta";
        # name = "Juno";
      # };
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "Sans Regular";
      # name = "SF Pro Display Regular";
      # name = "Cantarel";
      # package = pkgs.cantarell-fonts;
      size = 10;
    };
    theme = {
      # name = "Qogir";
      # name = "Qogir-Dark";
      # package = pkgs.qogir-theme;
      # name = "WhiteSur";
      # name = "WhiteSur-dark";
      # package = pkgs.whitesur-gtk-theme;
      # name = "Pop";
      # name = "Pop-dark";
      # package = pkgs.pop-gtk-theme;
      # name = "Elementary";
      # package = pkgs.pantheon.elementary-gtk-theme;
      # name = "Arc-Darker"; # or Arc || Arc-Dark || Arc-Darker || Arc-Lighter
      # package = pkgs.arc-theme;
      # name = "Orchis-Dark";
      # package = pkgs.orchis-theme;
      # name = "Nordic";
      # package = pkgs.nordic;
      # name = "Juno";
      # package = pkgs.juno-theme;
      # name = "Adapta";
      # package = pkgs.adapta-gtk-theme;
      # name = "Mojave-Light"; # or Mojave-Light-alt || Mojave-Light-solid || Mojave-Light-solid-alt
      # name = "Mojave-Dark"; # or Mojave-Dark-alt || Mojave-Dark-solid || Mojave-Dark-solid-alt
      # package = pkgs.mojave-gtk-theme;
      name = "NumixStandard"; # or NumixStandard || NumixSolarizedDarkBlue etc
      # package = pkgs.numix-solarized-gtk-theme;
    };
    iconTheme = {
      # name = "Papirus-Dark";
      # package = pkgs.papirus-icon-theme;
      # name = "Qogir";
      # package = pkgs.qogir-icon-theme;
      # name = "Pop-dark";
      # package = pkgs.pop-icon-theme;
      # name = "Elementary";
      # package = pkgs.pantheon.elementary-icon-theme;
      # name = "WhiteSur";
      # name = "WhiteSur-dark";
      # package = pkgs.whitesur-icon-theme;
      # name = "Newaita-dark"; # or Newaita-bluish
      name = "Papirus-Dark"; # or Papirus
    };
    cursorTheme = {
      name = "Pop";
      # package = pkgs.pop-gtk-theme;
    };
    gtk3.extraConfig = {
      # gtk-application-prefer-dark-theme = true;
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      # gtk-application-prefer-dark-theme = true;
      gtk-application-prefer-dark-theme=1;
    };
  };
}
