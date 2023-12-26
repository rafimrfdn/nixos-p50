{ config, lib, pkgs, ... }:

{

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wofi swaybg wlsunset 
    wl-clipboard 
    wf-recorder
    clipman
    slurp grim grimblast jq socat
    wlogout swaylock
    # swayimg #image viewer for sway/wayland
    # imv #this also image viewer
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # systemd.enable = true;
    extraConfig = ''
          ${builtins.readFile ./hyprland.conf}
        '';

  };

# make stuff work on wayland
  home.sessionVariables = {
   _JAVA_AWT_WM_NONREPARENTING = "1";
   MOZ_ENABLE_WAYLAND = "1";
   QT_QPA_PLATFORM = "wayland";
   QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

   GDK_BACKEND="wayland,x11";
   SDL_VIDEODRIVER = "wayland";
   XDG_SESSION_TYPE = "wayland";
   XDG_CURRENT_DESKTOP="Hyprland";
   XDG_SESSION_DESKTOP="Hyprland";

   CLUTTER_BACKEND="wayland";

   # EDITOR = "nvim";
   # BROWSER = "firefox";
   # TERMINAL = "kitty";

   # GBM_BACKEND= "nvidia-drm";
   # __GLX_VENDOR_LIBRARY_NAME= "nvidia";
   # LIBVA_DRIVER_NAME= "nvidia"; # hardware acceleration
   # __GL_VRR_ALLOWED="1";
   # WLR_NO_HARDWARE_CURSORS = "1";
   # WLR_RENDERER_ALLOW_SOFTWARE = "1";
   # CLUTTER_BACKEND = "wayland";
   # WLR_RENDERER = "vulkan";
   #
   # GDK_BACKEND="wayland,x11";
   # SDL_VIDEODRIVER = "wayland";
   # _JAVA_AWT_WM_NONREPARENTING = "1";
   # MOZ_ENABLE_WAYLAND = "1";
   # QT_QPA_PLATFORM = "wayland";
   # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
   #
   # XDG_CURRENT_DESKTOP = "Hyprland";
   # XDG_SESSION_DESKTOP = "Hyprland";
   # XDG_SESSION_TYPE = "wayland";

   # GTK_THEME = "Qogir Dark";
  };

}
