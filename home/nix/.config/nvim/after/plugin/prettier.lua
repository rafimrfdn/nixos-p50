local prettier = require("prettier")

prettier.setup({
--  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  bin = 'prettierd', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "lua",
    "astro",
  },
})

