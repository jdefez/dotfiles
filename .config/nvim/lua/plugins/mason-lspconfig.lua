return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "phpactor",
        "lua_ls",
      },
      handlers = {
        -- require("lsp-zero").default_setup,
      },
    }
}
