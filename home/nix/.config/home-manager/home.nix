{ config, pkgs, ... }:

{
  imports = [
   ./sway/default.nix
   ./hyprland/default.nix
   ./neovim/default.nix
   ./waybar/default.nix
   ./gtk/default.nix
   ./tmux/default.nix
  ];

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

  
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  #deno
  #elementary-xfce-icon-theme
  #lf
  #neovim
  #rofi
  #wayland
  #xfce.thunar
  #xwayland
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
  st
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
  #youtube-dl
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
