-- Visuals
vim.opt.number = true -- show line numbers
vim.opt.cursorline = true -- highlight the line with the cursor
vim.opt.colorcolumn = "81" -- mark 80 and 120 columns
vim.opt.termguicolors = true -- enable 24-bit colors
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}

-- Editing
vim.opt.commentstring = '# %s' -- default to '#' as a comment character

-- Indentation
vim.opt.expandtab = true -- use spaces, not tabs, by default
vim.opt.smartindent = true -- automatically indent and dedent
vim.opt.shiftwidth = 4 -- shift left and right by 2
vim.opt.softtabstop = 2 -- insert 2 spaces when typing <Tab>
vim.opt.tabstop = 4 -- render tabs as 2 spaces

-- Search
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- stop ignoring case when uppercase is used

-- Save and load
---- reload the file when re-entering the buffer
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  pattern = "*",
  command = "checktime",
})
---- save the file when leaving the buffer
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  callback = function(event)
    -- only for normal buffers
    if not vim.bo[event.buf].buftype then
      vim.cmd("update")
    end
  end,
})
---- save when moving around using tmux navigator
vim.g.tmux_navigator_save_on_switch = 1

-- Leader
vim.g.mapleader = " " -- set the leader key to <Space>

-- Disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Launch NeoTree
vim.keymap.set('n', '<F4>', ':Neotree right toggle<CR>')
-- vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope oldfiles<cr>')

vim.opt.isfname:append("@-@")

vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.


-- from my old option config
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autoread = true
vim.opt.shiftround = true

vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore

vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.signcolumn = "yes"
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.linebreak = true                        -- companion to wrap, don't split words
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.whichwrap = "bs<>[]hl"                  -- which "horizontal" keys are allowed to travel to prev/next line
-- end from my option config



-- Set up lazy.nvim, the plugin manager
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

---- Update plugins weekly
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local lazy_update_timestamp_path = vim.env.HOME .. "/.cache/nvim/update.timestamp"
    local lazy_update_timestamp_file = io.open(lazy_update_timestamp_path, "r")
    if lazy_update_timestamp_file then
      lazy_update_timestamp = tonumber(lazy_update_timestamp_file:read("a"))
      print(lazy_update_timestamp)
      lazy_update_timestamp_file:close()
    else
      lazy_update_timestamp = 0
    end

    current_timestamp = os.time()
    if current_timestamp > lazy_update_timestamp + (60 * 60 * 24 * 7) then -- update weekly
      require("lazy").update()
      lazy_update_timestamp_file = assert(io.open(lazy_update_timestamp_path, "w"))
      lazy_update_timestamp_file:write(tostring(current_timestamp))
      lazy_update_timestamp_file:close()
    end
  end
})

-- Initialize plugins
local plugins = {
  { "folke/tokyonight.nvim", lazy = false }, -- pretty colors
  {"lifepillar/vim-solarized8", lazy = false},

  {'akinsho/toggleterm.nvim', version = "*", config = true}, -- togggleterm


  { "tpope/vim-repeat" }, -- better repeat (`.`) semantics
  { "tpope/vim-surround" }, -- add, remove, and modify surrounding characters
  { "tpope/vim-commentary" }, -- comment and uncomment lines

  { "christoomey/vim-tmux-navigator" }, -- navigate tmux easily
  { "folke/which-key.nvim" }, -- show keybinding help as you type

  { "akinsho/bufferline.nvim", -- buffers as tabs
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "nvim-lualine/lualine.nvim", -- a useful status bar
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "nvim-telescope/telescope.nvim", -- fuzzy search
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- completion
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-path"},         -- Optional
  {"L3MON4D3/LuaSnip"},
  {"saadparwaiz1/cmp_luasnip"},
  {"rafamadriz/friendly-snippets"},
  { "nvim-telescope/telescope-ui-select.nvim" }, -- override the selection UI with Telescope

  -- { "nvim-tree/nvim-tree.lua"}, -- file browsing
  { "MunifTanjim/nui.nvim"},
  { "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    -- tag = "nightly",
  },

  { "nvim-treesitter/nvim-treesitter", -- syntax highlighting
    build = ":TSUpdate",
  },

  {"williamboman/mason.nvim" }, --setup Mason
  {"williamboman/mason-lspconfig.nvim"},

  { "neovim/nvim-lspconfig" }, -- LSP helpers
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }, -- multiple LSP diagnostics per line

    {"williamboman/nvim-lsp-installer"},

}

require("lazy").setup(plugins)

-- Set the color scheme
-- vim.cmd("colorscheme tokyonight-night") -- seems to work best with my Alacritty theme

-- to activate solarized8 as default color scheme, you can switch color scheme 
-- example :colorscheme tokyonight
vim.cmd("set background=dark")
vim.cmd("colorscheme solarized8") 




-- Initialize plugins that need it
require("bufferline").setup()
require("lualine").setup()
--require("nvim-tree").setup()
require("mason").setup()

require("mason-lspconfig").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())


local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    -- ui = {
    --     icons = {
    --         server_installed = "✓",
    --         server_pending = "➜",
    --         server_uninstalled = "✗"
    --     }
    -- }
})

require('neo-tree').setup ()

