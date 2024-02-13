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
   ./emacs/default.nix
   ./st/default.nix
   ./gtk/default.nix
   ./kitty/default.nix
   ./mpv/default.nix
   # ./nodejs/default.nix
  ];

  home.username = "nix";
  home.homeDirectory = "/home/nix";

  #nixpkgs.config.allowUnfree = true;

  home.packages = (with pkgs; [
  #deno
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
  # feh
  # flameshot
  #font-awesome
  # gnome.file-roller #archive manager for nemo
  #kitty
  #mpv
  #vapoursynth-mvtools
  #mpvScripts.quality-menu
  # pcmanfm
  #pipes #run with pipes.sh
  # virt-manager
  #xclip
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
  #lxappearance


  acpi
  arc-theme
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
  nodejs
  ntfs3g
  papirus-icon-theme
  pdfarranger
  picom
  pulseaudio
  pulseaudio-ctl
  qogir-icon-theme
  qogir-theme
  rclone
  rclone-browser
  rofi-wayland
  scrot
  sqlite
  sqlitebrowser
  tdesktop
  tree
  unzip
  volumeicon
  wget
  wofi
  xarchiver #for pcmanfm extractor
  zip
  #zsh-autosuggestions

  ripgrep #untuk Telescope neovim
  bat #cat yang lebih cantik, ketik bat namafile
  eza #ls lebih rapih, ketik exa #diganti menjadi eza
  fd #find yang lebih mudah, ketik fd --type query
  bottom #top yang lebih cantik, ketik btm

  # install via sudo nix-env -iA nixos.packageName:
  # view list installed via sudo nix-env --query
  #onlyoffice-bin
  #libreoffice
  #vscodium
  #simplescreenrecorder
  #darktable
  #brave
  #kdenlive
  #appimage-run #jalankan di terminal dengan command appimage-run $namafile.appimage

  # Hyprland needed apps
    # xdg-desktop-portal-hyprland
    swaybg 
    wlsunset 
    wl-clipboard 
    wf-recorder
    clipman
    slurp 
    grim grimblast jq socat
    wlogout swaylock
    # swayimg #image viewer for sway/wayland
    # imv #this also image viewer
    swww

]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
    # gedit
  ]);

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
