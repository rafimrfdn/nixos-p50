-- nvim/lua/onivim/config.lua

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- run at the mill keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- SPACE + e + f to toggle nvim tree (open/close)
--vim.api.nvim_set_keymap("n", "<leader>ef", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ef", ":Neotree toggle right<cr>", { silent = true, noremap = true })
-- SPACE + e to focus nvim-tree, if nvim-tree is not open the it will open it
--vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFocus<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree focus right<cr>", { silent = true, noremap = true })

-- move between buffers (bufferline specific)
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<cr>", { silent = true, noremap = true })

-- closes current buffer with space + x
vim.keymap.set("n", "<leader>x", ":BufDel<cr>", {silent = true, noremap = true})

-- close other buffer ecept active one
vim.keymap.set("n", "<leader>z", ":BufDelOthers<CR>", {silent = true, noremap = true})


-- from my old option config
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Navigate vim panes better
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')




-- call neotree
vim.keymap.set('n', '<F4>', ':Neotree right toggle<CR>')

-- clipboard
vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true -- for relative numbers

-- indentation 4 spaces 
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- no less than 10 lines on screen
vim.o.scrolloff = 8

-- Save undo history
vim.o.undofile = true

-- Set highlight on search
vim.o.hlsearch = false

-- compatiblity/good colors
vim.o.termguicolors = true
-- vim.cmd.colorscheme 'solarized8'

-- hides the mode that shows up in the cmdline, it is redundant since lualine already shows us which mode we are in
vim.o.showmode = false

-- doing this to hide the original cmd line since we are already using a pop up from fine cmdline
vim.o.cmdheight = 0

-- makes it so we can have hover events from bufferline
vim.o.mousemoveevent = true

vim.o.mouse = 'a'

-- makes things show in one long line instead of wrapping (super annoying btw)
vim.o.wrap = false


-- teej kickstart feature
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
