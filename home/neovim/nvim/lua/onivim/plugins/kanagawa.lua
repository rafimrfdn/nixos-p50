-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {},
            all = {
                ui = {
                    bg_gutter = "none",
                },
            }
        },
    },
    overrides = function(colors) -- add/modify highlights
        local util = require("kanagawa.lib.color")
        local theme_colors = colors.theme

        return {
            BufferLineIndicatorSelected = { fg = theme_colors.syn.preproc },
            NvimTreeNormal = { bg = theme_colors.ui.bg_m1 },
            DiagnosticVirtualTextError = { bg = util(theme_colors.diag.error):blend(theme_colors.ui.bg, 0.96):to_hex(), fg = theme_colors.diag.error},
            DiagnosticVirtualTextWarn = { bg = util(theme_colors.diag.warning):blend(theme_colors.ui.bg, 0.96):to_hex(), fg = theme_colors.diag.warning},
            DiagnosticVirtualTextInfo = { bg = util(theme_colors.diag.info):blend(theme_colors.ui.bg, 0.96):to_hex(), fg = theme_colors.diag.info},
            DiagnosticVirtualTextHint = { bg = util(theme_colors.diag.hint):blend(theme_colors.ui.bg, 0.96):to_hex(), fg = theme_colors.diag.hint},
        }
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
