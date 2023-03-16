{ config, pkgs, ... }:

let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
in {
  imports = [
    hyprland.homeManagerModules.default
  ];

#}



#{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  nixpkgs.overlays = [
    (self: super: {
      st = super.st.overrideAttrs (oldAttrs: rec {
        patches = [
        ./st/st-scrollback-0.8.5.diff
        ./st/st-font2-0.8.5.diff
        ./st/st-glyph-wide-support-20220411-ef05519.diff
        ./st/st-charoffsets-20220311-0.8.5.diff
        #./st/st-anysize-20220718-baa9357.diff
        ];
        configFile = super.writeText "config.h" (builtins.readFile ./st/config.h);
        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
      });
    })
  ];


 wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures =  { gtk = true; };
     config = rec {
       bars = [ 
         {mode= "hide";}
       ];
       modifier = "Mod4";
       terminal = "st"; 
         startup = [
           {command = "waybar" ;}
         ];
     };
     extraConfig = ''


set $mod Mod4
#
## Home row direction keys, like vim
set $left h
set $down j
set $up k
set $right l
#
## Your preferred terminal emulator
set $term st
#
## Your preferred application launcher
##set $menu dmenu_path | wmenu | xargs swaymsg exec --
#set $menu rofi -show drun
#
#### Output configuration
##
## Default wallpaper (more resolutions are available in @datadir@/backgrounds/sway/)
##output * bg @datadir@/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png fill
output * bg ~/Pictures/wp/win.jpg fill
#
#    # Start a terminal
#    bindsym $mod+Shift+Return exec $term
#
#    # Kill focused window
#    #bindsym $mod+Shift+c kill
#
#
#
#    # Start your launcher
#    bindsym $mod+d exec $menu
#
#    # Drag floating windows by holding down $mod and left mouse button.
#    # Resize them with right mouse button + $mod.
#    # Despite the name, also works for non-floating windows.
#    # Change normal to inverse to use left mouse button for resizing and right
#    # mouse button for dragging.
#    floating_modifier $mod normal
#
#    # Reload the configuration file
#    bindsym $mod+Control+r reload
#
#    # Exit sway (logs you out of your Wayland session)
#    #bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
#
#    bindsym $mod+e exec pcmanfm
#    bindsym $mod+w exec firefox
    
     '';
  };





  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
monitor=eDP-1,1920x1080@60,0x0,1
#monitor=eDP-1,addreserved,0,0,48,0

#exec-once=/nix/store/ddpd8ki6mb5wjhx83ifsizxqqrniwd19-dbus-1.14.4/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP && systemctl --user start hyprland-session.target
exec-once=dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP
#exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user start hyprland-session.target
#exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP 
#exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2

# toolkit-specific scale
env = GDK_SCALE,2
env = XCURSOR_SIZE,32

env=CLUTTER_BACKEND=wayland
env=GDK_BACKEND=wayland,x11

env=XDG_CURRENT_DESKTOP=Hyprland
env=XDG_SESSION_TYPE=wayland
env=XDG_SESSION_DESKTOP=Hyprland

env=GTK_THEME=Adwaita

exec-once=~/.config/hypr/xdg.sh
exec-once=swaybg -i $HOME/Pictures/wp/win11.jpeg
exec-once=waybar
#exec-once=eww daemon
#exec-once=eww open bar
exec-once=dunst

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 5
    border_size = 1
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 5 
    blur = yes
    blur_size = 3
    blur_passes = 1
    blur_new_optimizations = on

    drop_shadow = no
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic mouse V1 {
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod SHIFT, RETURN, exec, st 
bind = $mainMod SHIFT, C, killactive, 
#bind = $mainMod, M, exit, 
bind = $mainMod, E, exec, pcmanfm
bind = $mainMod, Q, exec, ~/.scripts/powermenu.sh
bind = $mainMod, W, exec, firefox
bind = $mainMod, V, togglefloating, 
bind = $mainMod, D, exec, rofi -show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
#bind = $mainMod, left, movefocus, l
#bind = $mainMod, right, movefocus, r
#bind = $mainMod, up, movefocus, u
#bind = $mainMod, down, movefocus, d

bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, J, movefocus, u
bind = $mainMod, K, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

    '';
  };


  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  arandr
  autorandr
  arc-theme
  acpi
  cinnamon.pix
  copyq
  darktable
  easyeffects
  #elementary-xfce-icon-theme
  feh
  ffmpegthumbnailer
  firefox
  flameshot
  font-awesome
  gcc
  gimp
  git
  gnumake
  gparted
  hugo
  imagemagick
  inkscape
  kdenlive
  keepassxc
  killall
  kitty
  #lf
  libreoffice
  luajit
  lxappearance
  mpv
  neofetch
  #neovim
  nodejs
  #deno

  ntfs3g
  onlyoffice-bin
  papirus-icon-theme
  pcmanfm
  pulseaudio
  pulseaudio-ctl
  picom
  pipes #run with pipes.sh
  qogir-icon-theme
  qogir-theme
  rclone
  rclone-browser
  rofi
  simplescreenrecorder
  scrot
  st
  tdesktop
  tree
  unzip
  virt-manager
  volumeicon
  vscodium
  wget
  xarchiver #for pcmanfm extractor
  xclip
  #xfce.thunar
  xorg.xev
  youtube-dl
  zsh-autosuggestions

  #my rust specal apps
  ripgrep #untuk Telescope neovim
  bat #cat yang lebih cantik, ketik bat namafile
  lsd #ls yang menampilkan icon, ketik lsd
  exa #ls lebih rapih, ketik exa
  xcp
  zoxide
  du-dust #du yang lebih cantik, ketik dust
  fd #find yang lebih mudah, ketik fd --type query
  procs #ps yang lebih modern, ketik ps
  bottom #top yang lebih cantik, ketik btm
  broot #cd ala vim, ketik broot
  monolith #save single page ke satu halaman html

  # Sway
  wayland
  swaybg
  swaysome
  wdisplays
  waybar
  xdg-desktop-portal-gnome

  # HYPRLAND
  eww-wayland
];


  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    newSession = true;
    shortcut = "a";
    plugins = [
      pkgs.tmuxPlugins.nord
      pkgs.tmuxPlugins.yank
      pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
    extraConfig = "
      set-option -g status-position top
      
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'
      bind c new-window -c '#{pane_current_path}'

      # Navigasi pakai ctrl+hjkl
      bind -n C-h 'select-pane -L'
      bind -n C-j 'select-pane -D'
      bind -n C-k 'select-pane -U'
      bind -n C-l 'select-pane -R'
    ";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}



