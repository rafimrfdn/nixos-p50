vim.opt.runtimepath:prepend("~/.local/share/parsers") -- make sure to create this parsers folder

require('nvim-treesitter.configs').setup {
    ensure_installed = {},

    -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "astro", "svelte", "typescript", "javascript", "csv", "go", "html", "json", "jsdoc", "php", "nix", "scss", "css", "sql", "tsx", "vue", "vento" },

    auto_install = false,

    parser_install_dir = "~/.local/share/parsers", -- make sure to create this parsers folder

    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
}

vim.treesitter.language.register("html", "vento") -- then you now be able to open the .vto/vento file
