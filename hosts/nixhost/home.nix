{ config, pkgs, ... }:

{
  home.username = "nix";
  home.homeDirectory = "/home/nix";


  imports = [
   ./zsh/default.nix
   ./sway/default.nix
   ./waybar/default.nix
   ./tmux/default.nix
   ./gtk/default.nix
   ./kitty/default.nix
  ];

  # Enable Home Manager Packages
    home.packages = (with pkgs; [
        dmenu
        feh
        xclip #must install to activate clipboard on DWM session
        lxappearance

        acpi
        corefonts # we need windows fonts on libreoffice
        ffmpeg # for mpv
        ffmpegthumbnailer
        file-roller
        git
        gnumake
        gparted
        imagemagick
        keepassxc
        killall
        lazygit

        luajit
        neofetch
        # neovim
        networkmanagerapplet
        nodejs_23
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
        # xarchiver #for pcmanfm extractor
        xdg-user-dirs # manage well known user directories
        xdg-utils 
        zip

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

        swaybg  #for background and wallpaper switch script
        wl-clipboard # I need this also for screenshot
        slurp 
        grim grimblast jq socat #this is must have for screenshot
        wlogout 
        mako #for notification
        # swaylock
        # # swayimg #image viewer for sway/wayland
        # # imv #this also image viewer
        # swww


    ]);

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
    };

  services.copyq = {
    enable = true;
    systemdTarget = "sway-session.target";
  };

  # Set up Git
  # programs.git = {
  #   enable = true;
  #   userName = "My Name";
  #   userEmail = "myemail@example.com";
  # };

  # Enable Zsh and Oh My Zsh
  # programs.zsh.enable = true;
  # programs.oh-my-zsh = {
  #   enable = true;
  #   theme = "agnoster";  # Change to "powerlevel11k" if preferred
  #   plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
  # };

  # Configure Kitty Terminal
  # programs.kitty = {
  #   enable = true;
  #   # font.name = "JetBrainsMono Nerd Font";
  #   # font.size = 12;
  # };

  # Enable Waybar
  # programs.waybar.enable = true;

  # Enable MPV Configuration
  # programs.mpv.enable = true;

  # Import application-specific configurations
  # imports = [
  #   ./kitty.nix
  #   ./zsh.nix
  #   ./waybar.nix
  # ];

  # Set environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Define Home Manager state version
  home.stateVersion = "23.11";
}
