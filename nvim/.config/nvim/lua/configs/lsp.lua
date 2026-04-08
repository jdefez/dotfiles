--------------------------------------------------------------------------------
-- lsp configs
--------------------------------------------------------------------------------

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
            completion = {
                callSnippet = "Replace"
            },
        },
    },
})

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

        if client == nil then
            return
        end

        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
    end,
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    virtual_line = false,
    update_in_insert = false,
    severity_sort = false,
    float = {
        source = true,
        show_header = true,
        border = 'rounded',
        focusable = false,
    },
    signs = {
        text = {
            [severity.ERROR] = '💥',
            [severity.WARN] = '⚠️',
            [severity.INFO] = '💡',
            [severity.HINT] = '🤘',
        },
    },
})
