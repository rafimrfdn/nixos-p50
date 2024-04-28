local on_attach = function(_, bufnr)

    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr, silent = true})
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>f', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_declaration)

    bufmap('gr', require('telescope.builtin').lsp_reference)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- we are going to change the symbols from diagnostics on the bar to the left <--
local signs = {Error = ' ', Warn = ' ', Info = '󰋼 ', Hint = '󰛨 '}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("neodev").setup({})
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
        root_dir = function()
        return vim.loop.cwd()
    end,
    cmd = { "lua-language-server" },
    settings = {
        Lua = {
            completion = { callSnippet = "Replace" },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

require('lspconfig').html.setup {
    capabilities = capabilities,
}
require('lspconfig').cssls.setup{
    capabilities = capabilities,
}
require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require('lspconfig').emmet_language_server.setup {
    capabilities = capabilities,
    filetypes = { 'css', 'html', 'javascript', 'javascriptreact', 'typescriptreact'},
}
require('lspconfig').nixd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
