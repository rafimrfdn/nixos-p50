{ config, pkgs, lib, ...}: 

let
modifier = config.wayland.windowManager.sway.config.modifier;
in lib.mkDefault

{
    wayland.windowManager.sway = {
        enable = true;
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

            keybindings = {
                # "${modifier}+Shift+Return" = "exec $term";
                # "${modifier}+Shift+c" = "kill";
                # "${modifier}+Shift+q" = "exec wlogout";
                # "${modifier}+d" = "exec $menu";
                # "${modifier}+w" = "exec firefox";
                # "${modifier}+e" = "exec nautilus";
                # "${modifier}+n" = "kitty -e ~/.scripts/notetaker.sh";
                
                # Moving around:
                "${modifier}+Left" = "focus left";
                "${modifier}+Down" = "focus down";
                "${modifier}+Up" = "focus up";
                "${modifier}+Right" = "focus right";
                # or Moving around:
                "${modifier}+$left" = "focus left";
                "${modifier}+$down" = "focus down";
                "${modifier}+$up" = "focus up";
                "${modifier}+$right" = "focus right";

                # Move the focused window with the same, but add Shift
                "${modifier}+Shift+Left" = "move left";
                "${modifier}+Shift+Down" = "move down";
                "${modifier}+Shift+Up" = "move up";
                "${modifier}+Shift+Right" = "move right";
                # or Move the focused window with the same, but add Shift
                "${modifier}+Shift+$left" = "move left";
                "${modifier}+Shift+$down" = "move down";
                "${modifier}+Shift+$up" = "move up";
                "${modifier}+Shift+$right" = "move right";

                # Workspaces:    
                # Switch to workspace
                "${modifier}+1" = "workspace number 1";
                "${modifier}+2" = "workspace number 2";
                "${modifier}+3" = "workspace number 3";
                "${modifier}+4" = "workspace number 4";
                "${modifier}+5" = "workspace number 5";
                "${modifier}+6" = "workspace number 6";
                "${modifier}+7" = "workspace number 7";
                "${modifier}+8" = "workspace number 8";
                "${modifier}+9" = "workspace number 9";
                # Move focused container to workspace
                "${modifier}+Shift+1" = "move container to workspace number 1";
                "${modifier}+Shift+2" = "move container to workspace number 2";
                "${modifier}+Shift+3" = "move container to workspace number 3";
                "${modifier}+Shift+4" = "move container to workspace number 4";
                "${modifier}+Shift+5" = "move container to workspace number 5";
                "${modifier}+Shift+6" = "move container to workspace number 6";
                "${modifier}+Shift+7" = "move container to workspace number 7";
                "${modifier}+Shift+8" = "move container to workspace number 8";
                "${modifier}+Shift+9" = "move container to workspace number 9";

            };
        };

        extraSessionCommands = ''
            export SDL_VIDEODRIVER="wayland"
            export QT_QPA_PLATFORM="wayland"
            export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
            export _JAVA_AWT_WM_NONREPARENTING="1"
            export MOZ_ENABLE_WAYLAND="1"

            export CLUTTER_BACKEND="wayland"
            # export GTK_THEME="Arc-Dark"
            # export GTK_THEME="Qogir-Dark"
            # export GTK_THEME="WhiteSur-Dark"
            export GTK_THEME="Orchis-Dark"
            export GDK_BACKEND="wayland,x11"
            '';

        # set beginning config
        extraConfigEarly = ''
            ${builtins.readFile ./config-early}
        '';

        # set config after keybind
        extraConfig = ''
            ${builtins.readFile ./config-after}
        '';

        # extraConfig = ''
        #       ${builtins.readFile ./config}
        #   '';

        wrapperFeatures.gtk = true;
    };
}
