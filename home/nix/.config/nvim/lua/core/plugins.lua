local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- 'wbthomason/packer.nvim',
  -- 'ellisonleao/gruvbox.nvim',
  -- {
  --   'dracula/vim',
  --   lazy = false,
  -- },
--  'bluz71/vim-nightfly-colors',
  -- 'rose-pine/neovim',
  'navarasu/onedark.nvim',

  "nvim-neo-tree/neo-tree.nvim",
  "MunifTanjim/nui.nvim",

  -- 'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'vim-test/vim-test',
  -- 'lewis6991/gitsigns.nvim',
  -- 'preservim/vimux',
  -- 'christoomey/vim-tmux-navigator',
  'tpope/vim-fugitive',
  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',         -- Optional
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  -- "github/copilot.vim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- "nvimdev/lspsaga.nvim",

  -- My own useful plugin
  'akinsho/toggleterm.nvim', -- run terminal on vim
  'numToStr/Comment.nvim', -- for commenting support
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

}


local opts = {}

require("lazy").setup(plugins, opts)
