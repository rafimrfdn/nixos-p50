{ config, pkgs, ...}: 

{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      #menu = "wofi";
      #terminal = default.terminal.name;
      modifier = "Mod4";
      terminal = "kitty";
      bars = [];

      gaps = {
        smartBorders = "on";
        outer = 0;
        inner = 5;
      };

      # startup = [{command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY";}];
       # startup = [{command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK";}];
        startup = [{
            command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK && waybar";
            }];

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
    #   exec ${pkgs.xorg.xprop}/bin/xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2

    bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
    bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
    bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
    bindsym XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    bindsym XF86MonBrightnessDown exec light -U 2
    bindsym XF86MonBrightnessUp exec light -A 2
    bindsym XF86AudioPlay exec playerctl play-pause
    bindsym XF86AudioNext exec playerctl next
    bindsym XF86AudioPrev exec playerctl previous

       '';

    wrapperFeatures.gtk = true;
  };
}