-- Set up fuzzy search and the fancy selection UI
require("telescope").setup{
  defaults = {
    layout_strategy = "horizontal", -- better for thinner windows
    file_ignore_patterns = {
      "^%.git/", -- explicitly filter out any files in the .git directory
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
}

require("telescope").load_extension("ui-select")

-- Set up key bindings
--local nvimTreeApi = require("nvim-tree.api")
local telescopeBuiltin = require("telescope.builtin")

--vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space>ff', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<Space><Space>', telescopeBuiltin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<Space>fh', telescopeBuiltin.help_tags, {})



-- Set up syntax highlighting
--require("nvim-treesitter.configs").setup {
--  auto_install = true,
--
--  highlight = {
--    enable = true,
--    additional_vim_regex_highlighting = false,
--  },
--
--  indent = {
--    enable = true,
--  },
--}

require'nvim-treesitter.configs'.setup {
ensure_installed = { "nix", "c", "svelte", "astro", "json", "lua", "typescript", "html", "css", "yaml", "php" }, -- one of "all" or a list of languages
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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Configure LSP servers
local lspconfig = require("lspconfig")
---- a little hack to get the environment from direnv before running
---- to do:
----   - add a command for "allow"
----   - add a command for "deny"
----   - handle errors nicely
----   - factor into a plugin
lspconfig.util.on_setup = lspconfig.util.add_hook_before(lspconfig.util.on_setup, function(config)
  config.cmd = { "direnv", "exec", ".", unpack(config.cmd) }
end)
lspconfig.hls.setup {
  filetypes = { "haskell", "lhaskell", "cabal" }, -- configure HLS to run on Cabal files too
}
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
lspconfig.tsserver.setup {}



-- completion copas dari config pertama
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}





-- Use lsp_lines for diagnostics
require("lsp_lines").setup()
vim.diagnostic.config({
  virtual_text = false,
})

-- Reformat code on write, if LSP is initialized.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(lsp_event)
    vim.api.nvim_create_autocmd("BufWrite", {
      buffer = lsp_event.buf,
      callback = function(event)
        vim.lsp.buf.format({
          bufnr = event.buf,
          async = false,
          timeout_ms = 250,
        })
      end,
    })
  end
})



local wk = require("which-key")

---- bind my foot pedal to insert mode
----   on press, sends <F12>
----   on release, sends <F11>
vim.keymap.set("n", "<F12>", "i", { noremap = true })
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope oldfiles<cr>", { noremap = true })
vim.keymap.set({"i", "v"}, "<F12>", "", { noremap = true }) -- do nothing when already there
vim.keymap.set({"i", "v"}, "<F11>", "<Esc>", { noremap = true })


---- most keybindings are behind the Leader key
wk.register({
  -- <Space> = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
  a = { vim.lsp.buf.code_action, "action" },
  b = { name = "buffers",
    b = { telescopeBuiltin.buffers, "all" },
    d = {
      name = "close",
      d = { "<cmd>bdelete<cr>", "this" },
      o = { "<cmd>BufferLineCloseOthers<cr>", "others" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "to the left" },
      l = { "<cmd>BufferLineCloseRight<cr>", "to the right" },
    },
    n = { "<cmd>BufferLineCycleNext<cr>", "next" },
    p = { "<cmd>BufferLineCyclePrev<cr>", "previous" },
    N = { "<cmd>BufferLineMoveNext<cr>", "move next" },
    P = { "<cmd>BufferLineMovePrev<cr>", "move previous" },
  },
  d = {
    name = "diagnostics",
    d = { telescopeBuiltin.diagnostics, "all" },
    n = { vim.diagnostic.goto_next, "go to next" },
    p = { vim.diagnostic.goto_prev, "go to previous" },
  },
  f = {
    name = "files",
    f = { function() telescopeBuiltin.find_files({ hidden = true }) end, "all" },
    r = { telescopeBuiltin.oldfiles, "recent" },
    s = { "<cmd>write<cr>", "save" },
    --t = { function() nvimTreeApi.tree.open({ find_file = true }) end, "tree" },
    t = { ":Neotree right toggle<CR>", "tree" },
  },
  g = {
    name = "git",
    s = { telescopeBuiltin.git_status, "status" },
  },
  j = {
    name = "jump to",
    D = { vim.lsp.buf.declaration, "declaration" },
    d = { telescopeBuiltin.lsp_definitions, "definition" },
    i = { telescopeBuiltin.lsp_implementations, "implementation" },
    r = { telescopeBuiltin.lsp_references, "references" },
    t = { telescopeBuiltin.lsp_type_definitions, "type definition" },
  },
  r = {
    name = "refactor",
    f = { vim.lsp.buf.format, "format" },
    r = { vim.lsp.buf.rename, "rename" },
  },
  s = {
    name = "search",
    c = { "<cmd>nohlsearch<cr>", "clear highlight" },
    r = { telescopeBuiltin.resume, "resume" },
    s = { function() telescopeBuiltin.live_grep({ hidden = true }) end, "text" },
    w = { telescopeBuiltin.grep_string, "current word" },
  },
}, { prefix = "<leader>" })

---- but not everything
wk.register({
  K = { vim.lsp.buf.hover, "hover" },
  ["<C-Left>"] = { "<cmd>BufferLineCyclePrev<cr>", "previous buffer" },
  ["<C-Right>"] = { "<cmd>BufferLineCycleNext<cr>", "next buffer" },
  ["<C-S-Left>"] = { "<cmd>BufferLineMovePrev<cr>", "move buffer to previous" },
  ["<C-S-Right>"] = { "<cmd>BufferLineMoveNext<cr>", "move buffer to next" },
})
