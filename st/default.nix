{pkgs, ...}:

let
  # Define the custom overlay
  myOverlay = self: super: {
    st = super.st.overrideAttrs (oldAttrs: rec {
      # Path to the local st source directory
        src = ./st-0.9.2;

      # Specify the patches you want to apply
      patches = [
        # ./patches/st-scrollback-0.8.5.diff
        ./patches/st-font2-0.8.5.diff
        ./patches/st-vertcenter.diff
        ./patches/st-scrollback-0.9.2.diff
        ./patches/st-boxdraw_v2-0.8.5.diff
        # ./patches/st-glyph-wide-support-20220411-ef05519.diff
        # ./patches/st-charoffsets-20220311-0.8.5.diff
        # ./patches/st-moonfly-0.8.2.diff
        # ./patches/st-alpha-0.8.5.diff
        # Add more patches as needed
      ];

      # Add custom config file
         configFile = super.writeText "config.h" (builtins.readFile ./config/config.h);

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
    st
  ];
}

