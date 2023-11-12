{config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Cascadia Code";
      size = 10.5;
    };
    extraConfig = ''
      # to see all list of fonts in system
      # kitty +list-fonts

      #font_family      Iosevka 
      #font_family      Cascadia Code

      #italic_font      Iosevka Italic
      #bold_font        Iosevka Bold
      #bold_italic_font Iosevka Bold Italic

      #italic_font      Cascadia Code Italic
      #bold_font        Cascadia Code Bold
      #bold_italic_font Cascadia Code Bold Italic

      allow_remote_control yes
      confirm_os_window_close 0

      #font_size 10.5


      # vim:ft=kitty
      ## name: Nord
      ## author: Connor Holyday
      ## license: MIT
      ## upstream: https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf
      ## blurb: An arctic, north-bluish clean and elegant Kitty theme.

      # Nord Colorscheme for Kitty
      # Based on:
      # - https://gist.github.com/marcusramberg/64010234c95a93d953e8c79fdaf94192
      # - https://github.com/arcticicestudio/nord-hyper

      foreground            #D8DEE9
      background            #2E3440
      selection_foreground  #000000
      selection_background  #FFFACD
      url_color             #0087BD
      cursor                #81A1C1

      # black
      color0   #3B4252
      color8   #4C566A

      # red
      color1   #BF616A
      color9   #BF616A

      # green
      color2   #A3BE8C
      color10  #A3BE8C

      # yellow
      color3   #EBCB8B
      color11  #EBCB8B

      # blue
      color4  #81A1C1
      color12 #81A1C1

      # magenta
      color5   #B48EAD
      color13  #B48EAD

      # cyan
      color6   #88C0D0
      color14  #8FBCBB

      # white
      color7   #E5E9F0
      color15  #ECEFF4
      ''; 
    };
}
