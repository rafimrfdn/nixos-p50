{ config, pkgs, ...}: 

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";

      menu = "wofi --show drun";

      bars = [{
          #fonts.size = 15.0;
          command = "waybar"; #You can change it if you want
          #position = "bottom";
      }];


      gaps = {
        smartBorders = "on";
        outer = 0;
        inner = 5;
      };

      # startup = [{command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY";}];
       # startup = [{command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK";}];
        startup = [{
            # command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK && waybar";
            command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK";
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
#      output."*".bg = "~/.config/wallpaper.png fill";

     #  output = {
     #      eDP-1 = {
     #        # Set HIDP scale (pixel integer scaling)
     #        scale = "1";
	    #   };
	    # };

      keybindings = {
          "Mod4+Shift+Return" = "exec kitty";
          "Mod4+Shift+c" = "kill";
          "Mod4+d" = "exec $menu";
          "Mod4+e" = "exec nautilus";

          # "Mod4+Shift+c" = "reload";
          # "Mod4+c" = ''mode "chat"'';
          # "Mod4+r" = ''mode "resize"'';
          # "Mod4+n" = ''exec --no-startup-id "makoctl dismiss"'';
          # "Mod4+Shift+n" = ''exec --no-startup-id "makoctl dismiss --all"'';
          # "Mod4+Print" = ''exec grim -t png -g "$(slurp)" ~/Pictures/$(date +%Y-%m-%d_%H-%m-%s).png'';
          # "Mod4+i" = "exec brillo -U 10";
          # "Mod4+o" = "exec brillo -A 10";
          # "Mod4+z" = "exec emacsclient -nc ~/.config/nixpkgs";
          # "Mod4+Shift+minus" = "move scratchpad";
          # "Mod4+minus" = "scratchpad show";
          #
          # "Mod1+Control+l" = "exec --no-startup-id wlogout";
          #
          # "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          # "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          # "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          # "XF86MonBrightnessDown" = "exec light -A 2";
          # "XF86MonBrightnessUp" = "exec light -U 2";
          # "XF86AudioPlay" = "exec playerctl play-pause";
          # "XF86AudioNext" = "exec playerctl next";
          # "XF86AudioPrev" = "exec playerctl previous";
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

# Logo key. Use Mod1 for Alt.
set $mod Mod4

# Home row direction keys, like vim
set $left h
set $down j
set $up k
set $right l

# Terminal
# set $term kitty

    # bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
    # bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
    # bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
    # bindsym XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    # bindsym XF86MonBrightnessDown exec light -U 2
    # bindsym XF86MonBrightnessUp exec light -A 2
    # bindsym XF86AudioPlay exec playerctl play-pause
    # bindsym XF86AudioNext exec playerctl next
    # bindsym XF86AudioPrev exec playerctl previous

    # bindsym Mod4+Shift+Return exec kitty
    # bindsym Mod4+Shift+E exec emacs
    # bindsym Mod4+E exec nautilus
    # bindsym Mod4+D exec wofi --show drun -I
    # bindsym Mod4+P exec wofi --show run
    # bindsym Mod4+W exec firefox
    # bindsym Mod4+Shift+Q exec pkill wlogout || wlogout 
    bindsym Mod4+N exec kitty -e ~/.scripts/notetaker.sh


       '';

    wrapperFeatures.gtk = true;
  };
}
