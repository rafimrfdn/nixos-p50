{ config, pkgs, ... }:

{
  services.xserver = {
  displayManager = {
    sessionPackages = [pkgs.sway];
    lightdm = {
      enable = false;
      greeter = {
        enable = false;
      };
    };
  };
  videoDrivers = ["nouveau" "intel" "amdgpu" "radeon" "modesetting" "fbdev" ];
  # videoDrivers = ["nvidia"];

  };


#this from hervyqa
xdg = {
  portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    configPackages = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config = {
      common = {
        default = [ "*" ];
      };
    };
  };
};

# Make swaylock function 
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

}
