{ config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the
# paths it should manage.
home.username = "nix";
home.homeDirectory = "/home/nix";

home.packages = with pkgs; [
  alacritty
  arandr
  autorandr
  arc-theme
  acpi
  copyq
  elementary-xfce-icon-theme
  feh
  firefox
  flameshot 
  font-awesome
  gimp
  git
  hugo
  inkscape
  keepassxc
  killall
  libreoffice
  luajit
  lxappearance
  mpv
  neofetch
  neovim

  #nodejs
  deno

  ntfs3g
  obs-studio
  onlyoffice-bin
  papirus-icon-theme
  pulseaudio
  pulseaudio-ctl
  picom
  pipes
  qogir-icon-theme
  qogir-theme
  rclone
  rclone-browser
  rofi
  scrot
  tdesktop
  tree
  unzip
  virt-manager
  volumeicon
  vscodium
  wget
  xclip
  xorg.xev
  yarn
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
];

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
home.stateVersion = "22.05";

# Let Home Manager install and manage itself.
programs.home-manager.enable = true;

}
