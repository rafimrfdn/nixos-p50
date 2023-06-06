vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- require("nvim-tree").setup({
--   view = {
-- --    width = 30,
-- --    adaptive_size = false
--   }
-- })

--vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

vim.keymap.set('n', '<F3>', ':NvimTreeFindFileToggle<CR>')

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '.', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts('Print Node Path'))

  vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))
end



require("nvim-tree").setup({
  on_attach = on_attach,
    sort_by = "case_sensitive",
    view = {
        width = 50,
        side = "right"
    },
    filters = { 
        dotfiles = true
    }
    -- renderer = {
    --     group_empty = true;
    -- }
})

