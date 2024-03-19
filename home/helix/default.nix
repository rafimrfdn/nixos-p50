{config, pkgs, ...}:

{
  programs.helix = {
    enable = true; 
    settings = { 
      theme = "base16_terminal";
      
      editor = {
        line-number = "relative";
        rulers = 80;
        shell = ["zsh" "-c" ];
      };
      
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      
      editor.file-picker = {
        hidden = false
      };
  };
}
