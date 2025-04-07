{config, pkgs, ... }:
 {
	#enable flatpaks
 # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 # xdg.portal.config.common.default = "gtk";
 # xdg.portal.enable =true ;
 # services.flatpak.enable = true;
  programs.nix-ld.enable = true;
 # programs.nix-ld.libraries = with pkgs; [
 #   # Add any missing dynamic libraries for unpackaged programs
 #   # here, NOT in environment.systemPackages
 #   fuse
 #   glibc
 # ];

    # programs.zsh.enable = true;
    # programs.zsh.autosuggestions.enable = true;
    programs.bash.completion.enable = true;



  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: with pkgs; {
  };
};

  environment.systemPackages = with pkgs; [
    acpi
    alsa-utils
    bat #cat yang lebih cantik, ketik bat namafile
    bluez
    bluez-tools
    bottom #top yang lebih cantik, ketik btm
    brightnessctl
    cargo
    cava
    cmake
    corefonts # we need windows fonts on libreoffice
    cowsay
    dmenu
    dunst
    eza #ls lebih rapih, ketik exa #diganti menjadi eza
    fd #find yang lebih mudah, ketik fd --type query, juga dibutuhakah oleh nvim kickstart
    feh
    ffmpeg # for mpv
    ffmpegthumbnailer
    firefox
    font-manager
    fortune
    fuzzel
    gcc
    gimp
    git
    glib
    gnumake
    go
    gparted
    grim grimblast jq socat #this is must have for screenshot
    gromit-mpx
    imagemagick
    imv
    kdePackages.qtsvg
    keepassxc
    killall
    kitty
    lazygit
    light
    luajit
    lux
    mako
    mediainfo
    nautilus
    neofetch
    networkmanagerapplet
    nix-index
    nodejs
    ntfs3g
    nwg-look
    openssl
    p7zip
    pavucontrol
    pcmanfm
    pdfarranger
    picom
    pipewire
    pkg-config
    pulseaudio
    pulseaudio-ctl
    qt5Full
    qtcreator
    rclone
    rclone-browser
    ripgrep #untuk Telescope neovim
    rlwrap #so I can navigate using arrow key when enter to sqlite console. launch sqlite with command "rlwrap sqlite3"
    rofi-wayland
    rustc
    scrot
    slurp 
    sqlite
    sqlitebrowser
    starship
    svp
    tree
    unzip
    volumeicon
    waybar
    wl-clipboard
    wlogout 
    wget
    wineWowPackages.stable
    wofi
    xarchiver #for pcmanfm extractor
    xclip
    xdg-user-dirs # manage well known user directories
    xdg-utils 
    xfce.thunar
    yt-dlp
    zip
    zip
    zram-generator

  ];

  fonts.packages = with pkgs; [
        cascadia-code
        cooper-hewitt
        iosevka
        spleen
        fira-code-symbols
        fira-code
        jetbrains-mono
  ];
}
