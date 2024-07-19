{ config, pkgs, lib, ...}: 

# let
# modifier = config.wayland.windowManager.sway.config.modifier;
# in lib.mkDefault
{
    wayland.windowManager.sway = {
      systemd.enable = true; # for copyq service. read appendix
        enable = true;
        checkConfig = false; #default is true, set this to false because of failed to build background config
        config = {
            modifier = "Mod4";
            bars = [{
                # fonts.size = 15.0;
                command = "waybar"; #You can change it if you want
                # position = "bottom";
            }];

            gaps = {
                smartBorders = "on";
                outer = 0;
                inner = 0;
            };

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

            
        };

        extraSessionCommands = ''
            export SDL_VIDEODRIVER="wayland"
            export QT_QPA_PLATFORM="wayland"
            export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
            export _JAVA_AWT_WM_NONREPARENTING="1"
            export MOZ_ENABLE_WAYLAND="1"

            export CLUTTER_BACKEND="wayland"
            # export GTK_THEME="Adwaita-dark"
            # export GTK_THEME="Arc-Dark"
            # export GTK_THEME="Nordic"
            # export GTK_THEME="Qogir-Dark"
            # export GTK_THEME="WhiteSur-Dark-solid"
            export GTK_THEME="WhiteSur-Dark"
            # export GTK_THEME="Orchis-Dark"
            # export GTK_THEME="Pop-dark"
            # export GTK_THEME="Mojave-Dark"
            # export GTK_THEME="Dracula"
            # export GTK_THEME="Fluent-Dark-compact"
            # export GTK_THEME="Fluent-Dark"
            # export GTK_THEME="Graphite-Dark"
            export GDK_BACKEND="wayland,x11"

            export XDG_CURRENT_DESKTOP="sway"
            export XDG_SESSION_DESKTOP="sway"
            export XDG_SESSION_TYPE="wayland"

            export NIXOS_OZONE_WL="1"
            '';

        extraConfig = ''
              ${builtins.readFile ./config}
          '';

        wrapperFeatures.gtk = true;
    };
}
