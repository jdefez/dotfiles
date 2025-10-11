vim.lsp.enable({
    "jsonls",
    -- "laravel_ls",
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
    end,
})

-- vim.lsp.set_log_level('debug')

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = false,
    virtual_line = false,
    float = {
        source = 'always',
        show_header = true,
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = false, -- default to false
    severity_sort = false,     -- default to false
})


vim.cmd("set completeopt+=noselect")
