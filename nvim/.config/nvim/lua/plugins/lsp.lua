--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/gbprod/phpactor.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/Chaitanyabsprip/fastaction.nvim" },
})

require("lspconfig")
require("mason").setup({})
require("fastaction").setup({})
require("phpactor").setup({
    install = {
        path = vim.fn.stdpath("data") .. "/mason/packages/",
        branch = "master",
        bin = vim.fn.stdpath("data") .. "/mason/packages/phpactor/phpactor.phar",
        php_bin = "php",
        composer_bin = "composer",
        git_bin = "git",
        check_on_startup = "none",
    },
    lspconfig = {
        enabled = false,
        options = {},
    },
})

-- Configure lua_ls for Neovim development
vim.lsp.config('lua_ls', {
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

-- initialize lsp config

vim.lsp.enable({
    "jsonls",
    "lemminx", -- xml
    "lua_ls",
    "pest_ls",
    "phpactor",
    "yamlls",
})
