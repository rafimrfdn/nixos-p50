{config, pkgs, ...}:

{
    xdg = {
        enable = true;
        userDirs = {
            enable = true;
            createDirectories = true;
        };
        portal = {
            enable = true;
            configPackages = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
                xdg-desktop-portal-wlr
            ];
            extraPortals = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
                xdg-desktop-portal-wlr
            ];
            config = {
                common = {
                    default = [ "*" ];
                };
            };
        };
        # mimieapps
        mime.enable = true;

    }
}
