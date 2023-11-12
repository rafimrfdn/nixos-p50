{config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Cascadia Code";
      size = 10.5;
    };
    theme = "Nord";
    extraConfig = ''
      # to see all list of fonts in system
      # kitty +list-fonts

      #font_family      Iosevka 
      #font_family      Cascadia Code

      #italic_font      Iosevka Italic
      #bold_font        Iosevka Bold
      #bold_italic_font Iosevka Bold Italic

      italic_font      Cascadia Code Italic
      bold_font        Cascadia Code Bold
      bold_italic_font Cascadia Code Bold Italic

      allow_remote_control yes
      confirm_os_window_close 0
      ''; 
    };
}