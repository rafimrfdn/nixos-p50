{pkgs, ...}:

let
  # Define the custom overlay
  myOverlay = self: super: {
    dwmblocks = super.st.overrideAttrs (oldAttrs: rec {
      # Path to the local st source directory
        src = ./dwmblocks-async;

      # Add custom config file
         configFile = super.writeText "config.h" (builtins.readFile ./dwmblocks-async/config.h);

      # Post-patch commands to copy your custom config
        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
    });
  };

in
{
  # Add the overlay to Home Manager
  nixpkgs.overlays = [ myOverlay ];

  # Use Home Manager to install the st package
  # home.packages = with pkgs; [
  #   st
  # ];
 environment.systemPackages = with pkgs; [
    dwmblocks
  ];
}

