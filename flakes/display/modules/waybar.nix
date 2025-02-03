{config, pkgs, ...}:

{

programs.waybar = {
    enable = true;
    systemd.enable = false;
  };
}
