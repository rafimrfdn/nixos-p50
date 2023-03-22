# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./greetd/default.nix
    ];


    nix.extraOptions = ''
    experimental-features = nix-command
    '';

    # Enable Intel SGX, this setting must enable from Bios,
    # I actually don't know what is this.
    #services.aesmd.enable = true;
    #hardware.cpu.intel.sgx.provision.enable = true;

  # Enable OpenGL
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-media-driver (vaapiIntel.override {enableHybridCodec = true;}) vaapiVdpau libvdpau-va-gl ];
  hardware.opengl.driSupport = true;

  # Enable zram
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;

  # Disable kernel from nvidia
  boot.blacklistedKernelModules = [ "nouveau" ];

  # Silent boot to hide Stage when boot system 
  boot.plymouth.enable = true;
  boot.initrd.verbose = false;

  # Use latest linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.timeout = 0;

  # Enable NTFS
  boot.supportedFilesystems = ["ntfs"];

  networking.hostName = "nixhost"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  
  # Host for open reddit
  networking.extraHosts = ''
    151.101.129.140   i.redditmedia.com
    52.34.230.181     www.reddithelp.com
    151.101.65.140    g.redditmedia.com
    151.101.65.140    a.thumbs.redditmedia.com
    151.101.1.140     new.reddit.com
    151.101.129.140   reddit.com
    151.101.129.140   gateway.reddit.com
    151.101.129.140   oauth.reddit.com
    151.101.129.140   sendbird.reddit.com
    151.101.129.140   v.redd.it
    151.101.1.140     b.thumbs.redditmedia.com
    151.101.1.140     events.reddit.com
    54.210.123.98     stats.redditmedia.com
    151.101.65.140    www.redditstatic.com
    151.101.193.140   www.reddit.com
    52.3.23.26        pixel.redditmedia.com
    151.101.65.140    www.redditmedia.com
    151.101.193.140   about.reddit.com
    52.203.76.9       out.reddit.com
  '';


  # Set your time zone.
  time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.utf8";
    LC_IDENTIFICATION = "id_ID.utf8";
    LC_MEASUREMENT = "id_ID.utf8";
    LC_MONETARY = "id_ID.utf8";
    LC_NAME = "id_ID.utf8";
    LC_NUMERIC = "id_ID.utf8";
    LC_PAPER = "id_ID.utf8";
    LC_TELEPHONE = "id_ID.utf8";
    LC_TIME = "id_ID.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  #AwesomeWM
  services.xserver.windowManager.awesome.enable = true;

  # Enable LightDM
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.displayManager.lightdm.greeters.slick.enable = true;
  #services.xserver.displayManager.lightdm.greeters.slick.theme.name = "Qogir";


  # Enable GDM
#  services.xserver.displayManager.gdm.enable = true;
#  services.xserver.displayManager.gdm.wayland = true;



#  programs.xwayland.enable = true;
  xdg.portal = {
  	enable = true;
  	wlr.enable = true;
	extraPortals = [ 
		pkgs.xdg-desktop-portal-gtk 
		];
  };
  

  # Set default XSesssion
  services.xserver.displayManager.defaultSession = "none+awesome";


  # Enable Cinnamon Dekstop
#  services.xserver.desktopManager.cinnamon.enable = true;


  # zsh
    programs.zsh.enable = true;
    programs.zsh.autosuggestions.enable = true;
    programs.bash.enableCompletion = true;



  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  #NVidia setting
#  services.xserver.videoDrivers = [ "nvidia" "intel" ];
  services.xserver.videoDrivers = [ "nouveau" "intel" ];
#  services.xserver.videoDrivers = [ "intel" ];
#  hardware.nvidia.nvidiaPersistenced = true;


  # enable backlight
  programs.light.enable = true;

# Fonts
  fonts.fonts = with pkgs; [
    cascadia-code
    fira-code
    fira
    cooper-hewitt
    ibm-plex
    jetbrains-mono
    iosevka
    spleen
    fira-code-symbols
  ];


  # Enable CUPS to print documents.
#  services.printing.enable = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable Network Manager applet
  programs.nm-applet.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ 
	"wheel" 
    	"networokmanager" 
	"video" 
	"input" 
	"storage" 
	"libvirtd"
	];
    shell = pkgs.zsh;
  };

  users.users.rafi = {
    isNormalUser = true;
    description = "user wayland";
    extraGroups = [ 
	"wheel" 
    	"networokmanager" 
	"video" 
	"input" 
	"storage" 
	"libvirtd"
	];
    shell = pkgs.zsh;
  };

    # Enable automatic login for the user.
  #services.xserver.displayManager.autoLogin.enable = true;
  #services.xserver.displayManager.autoLogin.user = "nix";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
# nixpkgs.config.allowBroken = true;


# Virtualization with qemu kvm
   virtualisation.libvirtd.enable = true;
   programs.dconf.enable = true;


  # NodeJS and NPM
  programs.npm.enable = true;
  
  # neovim global
  programs.neovim = {
  	enable = true;
	withNodeJs = true;
	defaultEditor = true;	
	vimAlias = true;
	configure = {
		packages.myVimPackage = with pkgs.vimPlugins; {
			start = [ vim-nix];
		};
	};
  };
  environment.variables.EDITOR = "nvim";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	gcc #must have one linux compiler like gcc or cc etc.
	gnumake
#	xwayland
  ];

# Auto login TTY 
#systemd.services."autovt@tty2".description = "Autologin at the TTY1";
#systemd.services."autovt@tty2".after = [ "systemd-logind.service" ];  # without it user session not started and xorg can't be run from this tty
#systemd.services."autovt@tty2".wantedBy = [ "multi-user.target" ];
#systemd.services."autovt@tty2".serviceConfig =
#  { ExecStart = [
##      ""  # override upstream default with an empty ExecStart
##      "@${pkgs.utillinux}/sbin/agetty agetty --login-program ${pkgs.shadow}/bin/login --autologin rafi --noclear %I $TERM"
#"exec awesome"
#    ];
#    Restart = "always";
#    Type = "idle";
#  };


  # Mount drive
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wants = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
          };
      };
    };
   security.pam.mount.enable = true;
   security.pam.mount.createMountPoints = true;
   security.polkit.enable = true;
   services.gvfs.enable = true;
   services.udisks2.enable = true;


  # Automatic delete old version
  nix = {
      # Hard link identical files in the store automatically
       #autoOptimiseStore = true;
      settings.auto-optimise-store = true;
      # automatically trigger garbage collection
      gc.automatic = true;
      gc.dates = "weekly";
      gc.options = "--delete-older-than 30d";

    settings.substituters = ["https://hyprland.cachix.org"];
    settings.trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
 
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;



  # Faster Boot Time
  # if you not using GDM or ZFS use this
  # systemd.services.systemd-udev-settle.enable = false; 

  systemd.services.NetworkManager-wait-online.enable = false;
  networking = {
  	dhcpcd.wait = "background" ;
	dhcpcd.extraConfig = "noarp" ;
	};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
  
}

