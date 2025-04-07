{ inputs, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/bundle.nix
    ./packages.nix
  ];


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

    environment = {
        variables = {
            EDITOR = "nvim";  # set default text editor
            # PATH = "$HOME/.local/share/gem/ruby/3.3.0/bin";  # ruby needs to set manualy the env variable like this.
        };
        # shells = [ pkgs.zsh ];          # add the zsh package to /etc/shells
    };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

# mount new drive, usb flash disk, etc for pacman, nemo and manually mounting drives.
    security.pam.mount.enable = true;
    security.pam.mount.createMountPoints = true;
    security.polkit.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;


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
  networking.wireless.userControlled.enable =true;

  time.timeZone = "Asia/Makassar";

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

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

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "24.11"; # Don't change it vro

}
