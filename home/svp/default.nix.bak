# svp.nix (imported as a home-manager module)

{ config, pkgs, lib, ... }: {
    home.packages = with pkgs; let
        removeMpv = from:
            lib.filter (pkg: pkg.meta.mainProgram or "" != "mpv") from;

        buildFHSEnv = attrs: pkgs.buildFHSEnv (attrs // { targetPkgs = pkgs:
            (removeMpv (attrs.targetPkgs pkgs)) ++
            [config.programs.mpv.package];
        });
    in [(svp.override { inherit buildFHSEnv; })];

    mpvCallArgs.vapoursynthSupport = true;
    programs.mpv.config.hr-seek-framedrop = "no";  # prevent desyncs on seek
}
