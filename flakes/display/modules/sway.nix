{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.windowManager.sway.enable = true;
  environment.systemPackages = [ pkgs.sway pkgs.kitty ];
}
