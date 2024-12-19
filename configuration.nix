# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ./boot/default.nix
            ./greetd/default.nix
            ./dwm/default.nix
            ./st/default.nix
            # ./dwmblocks/default.nix
            # ./sway/default.nix
            ./apache/default.nix
            ./rubyonrails/default.nix
            ./mime/default.nix
        ];


    documentation.nixos.enable = false;

# Enable zram
    zramSwap.enable = true;
    zramSwap.memoryPercent = 50;

# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

networking = {
  hostName = "nixhost"; # Define your hostname.
  networkmanager.enable = true; # Enable networking
  dhcpcd.wait = "background"; # no need to wait interfaces to have an IP to continue booting
  dhcpcd.extraConfig = "noarp"; # avoid checking if IP is already taken to boot a few seconds faster
  # Host for open reddit
  extraHosts = ''
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
};

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

# Enable CUPS to print documents.
#  services.printing.enable = false;


# Enable sound with pipewire.
    # sound.enable = true;
    # hardware.pulseaudio.enable = false; #Disable Pulseaudio
    #     security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        audio.enable = true;
        # alsa.enable = true;
        # alsa.support32Bit = true;
        pulse.enable = true;
        # wireplumber.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
    };




# Intel/OpenGL
    hardware.graphics= {
        enable = true;
        extraPackages = with pkgs; [
            #intel-media-driver
            #vaapiIntel
            #vaapiVdpau
            #libvdpau-va-gl
            intel-media-sdk
            vpl-gpu-rt
        ];
        # driSupport = true;
        # driSupport32Bit = true;
    };

# bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;




# polkit gnome for Nautilus
    # systemd = {
    #     user.services.polkit-gnome-authentication-agent-1 = {
    #         description = "polkit-gnome-authentication-agent-1";
    #         wantedBy = [ "graphical-session.target" ];
    #         wants = [ "graphical-session.target" ];
    #         after = [ "graphical-session.target" ];
    #         serviceConfig = {
    #             Type = "simple";
    #             ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    #             Restart = "on-failure";
    #             RestartSec = 1;
    #             TimeoutStopSec = 10;
    #         };
    #     };
    # };


# Enable the X11 windowing system.
#services.xserver.enable = true;
# services.xserver.displayManager.startx.enable = true;

    services.xserver = {
        enable = true;
        # X11 keymap
        xkb.layout = "us";
        xkb.variant = "";
        desktopManager = {
            xterm = {
                enable = false;
            };
        };
        excludePackages = [pkgs.xterm];
        # disable all videoDrivers if you want to activate DWM.
        # but if you set Discrete VGA on BIOS, you an activate intel and nouveau driver
        # videoDrivers = ["nouveau" "intel" "amdgpu" "radeon" "modesetting" "fbdev" ]; # this is all drivers can be use
        videoDrivers = ["modesetting" "fbdev" ]; # use this if not discrete VGA
        # videoDrivers = ["nouveau" "intel"]; #only this works to activate nvidia when set discrete nvidia driver in bios, now I can run both sway and DWM.
        # videoDrivers = ["nvidia"]; # when set hardware-module especially for Thinkpad P50 in flakes, then disable this.
    };
    services.libinput = {
        enable = true;
    };
    services.displayManager = {
    # sessionPackages = [pkgs.sway];
    # lightdm = {
    #   enable = true;
    #   greeter = {
    #     enable = false;
    #   };
    # };
    # defaultSession = "sway";
        autoLogin = {
            enable = true;
            user = "nix";
        };
    };

# services.dbus.enable = true;
# xdg.portal = {
#   enable = true;
#   wlr.enable = true;
#   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
#   config = {
#     common = {
#       # default = [ "gtk" ];
#       default = [ "*" ];
#     };
#   };
# };

#this from hervyqa
# xdg = {
#   portal = {
#     enable = true;
#     wlr = {
#       enable = false;
#     };
#     configPackages = with pkgs; [
#       xdg-desktop-portal-gtk
#       xdg-desktop-portal-wlr
#     ];
#     extraPortals = with pkgs; [
#       xdg-desktop-portal-gtk
#       xdg-desktop-portal-wlr
#     ];
#     config = {
#       common = {
#         default = [ "*" ];
#       };
#     };
#   };
# };


