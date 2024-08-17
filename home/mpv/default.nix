# mpv.nix (imported as a home-manager module)  

{ config, pkgs, lib, inputs, ... }: {
    options.mpvCallArgs = lib.mkOption {
        type = with lib.types; attrsOf unspecified;
        default = [];
    };
    options.mpvScripts = lib.mkOption {
        type = with lib.types; listOf package;
        default = [];
    };
    
    config.programs.mpv = {
        enable = true;
        package = with pkgs; wrapMpv
            ((mpv-unwrapped.override config.mpvCallArgs).overrideAttrs {
                src = inputs.mpvSvpFix;
            })
            { scripts = config.mpvScripts; };
        config.script = ["${inputs.mpvSockets}/mpvSockets.lua"];
    };
    # ...
}

