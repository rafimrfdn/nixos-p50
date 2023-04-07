{ config, pkgs, ... }:

{
  imports = [
   ./sway/default.nix
   ./hyprland/default.nix
   ./neovim/default.nix
   ./waybar/default.nix
   ./gtk/default.nix
   ./tmux/default.nix
   ./st/default.nix
  ];

  
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  #deno
  #elementary-xfce-icon-theme
  #lf
  #rofi
  #xfce.thunar
  acpi
  arandr
  arc-theme
  autorandr
  cinnamon.nemo
  cinnamon.pix
  copyq
  darktable
  easyeffects
  feh
  ffmpeg # for mpv
  ffmpegthumbnailer
  firefox
  flameshot
  #font-awesome
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
  libreoffice
  luajit
  lxappearance
  mpv
  mpvScripts.youtube-quality
  neofetch
  nodejs
  ntfs3g
  onlyoffice-bin
  papirus-icon-theme
  pcmanfm
  picom
  pipes #run with pipes.sh
  pulseaudio
  pulseaudio-ctl
  qogir-icon-theme
  qogir-theme
  rclone
  rclone-browser
  rofi-wayland
  scrot
  simplescreenrecorder
  tdesktop
  tree
  unzip
  virt-manager
  volumeicon
  vscodium
  wget
  wofi
  xarchiver #for pcmanfm extractor
  xclip
  xdg-desktop-portal-wlr
  xorg.xev
  yt-dlp
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

];

  home.stateVersion = "22.11";

  programs.home-manager.enable = true;
}
