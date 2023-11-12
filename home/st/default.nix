{config, pkgs, ...}:

{
  nixpkgs.overlays = [
    (self: super: {
      st = super.st.overrideAttrs (oldAttrs: rec {
        patches = [
        ./patches/st-scrollback-0.8.5.diff
        ./patches/st-font2-0.8.5.diff
        ./patches/st-glyph-wide-support-20220411-ef05519.diff
        ./patches/st-charoffsets-20220311-0.8.5.diff
        #./st/st-anysize-20220718-baa9357.diff
        ];
        configFile = super.writeText "config.h" (builtins.readFile ./config/config.h);
        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
      });
    })
  ];

  home.packages = with pkgs; [
  st
  ];

}
