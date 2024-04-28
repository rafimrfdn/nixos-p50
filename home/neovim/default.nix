{pkgs, lib, ...}: #vim.opt.fillchars = 'eob: ' <-- changes eob from ~ to spaces (works better with opacity)

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        extraLuaConfig = ''
            require("onivim")
            vim.opt.fillchars = 'eob: '
            '';
        plugins = with pkgs.vimPlugins;
        let 
            onivim = pkgs.vimUtils.buildVimPlugin { #can also fetch from github
                name = "onivim";
                src = ./nvim;
            };
            fromGithub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin { #this is a interface that fetches from github
                pname = "${lib.strings.sanitizeDerivationName repo}";
                version = ref;
                src = builtins.fetchGit {
                    url = "http://github.com/${repo}.git";
                    ref = ref;
                    rev = rev;
                };
            };
        in 
            [

            ### VISUAL ###
            kanagawa-nvim
            bufferline-nvim
            nvim-tree-lua
            nvim-web-devicons
            lualine-nvim
            nvim-colorizer-lua # show colors that were written
            indent-blankline-nvim # show indentation lines
            dressing-nvim #makes the pop uis for input and select look nicer
            lspkind-nvim #nice icons for cmp
            noice-nvim # ui overhaul
            nvim-notify # noice requires this
            nui-nvim # noice requires this
            #telescope
            plenary-nvim
            telescope-nvim
            #bufdeletion without messing up window layout
            nvim-bufdel
            #github
            gitsigns-nvim
            #lsp
            nvim-lspconfig
            #autocompletion
            nvim-cmp
            cmp-nvim-lsp
            cmp_luasnip
            cmp-path
            cmp-buffer
            #discord
            presence-nvim
            #auto pairs of special characters and tags
            nvim-autopairs
            nvim-ts-autotag
            #snippets
            friendly-snippets
            luasnip
            #neodev to see vim configs/apis
            neodev-nvim
            #treesitter
            nvim-treesitter.withAllGrammars

            onivim # my config file

            ];
        extraPackages = with pkgs; [
            wl-clipboard
            lua-language-server
            nixd
            nodePackages.vscode-langservers-extracted
            nodePackages.typescript-language-server
            emmet-language-server
        ];
    };
}
