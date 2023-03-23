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



require("nvim-tree").setup({
   sort_by = "case_sensitive",
   view = {
       width = 50,
       side = "right",
       mappings = {
         custom_only = false,
         list = {
           { key = { "<C-]>", "<2-RightMouse>", "." },    action = "cd" },
           { key = ".", action = "cd" },
           { key = "<CR>", action = "open" },
           { key = "?", action = "toggle_help" },
           { key = "H", action = "toggle_hidden_filter" },
           { key = "a", action = "create" },
           { key = "y", action = "copy" },
           { key = "d", action = "remove" },
           { key = "x", action = "cut" },
           { key = "p", action = "paste" },
           { key = "r", action = "rename" },
           { key = "R", action = "Reload" },
         }
       }
     },
   filters = {
       dotfiles = true,
     },
   renderer = {
       group_empty = true,
     }
   })
