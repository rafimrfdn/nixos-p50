{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ../../boot/default.nix
            ../../greetd/default.nix
            # ../../dwm/default.nix
            # ../../st/default.nix
            # ../../dwmblocks/default.nix
            # ../../sway/default.nix
            # ../../apache/default.nix
            # ../../rubyonrails/default.nix
            # ../../mime/default.nix
        ];


    documentation.nixos.enable = false;

# Enable zram
    zramSwap.enable = true;
    zramSwap.memoryPercent = 50;

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

    services.pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
    };

# Intel/OpenGL
    hardware.graphics= {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-sdk
            vpl-gpu-rt
        ];
    };

# bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    services.xserver = {
        enable = true;
        xkb.layout = "us";
        xkb.variant = "";
        desktopManager = {
            xterm = {
                enable = false;
            };
        };
        excludePackages = [pkgs.xterm];
        videoDrivers = ["modesetting" "fbdev" ]; # use this if not discrete VGA
    };
    services.libinput = {
        enable = true;
    };
    services.displayManager = {
        autoLogin = {
            enable = true;
            user = "nix";
        };
    };

# zsh
    programs.zsh.enable = true;
    programs.zsh.autosuggestions.enable = true;
    programs.bash.completion.enable = true;

    programs.light.enable = true;
    programs.dconf.enable = true;

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
    ];


    environment = {
        variables = {
            EDITOR = "nvim";  # set default text editor
            # PATH = "$HOME/.local/share/gem/ruby/3.3.0/bin";  # ruby needs to set manualy the env variable like this.
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
        };
    };

 # Enable Home Manager
  # home-manager = {
  #   useGlobalPkgs = true;
  #   useUserPackages = true;
  #   users.nix = import ./home.nix;
  # };


# mount new drive, usb flash disk, etc for pacman, nemo and manually mounting drives.
    security.pam.mount.enable = true;
    security.pam.mount.createMountPoints = true;
    security.polkit.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;

    nixpkgs.config.allowUnfree = true;

# Virtualization with qemu kvm
    # virtualisation = {
    #     libvirtd.enable = true;
    #     # docker = {                      # Enable Docker
    #     #         enable = true;
    #     #         rootless = {            # this will run docker without root access
    #     #             enable = true;
    #     #             setSocketVariable = true;
    #     #         };
    #     #     };
    #     };
    # programs.virt-manager.enable = true;


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

