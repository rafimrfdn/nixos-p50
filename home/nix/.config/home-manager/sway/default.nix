{ config, pkgs, ...}: 

{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      #menu = "wofi";
      #terminal = default.terminal.name;
      modifier = "Mod4";
      bars = [];

      gaps = {
        smartBorders = "on";
        outer = 5;
        inner = 5;
      };

      startup = [{command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY";}];

      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
        "type:touchpad" = {
          middle_emulation = "enabled";
          natural_scroll = "enabled";
          tap = "enabled";
        };
      };
#      output."*".bg = "~/.config/wallpaper.png fill";
    };

    extraConfig = ''
      exec ${pkgs.xorg.xprop}/bin/xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
      '';

    wrapperFeatures.gtk = true;
  };
}
