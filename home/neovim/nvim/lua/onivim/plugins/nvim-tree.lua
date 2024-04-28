-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- leave here cause something breaks, if this file doesn't load you can still use netwr

-- NvimTree always open
local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

-- empty setup using defaults
require("nvim-tree").setup({
    view = {
        width = 25,
    },
    sync_root_with_cwd = true,
    renderer = {
        group_empty = true,
        indent_width = 1,
        root_folder_label = false,
        highlight_git = true,
        indent_markers = {
            enable = true,
            inline_arrows = true,
        },
        icons = {
            show = {
                folder_arrow = false,
                git = false,
            },
        },
    },
    git = {
        show_on_dirs = false;
    }
})

-- NvimTree opens when I enter nvim
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
