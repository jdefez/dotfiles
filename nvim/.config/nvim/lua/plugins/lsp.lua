--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------

-- TODO: try this one: https://github.com/error311/wayfinder.nvim

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/gbprod/phpactor.nvim" },
    { src = "https://github.com/Chaitanyabsprip/fastaction.nvim" },
    { src = "https://github.com/iamkarasik/sonarqube.nvim" },
    { src = "https://github.com/ray-x/lsp_signature.nvim" },
    { src = "https://github.com/akioweh/lsp-document-highlight.nvim" },
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

local extension_path = vim.fn.stdpath("data") .. "/mason/packages/sonarlint-language-server/extension"
require("sonarqube").setup({
    lsp = {
        cmd = {
            vim.fn.exepath("java"),
            "-jar",
            extension_path .. "/server/sonarlint-ls.jar",
            "-stdio",
            "-analyzers",
            extension_path .. "/analyzers/sonargo.jar",
            extension_path .. "/analyzers/sonarhtml.jar",
            extension_path .. "/analyzers/sonariac.jar",
            extension_path .. "/analyzers/sonarjava.jar",
            extension_path .. "/analyzers/sonarjavasymbolicexecution.jar",
            extension_path .. "/analyzers/sonarjs.jar",
            extension_path .. "/analyzers/sonarphp.jar",
            extension_path .. "/analyzers/sonarpython.jar",
            extension_path .. "/analyzers/sonartext.jar",
            extension_path .. "/analyzers/sonarxml.jar",
        },
    },
    html = {
        enabled = true,
    },
    javascript = {
        enabled = true,
        clientNodePath = vim.fn.exepath("node")
    },
    php = {
        enabled = true,
    },
    text = {
        enabled = true,
    },
    xml = {
        enabled = true,
    },
    csharp = {
        enabled = false,
    },
    go = {
        enabled = false
    },
    iac = {
        enabled = false,
    },
    java = {
        enabled = false,
    },
    python = {
        enabled = false,
    },
})
require("lsp_signature").setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    }
})

require("lsp-document-highlight").setup({})
