{config, pkgs, ...}:

{
  programs.helix = {
    enable = true; 
    settings = { 
      theme = "base16_terminal";
      
      editor = {
        line-number = "relative";
        rulers = [80];
        shell = ["zsh" "-c" ];
      };
      
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      
      editor.file-picker = {
        hidden = false;
      };
    };

  extraPackages = with pkgs;
    with nodePackages; [
      vscode-langservers-extracted
      gopls
      gotools
      typescript
      typescript-language-server
      marksman
      nil
      nixpkgs-fmt
      clang-tools
      lua-language-server
      rust-analyzer
      bash-language-server
    ];

    languages.language = [
      {
        name = "go";
        auto-format = true;
        formatter.command = "goimports";
      }
      {
        name = "typescript";
        indent.tab-width = 4;
        indent.unit = " ";
        auto-format = true;
      }
      {
        name = "javascript";
        indent.tab-width = 4;
        indent.unit = " ";
        auto-format = true;
      }
      {
        name = "nix";
        formatter.command = "nixpkgs-fmt";
      }
    ];
  };
}
