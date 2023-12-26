{ config, pkgs, ...}: 

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [{
          # fonts.size = 15.0;
          # command = "waybar"; #You can change it if you want
          position = "bottom";
      }];


      gaps = {
        smartBorders = "on";
        outer = 0;
        inner = 0;
      };

        startup = [{
            command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK && waybar";
            # command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK";
            }];

      input = {
        "type:keyboard" = {
            repeat_delay = "300";
            repeat_rate = "50";
        };
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
        "type:touchpad" = {
          middle_emulation = "enabled";
          natural_scroll = "disabled";
          tap = "enabled";
        };
      };
    };

    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';

     extraConfig = ''
          ${builtins.readFile ./config}
       '';

    wrapperFeatures.gtk = true;
  };
}
