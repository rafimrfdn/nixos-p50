{
  config,
  pkgs,
  lib,
  ...
}: {
  xdg = {
    mime = {
      enable = true;
      defaultApplications = let
        firefox = ["firefox.desktop"];
        gimp = ["gimp.desktop"];
        inkscape = ["org.inkscape.Inkscape.desktop"];
        eog= ["org.gnome.eog.desktop"];
        nautilus = ["org.gnome.nautilus.desktop"];
        nvim = ["nvim.desktop"];
        mpv= ["mpv.desktop"];
        emacs = ["emacs.desktop"];
        pdfarranger = ["com.github.jeromerobert.pdfarranger.desktop"];
      in {
        "application/pdf" = pdfarranger;
        "application/x-extension-htm" = firefox;
        "application/x-extension-html" = firefox;
        "application/x-extension-shtml" = firefox;
        "application/x-extension-xht" = firefox;
        "application/x-extension-xhtml" = firefox;
        "application/xhtml+xml" = firefox;
        "application/xml" = nvim;
        "audio/aac" = mpv;
        "audio/flac" = mpv;
        "audio/mp4" = mpv;
        "audio/mpeg" = mpv;
        "audio/ogg" = mpv;
        "audio/x-wav" = mpv;
        "image/gif" = eog;
        "image/jpeg" = eog;
        "image/png" = eog;
        "image/svg+xml" = inkscape;
        "image/vnd.adobe.photoshop" = gimp;
        "image/webp" = eog;
        "image/x-eps" = inkscape;
        "image/x-xcf" = gimp;
        "inode/directory" = nautilus;
        "text/html" = firefox;
        "text/markdown" = nvim;
        "text/plain" = nvim;
        "text/uri-list" = firefox;
        "video/mp4" = mpv;
        "video/ogg" = mpv;
        "video/webm" = mpv;
        "video/x-flv" = mpv;
        "video/x-matroska" = mpv;
        "video/x-ms-wmv" = mpv;
        "video/x-ogm+ogg" = mpv;
        "video/x-theora+ogg" = mpv;
        "x-scheme-handler/about" = firefox;
        "x-scheme-handler/chrome" = firefox;
        "x-scheme-handler/ftp" = firefox;
        "x-scheme-handler/http" = firefox;
        "x-scheme-handler/https" = firefox;
        "x-scheme-handler/unknown" = firefox;
      };
    };
  };
}