#AwesomeWM
# services.xserver.windowManager.awesome.enable = true;

# Enable LightDM
# services.xserver.displayManager.lightdm.enable = false;

# Set default XSesssion
# services.xserver.displayManager.defaultSession = "none+awesome";


# Enable Cinnamon Dekstop
#  services.xserver.desktopManager.cinnamon.enable = true;

# Enable touchpad support (enabled default in most desktopManager).
#services.xserver.libinput.enable = true;


# zsh
    programs.zsh.enable = true;
    programs.zsh.autosuggestions.enable = true;
    programs.bash.completion.enable = true;

# copy dari https://github.com/HeinzDev/Hyprland-dotfiles/blob/main/hosts/desktop/default.nix
#  programs = {
#    bash = {
#   #    interactiveShellInit = ''
#   #  	  if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#  	#     # WLR_NO_HARDWARE_CURSORS=1 Hyprland #prevents cursor disappear when using Nvidia drivers
#   #      #exec sway
# #   fi
# # '';
#      enableCompletion = true;
#    };
#  };

#NVidia setting
# services.xserver.videoDrivers = [ "nvidia" "intel" ];
# services.xserver.videoDrivers = [ "nouveau" "intel" ];
#  services.xserver.videoDrivers = [ "intel" ];
#  hardware.nvidia.nvidiaPersistenced = true;


# enable backlight for screen brightness
    programs.light.enable = true;

# wajib aktifkan dconf supaya bisa compile home-manager secara modular.
    programs.dconf.enable = true;

# Enable Network Manager applet
    programs.nm-applet.enable = true;


# Fonts
    fonts.packages = with pkgs; [
        cascadia-code
        cooper-hewitt
        iosevka
        spleen
        fira-code-symbols
        fira-code
        jetbrains-mono
# fira
# ibm-plex
    ];


# enable emacs daemon
# services.emacs = {
#   enable = true;
#   package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
# };


    environment = {
        variables = {
            EDITOR = "nvim";  # set default text editor
            PATH = "$HOME/.local/share/gem/ruby/3.3.0/bin";  # ruby needs to set manualy the env variable like this.
        };
        shells = [ pkgs.zsh ];          # add the zsh package to /etc/shells
    };

# Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
        defaultUserShell = pkgs.zsh;
        users.nix = {
            # defaultUserShell = true;  # when this active, tmux will not use zsh as default shell, but bash
            isNormalUser = true;
            description = "nix";
            extraGroups = [ 
                "wheel" 
                "networkmanager" 
                "video" 
                "input" 
                "storage" 
                "libvirtd"
                # "docker"
            ];
            # shell = pkgs.zsh;
            # packages = with pkgs; [
            #     php83
            #     php83Packages.composer
            #     mariadb
            # ];
        };
    };



# mount new drive, usb flash disk, etc for pacman, nemo and manually mounting drives.
    security.pam.mount.enable = true;
    security.pam.mount.createMountPoints = true;
    security.polkit.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;

#auto login user 
# services.getty.autologinUser = "nix";

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;
# nixpkgs.config.allowBroken = true;

# Virtualization with qemu kvm
    virtualisation = {
        libvirtd.enable = true;
        # docker = {                      # Enable Docker
        #         enable = true;
        #         rootless = {            # this will run docker without root access
        #             enable = true;
        #             setSocketVariable = true;
        #         };
        #     };
        };
    programs.virt-manager.enable = true;


# Automatic delete old version
    nix = {
# automatically trigger garbage collection
        gc.automatic = true;
        gc.dates = "weekly";
        gc.options = "--delete-older-than 7d";
# Hard link identical files in the store automatically
#autoOptimiseStore = true;
        settings.auto-optimise-store = true;
    };

# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
        gcc       # must have one linux compiler like gcc or cc etc.
        gnumake   # must have this for build ST dan DWM
        zig       # this is alternative to gcc, cc, act like compiler but faster 
        go
    ];


# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.11"; # Did you read the comment?

    nix.settings.experimental-features = [ "nix-command" "flakes"]; # activate flake
}

