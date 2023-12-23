{ config, pkgs, ... }:

let
  mpv-unwrapped = pkgs.mpv-unwrapped.override { 
    vapoursynthSupport = true;
    vapoursynth = with pkgs; vapoursynth.withPlugins
        [ vapoursynth-mvtools ffms ];
};
  mpv = pkgs.wrapMpv mpv-unwrapped { };

# mpv-unwrapped = super.mpv-unwrapped.override {
#       vapoursynthSupport = true;
#       vapoursynth = with self; vapoursynth.withPlugins
#         [ vapoursynth-mvtools ffms ];
#     };


in
{
  home.packages = [ mpv ] ++ (with pkgs; [
     # vlc
     # smplayer
  ]);

  #home.file.".config/mpv/motioninterpolation.py".source = pkgs.substituteAll {
  home.file.".config/mpv/motioninterpolation.vpy".source = pkgs.substituteAll {
    src = ./motioninterpolation.vpy;
    #mvtoolslib = "${pkgs.vapoursynth-mvtools}/lib/vapoursynth/";
  };

  # home.file.".config/mpv/svp.py".source = pkgs.substituteAll {
  #   src = ./svp.py;
    #svpflow = "${pkgs.lun.svpflow}/lib/";
    #mvtoolslib = "${pkgs.vapoursynth-mvtools}/lib/vapoursynth/";
  # };

  home.file.".config/mpv/mpv.conf".text = ''
    #vf=format=yuv420p,vapoursynth=./motioninterpolation.vpy:4:4
    vf=format=yuv420p,vapoursynth=~~/motioninterpolation.vpy:4:4
    #vf=format=yuv420p,vapoursynth=./motioninterpolation.py:4:4
    #vf=vapoursynth=~~/svp.py:2:24
  '';

  home.file.".config/mpv/input.conf".text = ''
  I vf toggle format=yuv420p,vapoursynth=~~/motioninterpolation.vpy:4:4
  '';
}
