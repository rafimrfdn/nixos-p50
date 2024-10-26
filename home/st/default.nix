{config, pkgs, ...}:

# {
#   nixpkgs.overlays = [
#     (self: super: {
#       st = super.st.overrideAttrs (oldAttrs: rec {
#         patches = [
#         ./patches/st-scrollback-0.8.5.diff
#         ./patches/st-font2-0.8.5.diff
#         ./patches/st-glyph-wide-support-20220411-ef05519.diff
#         ./patches/st-charoffsets-20220311-0.8.5.diff
#         ./patches/st-vertcenter.diff
#         # ./patches/st-colorschemes-0.8.5.diff
#         #./st/st-anysize-20220718-baa9357.diff
#         ];
#         configFile = super.writeText "config.h" (builtins.readFile ./config/config.h);
#         postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
#       });
#     })
#   ];
# 
#   home.packages = with pkgs; [
#   st
#   ];
# 
# }

# {
#   nixpkgs.overlays = [
#     (self: super: {
#       # Create a custom `st` package using overrideAttrs
#       st = super.st.overrideAttrs (oldAttrs: rec {
#         # Specify the source directory for st
#         src = ./st-0.9.2;
#
#         # Add the patches you want to apply
#         patches = [
#         ./patches/st-scrollback-0.8.5.diff
#         ./patches/st-font2-0.8.5.diff
#         ./patches/st-glyph-wide-support-20220411-ef05519.diff
#         ./patches/st-charoffsets-20220311-0.8.5.diff
#         ./patches/st-vertcenter.diff
#         ];
#
#         # Add custom config file
#         configFile = super.writeText "config.h" (builtins.readFile ./config/config.h);
#
#         # Post-patch commands to copy your custom config
#         postPatch = ''
#           ${oldAttrs.postPatch or ""}
#           echo "Applying custom config file..."
#           cp ${configFile} config.def.h
#         '';
#       });
#     })
#   ];
#
#   # Ensure the package is installed on the system
#   # environment.systemPackages = with pkgs; [
#   #   st
#   # ];
#
#   home.packages = with pkgs; [
#    st
#   ];
# }



let
  # Define the custom overlay
  myOverlay = self: super: {
    st = super.st.overrideAttrs (oldAttrs: rec {
      # Path to the local st source directory
        src = ./st-0.9.2;

      # Specify the patches you want to apply
      patches = [
        ./patches/st-scrollback-0.8.5.diff
        ./patches/st-font2-0.8.5.diff
        ./patches/st-glyph-wide-support-20220411-ef05519.diff
        ./patches/st-charoffsets-20220311-0.8.5.diff
        ./patches/st-vertcenter.diff
        # Add more patches as needed
      ];

      # Add custom config file
         configFile = super.writeText "config.h" (builtins.readFile ./config/config.h);

      # Post-patch commands to copy your custom config
      postPatch = ''
        ${oldAttrs.postPatch or ""}
        echo "Applying custom config file..."
        cp ${configFile} config.def.h
      '';
    });
  };

in
{
  # Add the overlay to Home Manager
  nixpkgs.overlays = [ myOverlay ];

  # Use Home Manager to install the st package
  home.packages = with pkgs; [
    st
  ];
}

