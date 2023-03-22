{ pkgs, lib, ... }:

#let
#  swayRun = pkgs.writeShellScript "sway-run" ''
#    export XDG_SESSION_TYPE=wayland
#    export XDG_SESSION_DESKTOP=sway
#    export XDG_CURRENT_DESKTOP=sway
##    systemd-run --user --scope --collect --quiet --unit=sway systemd-cat --identifier=sway ${pkgs.sway}/bin/sway $@
#    systemd-run --user --scope --collect --quiet --unit=sway systemd-cat --identifier=sway ${pkgs.sway}/bin/sway Hyprland
#  '';
#in
#{
#  services.greetd = {
#    enable = true;
#    restart = false;
#    settings = {
#      default_session = {
#        #command = "${lib.makeBinPath [pkgs.greetd.tuigreet] }/tuigreet --time --cmd ${swayRun}";
#        command = "${lib.makeBinPath [pkgs.greetd.tuigreet] }/tuigreet --time --cmd Hyprland";
#        user = "rafi";
#      };
#      initial_session = {
#        command = "${swayRun}";
#        user = "rafi";
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


#############################

{
services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "Hyprland";
      user = "nix";
    };
    default_session = initial_session;
  };
};
environment.etc."greetd/environments".text = ''
  Hyprland
  sway
  startx awesome
  '';

}



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
#  '';
#in
#{
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
#  hyprland
#  sway
#  awesome
#  '';
#}



