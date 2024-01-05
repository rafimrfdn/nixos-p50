# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
# ./greetd/default.nix
      ./apache/default.nix
    ];


# Intel/OpenGL
hardware.opengl = {
  enable = true;
  extraPackages = with pkgs; [
    intel-media-driver
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];
  driSupport = true;
# driSupport32Bit = true;
  };

# hardware.nvidia = {
#    modesetting.enable = true;
#    open = false;
#
#    nvidiaSettings = true;
#    package = config.boot.kernelPackages.nvidiaPackages.latest;
#  };

# bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;


# Enable zram
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;

# Disable kernel from nvidia
# boot.blacklistedKernelModules = [ "nouveau" ];

# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.systemd-boot.editor = false;
  boot.loader.timeout = 0;

# Enable NTFS
  boot.supportedFilesystems = ["ntfs"];

# Use latest linux kernel
#boot.kernelPackages = pkgs.linuxPackages_latest;
#   boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_5;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  # systemd.services = {
  #   systemd-tmpfiles-setup.before = [ "sysinit.target"];
  #   systemd-update-utmp.after = [ "systemd-tmpfiles_setup.service"];
  # };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
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

# Silent boot to hide Stage when boot system 
#  boot.plymouth.enable = true;
#
#  boot.kernelParams = ["quiet" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3"];
#  boot.consoleLogLevel = 0;
#  boot.initrd.verbose = false;
#  boot.initrd.systemd.enable = true;
#  systemd.watchdog.rebootTime = "0";

#  setting nvidia untuk hyprland, tapi gak work
# boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1"];
# hardware.nvidia.powerManagement.enable = true;
# hardware.nvidia.open = false;

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

    127.0.0.1 	      local.nixhost
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
#services.xserver.enable = true;
# services.xserver.displayManager.startx.enable = true;

  services.xserver = {
    enable = true;
# videoDrivers = ["nvidia"];
    videoDrivers = ["nouveau" "intel"];
# X11 keymap
    layout = "us";
    xkbVariant = "";
    excludePackages = [pkgs.xterm];
    libinput.enable = true;
  };

#AwesomeWM
# services.xserver.windowManager.awesome.enable = true;

# Enable LightDM
# services.xserver.displayManager.lightdm.enable = false;

# Set default XSesssion
# services.xserver.displayManager.defaultSession = "none+awesome";


# Enable Cinnamon Dekstop
#  services.xserver.desktopManager.cinnamon.enable = true;


# zsh
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
# programs.bash.enableCompletion = true;

# copy dari https://github.com/HeinzDev/Hyprland-dotfiles/blob/main/hosts/desktop/default.nix
  programs = {
    bash = {
 #      interactiveShellInit = ''
	#   if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	#     WLR_NO_HARDWARE_CURSORS=1 Hyprland #prevents cursor disappear when using Nvidia drivers
	#   fi
	# '';
      enableCompletion = true;
    };
  };

# Configure keymap in X11
# services.xserver = {
#   layout = "us";
#   xkbVariant = "";
# };

# disable xterm, because this enable by default
# services.xserver.excludePackages = [ pkgs.xterm ];

#NVidia setting
# services.xserver.videoDrivers = [ "nvidia" "intel" ];
# services.xserver.videoDrivers = [ "nouveau" "intel" ];
#  services.xserver.videoDrivers = [ "intel" ];
#  hardware.nvidia.nvidiaPersistenced = true;


# enable backlight
  programs.light.enable = true;

# wajib aktifkan dconf supaya bisa compile home-manager secara modular.
  programs.dconf.enable = true;


# Fonts
  fonts.packages = with pkgs; [
    cascadia-code
# fira-code
# fira
      cooper-hewitt
# ibm-plex
# jetbrains-mono
      iosevka
      spleen
      fira-code-symbols
  ];


# Enable CUPS to print documents.
#  services.printing.enable = false;

# Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false; #Disable Pulseaudio
    security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
  };



# Enable touchpad support (enabled default in most desktopManager).
#services.xserver.libinput.enable = true;

# Enable Network Manager applet
  programs.nm-applet.enable = true;


#auto login user 
  services.getty.autologinUser = "nix";


# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ 
      "wheel" 
      "networkmanager" 
      "video" 
      "input" 
      "storage" 
      "libvirtd"
#	"docker"
    ];
    shell = pkgs.zsh;

    packages = with pkgs; [
      php82
      php82Packages.composer
      mariadb
    ];

  };


# Allow unfree packages
  nixpkgs.config.allowUnfree = true;
# nixpkgs.config.allowBroken = true;

# Virtualization with qemu kvm
#   virtualisation.libvirtd.enable = true;
#   programs.virt-manager.enable = true;


# Automatic delete old version
  nix = {
# Hard link identical files in the store automatically
#autoOptimiseStore = true;
    settings.auto-optimise-store = true;
# automatically trigger garbage collection
    gc.automatic = true;
    gc.dates = "weekly";
    gc.options = "--delete-older-than 15d";
  };


# NodeJS and NPM
# programs.npm.enable = true;

  environment.variables.EDITOR = "nvim";

# List packages installed in system profile. To search, run:
# $ nix search wget
  environment.systemPackages = with pkgs; [
    gcc #must have one linux compiler like gcc or cc etc.
    gnumake
  ];

#  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common = {
	default = [ "gtk" ];
      };
    };
  };


# enable emacs daemon
  services.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  };

# Make swaylock function 
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  security.pam.mount.enable = true;
  security.pam.mount.createMountPoints = true;
  security.polkit.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

# Faster Boot Time
# if you not using GDM or ZFS use this
  systemd.services.systemd-udev-settle.enable = false; 

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

  nix.settings.experimental-features = [ "nix-command" "flakes"];
}

