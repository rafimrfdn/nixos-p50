-- Lualine
require("lualine").setup({
    icons_enabled = true,
    -- theme = 'onedark',
    theme = 'solarized',
    -- theme = 'gruvbox',
})

-- uncomment jika tidak ingin menggunakan solarized theme
-- vim.o.termguicolors = true

-- Colorscheme
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme tokyonight-storm")


-- -- Example config in lua
-- vim.g.solarized_italic_comments = true
-- vim.g.solarized_italic_keywords = true
-- vim.g.solarized_italic_functions = true
-- vim.g.solarized_italic_variables = false
-- vim.g.solarized_contrast = true
-- vim.g.solarized_borders = false
-- vim.g.solarized_disable_background = false
--
-- -- Load the colorscheme
-- require('solarized').set()


-- Comment
require("Comment").setup()
