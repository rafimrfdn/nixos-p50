{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  nixpkgs.overlays = [
    (self: super: {
      st = super.st.overrideAttrs (oldAttrs: rec {
        patches = [
	./st/st-scrollback-0.8.5.diff
	#./st/st-alpha-20220206-0.8.5.diff
	./st/st-anysize-20220718-baa9357.diff
	./st/st-xresources-20200604-9ba7ecf.diff
	#./st/st-colorschemes-0.8.5.diff
#	./st/st-cyberpunk-neon.diff
	#./st/st-color_schemes.diff
	#./st/st-w3m-0.8.3.diff
        ];
	#configFile = super.writeText "config.h" (builtins.readFile ./st/config.h);
        #postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
      });
    })
  ];

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


