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
  nodejs
  ntfs3g
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
  ripgrep
  bat
  lsd
  exa
  xcp
  zoxide
  du-dust
  fd
  procs
  bottom
  broot
  monolith
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
