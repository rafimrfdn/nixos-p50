{ pkgs, lib, ... }:

let
  swayRun = pkgs.writeShellScript "sway-run" ''
   # export XDG_SESSION_TYPE=wayland
   # export XDG_SESSION_DESKTOP=Hyprland
   # export XDG_CURRENT_DESKTOP=Hyprland
   # systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

      dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP SWAYSOCK XDG_CURRENT_SESSION

#    systemd-run --user --scope --collect --quiet --unit=sway systemd-cat --identifier=sway ${pkgs.sway}/bin/sway $@
    systemd-run --user --scope --collect --quiet --unit=sway systemd-cat --identifier=sway ${pkgs.sway}/bin/sway Hyprland
  '';
in
{
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        #command = "${lib.makeBinPath [pkgs.greetd.tuigreet] }/tuigreet --time --cmd ${swayRun}";
        command = "Hyprland"; 
        user = "nix";
      };
      initial_session = {
        #command = "${swayRun}";
        command = "Hyprland"; # I want to set Hyprland as my default session
        #command = "startx";
        #command = "sway";
        user = "nix";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
  Hyprland
  sway
  startx
  '';
}


#############################

#{
#services.greetd = {
#  enable = true;
#  settings = rec {
#    initial_session = {
#      command = "Hyprland";
#      user = "nix";
#    };
#    default_session = initial_session;
#  };
#};
#environment.etc."greetd/environments".text = ''
#  Hyprland
#  sway
#  awesome
#  '';
#}



#############################################

#let
#  swayConfig = pkgs.writeText "greetd-sway-config" ''
#    # `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.
#    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l -c sway; swaymsg exit"
#    bindsym Mod4+shift+e exec swaynag \
#      -t warning \
#      -m 'What do you want to do?' \
#      -b 'Poweroff' 'systemctl poweroff' \
#      -b 'Reboot' 'systemctl reboot'
#       killall xdg-desktop-portal-hyprland
#	killall xdg-desktop-portal-wlr
#	killall xdg-desktop-portal
#      export GDK_BACKEND=wayland,x11
#      export XDG_CURRENT_DESKTOP=Hyprland
#      export XDG_SESSION_TYPE=wayland
#      export XDG_SESSION_DESKTOP=Hyprland
#      seat seat0 
#      exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
#  '';
#in
#{
#environment.systemPackages = with pkgs; [
#    papirus-icon-theme
#    greetd.gtkgreet
#  ];
#
#  services.greetd = {
#    enable = true;
#    settings = {
#      default_session = {
#        command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
#      };
#    };
#  };
#
#  environment.etc."greetd/environments".text = ''
#  Hyprland
#  sway
#  awesome
#  '';
#}


###########################################################



