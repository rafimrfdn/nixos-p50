-- will move to different file in future
local function lsp_name() -- this returns the name of the lsp
    local msg= 'No Lsp Detected'
    local buf_filetype = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_filetype) ~= -1 then
            return client.name
        end
    end
    return msg
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'kanagawa',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        ignore_focus = {
            "NvimTree"
        },
        always_divide_middle = false,
        refresh = {
            statusline = 1000,
        }
    },

    sections = {
        lualine_a = {
            {
                'mode',
                icons_enabled = true,
                icon = ''
            }
        },
        lualine_b = {
            'branch',
        },
        lualine_c = {
            {
                'diff',
                symbols = {added = ' ', modified = ' ', removed = ' '}
            }
        },
        lualine_x = {
            {
            'diagnostics',
            sources = { 'nvim_lsp' },
            sections = { 'error', 'warn', 'info', 'hint'},
            symbols = {error = ' ', warn = ' ', info = '󰋼 ', hint = '󰛨 '},
            update_in_insert = true,
            }
        },
        lualine_y = {
            {
                lsp_name,
                icon = ' LSP:',
            },
        },
        lualine_z = {'location'},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}
