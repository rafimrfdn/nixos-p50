{ config,... }: 

{
    xdg.mime.enable = true;
    xdg.mime.defaultApplications = {
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "inode/directory"   = "thunar.desktop";
        "text/*"            = "nvim.desktop";
        "application/pdf"   = [ "com.github.jeromerobert.pdfarranger.desktop"];
        "image/*"           = [ "org.gnome.eog.desktop"  ];
        "video/*"           = [ "mpv.desktop"            ];
    };

}
