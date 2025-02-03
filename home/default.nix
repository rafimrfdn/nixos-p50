{ config, pkgs, ... }:

{
  imports = [
   ./zsh/default.nix
   ./dunst/default.nix
   ./sway/default.nix
   # ./hyprland/default.nix
   ./waybar/default.nix
   ./tmux/default.nix
   ./neovim/default.nix
   ./helix/default.nix
   ./emacs/default.nix
   # ./st/default.nix
   ./gtk/default.nix
   ./kitty/default.nix
   ./mpv/default.nix
   # ./chromium.nix
  ];

  fonts.fontconfig.enable = true;


    xdg = {
        enable = true;
        userDirs = {
            enable = true;
            createDirectories = true;
        };
        portal = {
            enable = true;
            configPackages = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
                xdg-desktop-portal-wlr
            ];
            extraPortals = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
                xdg-desktop-portal-wlr
            ];
            config = {
                common = {
                    default = [ "*" ];
                };
            };
        };
        # mimieapps
        mime.enable = true;
        # mimeApps = {
        #     enable = true;
        #     # associations.added = {
        #     #     "application/pdf" = [ "com.github.jeromerobert.pdfarranger.desktop"];
        #     #     "image/png"       = [ "org.gnome.eog.desktop"  ];
        #     #     "image/jpg"       = [ "org.gnome.eog.desktop"  ];
        #     #     "image/jpeg"      = [ "org.gnome.eog.desktop"  ];
        #     #     "image/webp"      = [ "org.gnome.eog.desktop"  ];
        #     #     "video/*"         = [ "mpv.desktop"            ];
        #     # };
        #
        #     defaultApplications = {
        #         "text/markdown"     = "nvim.desktop";
        #         "text/plain"        = "nvim.desktop";
        #         "application/pdf"   = [ "com.github.jeromerobert.pdfarranger.desktop"];
        #         "image/png"         = [ "org.gnome.eog.desktop"  ];
        #         "image/jpg"         = [ "org.gnome.eog.desktop"  ];
        #         "image/jpeg"        = [ "org.gnome.eog.desktop"  ];
        #         "image/webp"        = [ "org.gnome.eog.desktop"  ];
        #         "video/*"           = [ "mpv.desktop"            ];
        #     };
        #     # associations.removed = {
        #     #   "application/pdf" = [ "wine*" ];
        #     #   "image/*"         = [ "wine*" ];
        #     #   "video/*"         = [ "wine*" ];
        #     # };
        # };



  };




  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  # home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  # ];


  home.packages = (with pkgs; [
  #elementary-xfce-icon-theme
  #lf
  #rofi
  #xfce.thunar
  # arandr
  # autorandr
  # cinnamon.nemo-with-extensions
  # cinnamon.nemo
  # cinnamon.pix
  # conky
  dmenu
  feh
  # flameshot
  #font-awesome
  # gnome.file-roller #archive manager for nemo
  #kitty
  # mpv
  #vapoursynth-mvtools
  #mpvScripts.quality-menu
  # pcmanfm
  #pipes #run with pipes.sh
  # virt-manager
  xclip #must install to activate clipboard on DWM session
  # xdg-desktop-portal-wlr
  # xdg-desktop-portal-hyprland
  #xorg.xev
  #yt-dlp
  #lsd #ls yang menampilkan icon, ketik lsd
  #xcp
  #zoxide
  #du-dust #du yang lebih cantik, ketik dust
  #procs #ps yang lebih modern, ketik ps
  #broot #cd ala vim, ketik broot
  #monolith #save single page ke satu halaman html
  # open-fonts 
  lxappearance

  acpi
  # copyq
  corefonts # we need windows fonts on libreoffice
  # dwm-status
  # easyeffects
  # eog
  ffmpeg # for mpv
  ffmpegthumbnailer
  # freeoffice
  # firefox
  # firefox-esr
  # gcc
  # gimp
  git
  gnumake
  gparted
  # hugo
  imagemagick
  # inkscape
  keepassxc
  killall
  lazygit
  
  luajit
  # lutris
  # nautilus
  neofetch
  networkmanagerapplet
  ntfs3g
    pavucontrol
  pcmanfm
  pdfarranger
  picom
  pulseaudio
  pulseaudio-ctl
  rclone
  rclone-browser
  rofi-wayland
  scrot
  
  svp
  xfce.thunar
  tree
  unzip
  volumeicon
  wget
  wofi
  xarchiver #for pcmanfm extractor
  xdg-user-dirs # manage well known user directories
  xdg-utils 
  zip
  #zsh-autosuggestions

  ripgrep #untuk Telescope neovim
  bat #cat yang lebih cantik, ketik bat namafile
  eza #ls lebih rapih, ketik exa #diganti menjadi eza
  fd #find yang lebih mudah, ketik fd --type query, juga dibutuhakah oleh nvim kickstart
  bottom #top yang lebih cantik, ketik btm

  #web development
  sqlite
  sqlitebrowser
  rlwrap #so I can navigate using arrow key when enter to sqlite console. launch sqlite with command "rlwrap sqlite3"

  #themes
  qogir-theme
  arc-theme
  nordic
  whitesur-gtk-theme
  
  #icon themes
  # papirus-icon-theme
  qogir-icon-theme
  whitesur-icon-theme
  pop-icon-theme
  dracula-icon-theme
  fluent-icon-theme
  marwaita-icons #only can find on the unstable branch

  # install via nix profile install nixpkgs#pkgname
  # then view list installed package via nix profile list
  # onlyoffice-bin
  # chromium
  # libreoffice
  # vscodium
  # simplescreenrecorder
  # darktable
  # brave
  # kdenlive
  # tdesktop
  # appimage-run #jalankan di terminal dengan command appimage-run $namafile.appimage
  # bun
  # deno
  # nodejs
  # turso-cli
  # gimp
  # firefox-esr
  # hugo

  # Hyprland needed apps
  # xdg-desktop-portal-hyprland
  # wlsunset 
  # wf-recorder
  # clipman
  swaybg  #for background and wallpaper switch script
  wl-clipboard # I need this also for screenshot
  slurp 
  grim grimblast jq socat #this is must have for screenshot
  wlogout 
  # swaylock
  # # swayimg #image viewer for sway/wayland
  # # imv #this also image viewer
  # swww


]);
  # because nautilus has moved on toe top-level package
  # ++ (with pkgs.gnome; [ 
  #   nautilus
  #   # zenity
  #   # gnome-tweaks
  #   eog
  # ]);

  services.copyq = {
    enable = true;
    systemdTarget = "sway-session.target";
  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nix/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = false;
}
