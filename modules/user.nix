{ pkgs, ... }: {
 
  users = {
    defaultUserShell = pkgs.bash;

    users.nix = {
      isNormalUser = true;
      description = "nix";
      extraGroups = [
	"wheel" 
	"networkmanager" 
	"video" 
	"input" 
	"uinput"
	"storage" 
	"libvirtd"
      ];
      packages = with pkgs; [
	#User Packages	
	whitesur-gtk-theme
	whitesur-icon-theme
	marwaita-icons #only can find on the unstable branch
	papirus-icon-theme

      ];
    };
  };
  # Enable automatic login for the user.
  services.getty.autologinUser = "nix";
}
