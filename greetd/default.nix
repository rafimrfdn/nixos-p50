{ pkgs, lib, ... }:

let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # command = "${tuigreet} --time --remember --cmd Hyprland";
        command = "${tuigreet} --time --remember --cmd sway";
        user = "nix";
      };
     initial_session = {
       #command = "${swayRun}";
       # command = "Hyprland"; # I want to set Hyprland as my default session
       #command = "startx";
       command = "sway";
       user = "nix";
     };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  environment.etc."greetd/environments".text = ''
   sway
   bash
  '';
}
