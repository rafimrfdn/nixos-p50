-- Lualine
require("lualine").setup({
    icons_enabled = true,
    -- theme = 'onedark',
    theme = 'solarized',
})

-- Example config in lua Solarized
vim.g.solarized_italic_comments = true
vim.g.solarized_italic_keywords = true
vim.g.solarized_italic_functions = true
vim.g.solarized_italic_variables = false
vim.g.solarized_contrast = true
vim.g.solarized_borders = false
vim.g.solarized_disable_background = false
require('solarized').set()

-- Colorscheme
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme solarized")



-- Comment
require("Comment").setup()
