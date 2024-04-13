{ config, pkgs, ... }:

{
  imports = [
   ./zsh/default.nix
   ./dunst/default.nix
   ./sway/default.nix
   ./waybar/default.nix
   ./tmux/default.nix
   ./neovim/default.nix
   ./helix/default.nix
   ./emacs/default.nix
   ./st/default.nix
   ./gtk/default.nix
   ./kitty/default.nix
   ./mpv/default.nix
  ];

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.username = "nix";
  home.homeDirectory = "/home/nix";

  home.stateVersion = "23.11"; 
  home.packages = (with pkgs; [

  dmenu
  feh
  lxappearance

  acpi
  copyq
  corefonts # we need windows fonts on libreoffice
  easyeffects
  ffmpeg # for mpv
  ffmpegthumbnailer
  firefox
  gcc
  gimp
  git
  gnumake
  gparted
  hugo
  imagemagick
  inkscape
  keepassxc
  killall
  luajit
  neofetch
  networkmanagerapplet
  ntfs3g
  pdfarranger
  picom
  pulseaudio
  pulseaudio-ctl
  rclone
  rclone-browser
  rofi-wayland
  scrot
  sqlitebrowser
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
  fd #find yang lebih mudah, ketik fd --type query
  bottom #top yang lebih cantik, ketik btm

  #web development
  bun
  deno
  nodejs
  turso-cli
  sqlite

  #themes
  qogir-theme
  arc-theme
  nordic
  whitesur-gtk-theme
  
  #icon themes
  papirus-icon-theme
  qogir-icon-theme
  whitesur-icon-theme
  pop-icon-theme
  dracula-icon-theme
  fluent-icon-theme

  # install via: nix profile install 
  # nixpkgs#onlyoffice-bin
  # nixpkgs#libreoffice
  # nixpkgs#vscodium
  # nixpkgs#simplescreenrecorder
  # nixpkgs#darktable
  # nixpkgs#brave
  # nixpkgs#kdenlive
  # nixpkgs#tdesktop
  # nixpkgs#appimage-run #jalankan di terminal dengan command appimage-run $namafile.appimage

  # sway neededs app
  clipman
  slurp 
  grim grimblast jq socat
  wlogout 


]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
  ]);

  services.copyq = {
    enable = true;
    systemdTarget = "sway-session.target";
  };

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
  programs.home-manager.enable = true;
}
