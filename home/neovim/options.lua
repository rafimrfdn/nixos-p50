-- this is kickstart.nvim from teej
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- call neotree
vim.keymap.set('n', '<F4>', ':Neotree right toggle<CR>')

vim.o.relativenumber = true -- set relative numbered lines

vim.g.maplocalleader = ' '

vim.o.backspace = '2'
vim.o.showcmd = true
vim.o.laststatus = 2
vim.o.autoread = true
vim.o.shiftround = true

vim.o.pumheight = 10                          -- pop up menu height
vim.o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore

vim.o.splitbelow = true                       -- force all horizontal splits to go below current window
vim.o.splitright = true                       -- force all vertical splits to go to the right of current window
vim.o.swapfile = false                        -- creates a swapfile

vim.o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.expandtab = true                        -- convert tabs to spaces
vim.o.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.o.tabstop = 4                             -- insert 2 spaces for a tab

vim.o.conceallevel = 0
vim.o.wrap = false                            -- display lines as one long line
vim.o.linebreak = true                        -- companion to wrap, don't split words
vim.o.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
vim.o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.o.whichwrap = "bs<>[]hl"                  -- which "horizontal" keys are allowed to travel to prev/next line

-- end from my option config

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- set solarize color scheme
-- vim.cmd("set background=dark")
vim.cmd.colorscheme 'solarized8'

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

-- Lualine
-- require("lualine").setup({
--     icons_enabled = true,
--     -- theme = 'onedark',
--     -- theme = 'solarized',
-- })

