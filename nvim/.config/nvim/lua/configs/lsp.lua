--------------------------------------------------------------------------------
-- lsp configs
--------------------------------------------------------------------------------

vim.lsp.enable({
    "jsonls",
    "lemminx", -- xml
    "lua_ls",
    "pest_ls",
    "phpactor",
    "yamlls",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
        -- Enable inlay hints if supported by the language server
        -- if client:supports_method("textDocument/inlayHint") then
        --     vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        -- end
    end,
})

vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    virtual_line = false,
    float = {
        source = 'always',
        show_header = true,
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = false,
    severity_sort = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '💥',
            [vim.diagnostic.severity.WARN] = '⚠️',
            [vim.diagnostic.severity.INFO] = '💡',
            [vim.diagnostic.severity.HINT] = '🤘',
        },
    },
})
