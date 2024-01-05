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

    extraPackages = with pkgs; [
	# install the languages
      rnix-lsp

	# clipboard tool
      xclip
      wl-clipboard

      cargo
    ];


    plugins = with pkgs.vimPlugins; [
	  vim-solarized8

      # status bar
      {
        plugin = lualine-nvim;
        config = toLua "require(\"lualine\").setup({icons_enabled = true, theme = \'solarized8\'})";
      }

#	  nvim-treesitter.withAllGrammars

	  neo-tree-nvim
	  plenary-nvim
	  nui-nvim
	  nvim-web-devicons

      {
        plugin = nvim-treesitter.withAllGrammars;
        config = toLuaFile ./plugin/treesitter.lua;
      }
    
      # completion
      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugin/cmp.lua;
      }
      	## Snippet Engine & its associated nvim-cmp source
	    luasnip
      	cmp_luasnip

      	## Adds LSP completion capabilities
      	cmp-nvim-lsp
      	cmp-path

      	# Adds a number of user-friendly snippets
      	friendly-snippets


      # LSP
      {
        plugin = mason-nvim;
        config = toLuaFile ./plugin/lsp.lua;
      }
	  mason-lspconfig-nvim
      nvim-lspconfig
      neodev-nvim

	#comment
      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

	# telescope
      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugin/telescope.lua;
      }
	# include this with telescope
      telescope-fzf-native-nvim

	# toggleterm
      {
        plugin = toggleterm-nvim;
        config = toLuaFile ./plugin/toggleterm.lua;
      }

      vim-nix

];
    

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
  };


}
