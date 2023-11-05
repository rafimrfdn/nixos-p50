-- require('nvim-treesitter.configs').setup {
--     ensure_installed = {},
--
--     auto_install = false,
--
--     highlight = { enable = true },
--
--     indent = { enable = true },
-- }



require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = { "c", "lua", "rust", "ruby", "vim" },
  --
  -- -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,
  -- auto_install = true,
  -- highlight = {
  --   enable = true,
  -- },
  --
    ensure_installed = {}, -- one of "all" or a list of languages
    -- ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },

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
