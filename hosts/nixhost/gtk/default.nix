{pkgs, ...}:
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
      # };
    };
  };

  gtk.enable = true;

  gtk.font.name = "Sans Regular";
  gtk.font.size = 10;
  
  # gtk.cursorTheme.package = pkgs.capitaine-cursors;
  # gtk.cursorTheme.name =  "capitaine-cursors-white"; 
  # gtk.cursorTheme.size = 24;
  #
  # home.pointerCursor.package = pkgs.capitaine-cursors;
  # home.pointerCursor.name = "capitaine-cursors-white";
  # home.pointerCursor.size = 24;
  # home.pointerCursor.x11.defaultCursor = "capitaine-cursors-white";

  gtk.cursorTheme.package = pkgs.whitesur-cursors;
  gtk.cursorTheme.name =  "WhiteSur-cursors"; 
  gtk.cursorTheme.size = 24;

  home.pointerCursor.package = pkgs.whitesur-cursors;
  home.pointerCursor.name = "WhiteSur-cursors";
  home.pointerCursor.size = 24;
  home.pointerCursor.x11.defaultCursor = "WhiteSur-cursors";

  xsession.enable = true;

  home.pointerCursor.x11.enable = true;
  
  # gtk.iconTheme.package = pkgs.whitesur-icon-theme;
  # gtk.iconTheme.name = "WhiteSur-dark";
  # gtk.theme.package = pkgs.whitesur-gtk-theme;
  gtk.theme.name = "WhiteSur-Dark" ;

  # gtk.iconTheme.name = "Papirus";
  gtk.iconTheme.name = "Marwaita-Dark-Blue";
  # gtk.iconTheme.package = pkgs.dracula-icon-theme;
  # gtk.iconTheme.name = "Dracula";
  
  gtk.gtk3.extraConfig = {
        gtk-dialogs-use-header=false;
        gtk-cursor-theme-size=0;
        gtk-toolbar-style="GTK_TOOLBAR_BOTH_HORIZ";
        gtk-toolbar-icon-size="GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images=0;
        gtk-menu-images=0;
        gtk-enable-event-sounds=0;
        gtk-enable-input-feedback-sounds=1;
        gtk-xft-antialias=1;
        gtk-xft-hinting=1;
        gtk-xft-hintstyle="hintslight";
        gtk-xft-rgba="none";
        gtk-application-prefer-dark-theme=1;
	};

  gtk.gtk4.extraConfig = {
        gtk-application-prefer-dark-theme=1;
	};
}
