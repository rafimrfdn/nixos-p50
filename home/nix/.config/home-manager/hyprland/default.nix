{ config, pkgs, ... }:

# let
#   flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
#
#   hyprland = (import flake-compat {
#     #src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/releases/download/v0.24.1/source-v0.24.1.tar.gz";
#     src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
#   }).defaultNix;
# in {
#   imports = [
#     hyprland.homeManagerModules.default
#   ];

{

  home.packages = with pkgs; [
    wofi swaybg wlsunset 
    wl-clipboard 
    wf-recorder
    clipman
    slurp sway-contrib.grimshot jq socat
    wlogout swaylock
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
    # My HYPRLAND Configuration
    monitor=eDP-1,1920x1080@60.05200,0x0,1

    # For screen sharing 
    #exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY SWAYSOCK 
    #exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

    #exec-once=dbus-update-activation-environment --systemd DISPLAY _WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP SWAYSOCK _XDG_CURRENT_SESSION

    # exec-once = xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
    # exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 1

    exec-once=waybar
    #exec-once = conky -c $HOME/.config/conky/conky.conf &> /dev/null &
    
    # Set clipman as Clipboard, dont forget to set the environment variable
    exec-once = wl-paste -t text --watch clipman store --no-persist

    # exec-once = swaybg -m fill -i ~/Pictures/wp/xp.jpg
    # exec-once=swaymsg output "*" bg ~/Pictures/wp/* fill
    exec-once = sh ~/.scripts/different-wp.sh

    # Set your Xrate setting in here 
    input {
      # Remap Capslock -> Esc for Vim users  
      #kb_options=caps:escape
      repeat_rate=50
      repeat_delay=300
    
      touchpad {
        disable_while_typing=1
        natural_scroll=0
        clickfinger_behavior=1
        middle_button_emulation=0
        tap-to-click=1
      }
    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

#    windowrule = noborder,conky
#    windowrule = center,conky
#    windowrule = float,conky
#    windowrule = nofocus,conky
#    windowrule = opacity 0.5,conky
#    windowrule = workspace 1 silent,^(conky)$
#    windowrulev2 = pin,class:^(conky)$
#
#    layerrule = ignorezero,notifications
#    layerrule = ignorezero, ^(gtk-layer-shell)$


   # This will activate gesture so you can switch between workspace like Gnome 42 or MacOS  
    gestures { 
      workspace_swipe=true 
      workspace_swipe_min_speed_to_force=5
    }

    #Set gaps between window
      general {
        gaps_in = 5
        gaps_out = 5
        border_size = 1
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
        layout = dwindle # master|dwindle 
      }

    decoration {
      rounding = 5
      drop_shadow= true
      shadow_range= 4
      inactive_opacity = 0.75
      col.shadow=0x66000000
    }

    animations {
        enabled=1
        bezier=overshot,0.13,0.99,0.29,1.1
        animation=windows,1,4,overshot,slide
        animation=fade,1,10,default
        animation=workspaces,1,8.8,overshot,slide
        animation=border,1,14,default
    }
    
    dwindle {
        pseudotile=1 # enable pseudotiling on dwindle
        force_split=0
        no_gaps_when_only = true
    }
    
    # set only gaps if only more than 1 window opened
    master {
      new_on_top=true
      no_gaps_when_only = true
    }
    
    misc {
      disable_hyprland_logo=true
      disable_splash_rendering=true
      mouse_move_enables_dpms=true
      vfr = true
      hide_cursor_on_touch = true
    }

    bindm = SUPER, mouse:272, movewindow
    bindm = SUPER, mouse:273, resizewindow

    # Keybind for launch apps
    bind = SUPERSHIFT, Return, exec, kitty
    bind = SUPERSHIFT, E, exec, emacs
    bind = SUPER, E, exec, nemo
    bind = SUPER, D, exec, wofi --show drun -I
    bind = SUPER, P, exec, wofi --show run
    bind = SUPER, W, exec, firefox
    # bind = SUPER, Q, exec, ~/.scripts/powermenu.sh
    bind = SUPERSHIFT, Q, exec, pkill wlogout || wlogout 
    bind = SUPER, N, exec, kitty -e ~/.scripts/notetaker.sh
    bind = SUPER, O, pseudo, # dwindle

    bind = ,Print,exec, grimshot save active
    bind = SHIFT,Print,exec, grimshot save area
    bind = CTRL,Print,exec, grimshot save window

    #exec-once=eww daemon
    #exec-once=eww open bar

    bind=SUPER,V,togglefloating,
    bind=SUPER,F,fullscreen,0

    bind= SUPER, g, togglegroup
    bind= SUPER, tab, changegroupactive

    bind = SUPER, h, movefocus, l
    bind = SUPER, l, movefocus, r
    bind = SUPER, j, movefocus, u
    bind = SUPER, k, movefocus, d

    bind = SUPER CTRL, left, resizeactive, -20 0
    bind = SUPER CTRL, right, resizeactive, 20 0
    bind = SUPER CTRL, up, resizeactive, 0 -20
    bind = SUPER CTRL, down, resizeactive, 0 20


    bind=SUPERSHIFT,C,killactive

    bind=SUPERSHIFT,h,movewindow,l
    bind=SUPERSHIFT,l,movewindow,r
    bind=SUPERSHIFT,k,movewindow,u
    bind=SUPERSHIFT,j,movewindow,d

    bind=SUPER,1,workspace,1
    bind=SUPER,2,workspace,2
    bind=SUPER,3,workspace,3
    bind=SUPER,4,workspace,4
    bind=SUPER,5,workspace,5
    bind=SUPER,6,workspace,6
    bind=SUPER,7,workspace,7
    bind=SUPER,8,workspace,8
    bind=SUPER,9,workspace,9

    bind=SUPERSHIFT,1,movetoworkspacesilent,1
    bind=SUPERSHIFT,2,movetoworkspacesilent,2
    bind=SUPERSHIFT,3,movetoworkspacesilent,3
    bind=SUPERSHIFT,4,movetoworkspacesilent,4
    bind=SUPERSHIFT,5,movetoworkspacesilent,5
    bind=SUPERSHIFT,6,movetoworkspacesilent,6
    bind=SUPERSHIFT,7,movetoworkspacesilent,7
    bind=SUPERSHIFT,8,movetoworkspacesilent,8
    bind=SUPERSHIFT,9,movetoworkspacesilent,9

    #bind=ALT,R,submap,resize
    #submap=resize
    #binde=,right,resizeactive,15 0
    #binde=,left,resizeactive,-15 0
    #binde=,up,resizeactive,0 -15
    #binde=,down,resizeactive,0 15
    #binde=,l,resizeactive,15 0
    #binde=,h,resizeactive,-15 0
    #binde=,k,resizeactive,0 -15
    #binde=,j,resizeactive,0 15
    #bind=,escape,submap,reset 
    #submap=reset

#    bind=CTRL SHIFT, left, resizeactive,-15 0
#    bind=CTRL SHIFT, right, resizeactive,15 0
#    bind=CTRL SHIFT, up, resizeactive,0 -15
#    bind=CTRL SHIFT, down, resizeactive,0 15
#    bind=CTRL SHIFT, l, resizeactive, 15 0
#    bind=CTRL SHIFT, h, resizeactive,-15 0
#    bind=CTRL SHIFT, k, resizeactive, 0 -15
#    bind=CTRL SHIFT, j, resizeactive, 0 15

    bind=,XF86MonBrightnessUp,exec, light -A 2
    bind=,XF86MonBrightnessDown,exec, light -U 2

    bind=,XF86AudioRaiseVolume,exec,pactl set-sink-volume 0 +5%
    bind=,XF86AudioLowerVolume,exec,pactl set-sink-volume 0 -5%
    bind=,XF86AudioMute,exec,pactl set-sink-mute toggle 

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
  };

#programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [wlrobs];

# fake a tray to let apps start
# https://github.com/nix-community/home-manager/issues/2064
#  systemd.user.targets.tray = {
#    Unit = {
#      Description = "Home Manager System Tray";
#      Requires = ["graphical-session-pre.target"];
#    };
#  };

}
