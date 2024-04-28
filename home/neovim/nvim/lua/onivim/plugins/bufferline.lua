local bufferline = require('bufferline')

bufferline.setup {
    options = {
        mode = 'buffers',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                padding = 1,
            }
        },
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        enforce_regular_tabs = true,
        separator_style = 'thin',
        hover = {
            enabled = true,
            delay = 050,
            reveal = {'close'},
        },
    }
}
