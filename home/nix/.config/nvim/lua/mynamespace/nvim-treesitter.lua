require'nvim-treesitter.configs'.setup {
  -- install language parser
  -- :TSInstallInfo Command to view supported languages
  ensure_installed = {"css", "vim", "lua", "javascript", "typescript", "yaml", "toml", "json", "php", "astro", },
  -- Enable code highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  -- Enable incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  autotag = {
    enable = true,
  },
  -- Enable based on Treesitter Code formatting for (=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  }
}
-- Turn on Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- Don't collapse by default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
