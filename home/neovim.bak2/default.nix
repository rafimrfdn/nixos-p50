{config, pkgs, input, ...}:

{
programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    defaultEditor = true;
    withNodeJs = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp

      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [

      

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      # {
      #   plugin = gruvbox-nvim;
      #   config = "colorscheme gruvbox";
      # }
      # {
      #   plugin = onedark-nvim;
      #   config = "colorscheme onedark";
      # }

      solarized-nvim

      neodev-nvim

      nvim-cmp 

      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugin/telescope.lua;
      }

      {
        plugin = neo-tree-nvim;
        config = toLuaFile ./plugin/neotree.lua;
      }

      {
        plugin = toggleterm-nvim;
        config = toLuaFile ./plugin/toggleterm.lua;
      }

      telescope-fzf-native-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets


      lualine-nvim
      nvim-web-devicons
      # nvim-treesitter-parsers.astro
      # nvim-treesitter.withAllGrammars

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-lua
          p.tree-sitter-bash
          p.tree-sitter-json
          p.tree-sitter-html
          p.tree-sitter-css
          p.tree-sitter-typescript
          p.tree-sitter-php
        ]));
        config = toLuaFile ./plugin/treesitter.lua;
      }



      vim-nix

      # {
      #   plugin = vimPlugins.own-onedark-nvim;
      #   config = "colorscheme onedark";
      # }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';

    # extraLuaConfig = ''
    #   ${builtins.readFile ./options.lua}
    #   ${builtins.readFile ./plugin/lsp.lua}
    #   ${builtins.readFile ./plugin/cmp.lua}
    #   ${builtins.readFile ./plugin/telescope.lua}
    #   ${builtins.readFile ./plugin/treesitter.lua}
    #   ${builtins.readFile ./plugin/other.lua}
    # '';
  };



}
