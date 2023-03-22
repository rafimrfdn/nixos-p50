require'nvim-treesitter.configs'.setup {
--  -- A list of parser names, or "all"
--  ensure_installed = { "c", "lua", "vim" },
--
--  -- Install parsers synchronously (only applied to `ensure_installed`)
--  sync_install = false,
--  auto_install = true,
--  highlight = {
--    enable = true,
--  },


ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline" }, -- one of "all" or a list of languages
ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css" }, -- list of language that will be disabled
},
autopairs = {
    enable = true,
},
indent = { enable = true, disable = { "python", "css" } },

}

