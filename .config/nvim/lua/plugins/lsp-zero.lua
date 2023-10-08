return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  requires = {
    "SmiteshP/nvim-navic",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },
  opts = {},
  init = function()
    local lsp_zero = require("lsp-zero").preset({})
    lsp_zero.extend_lspconfig()

    vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = false,
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "phpactor",
        "lua_ls",
      },
      handlers = {
        lsp_zero.default_setup,
        -- phpactor = {
        -- 	["language_server_worse_reflection.inlay_hints.enable"] = true,
        -- 	["language_server_worse_reflection.inlay_hints.params"] = true,
        -- 	["language_server_worse_reflection.inlay_hints.types"] = true,
        -- },
      },
    })

    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

    lsp_zero.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>lx", ":CodeActionMenu<cr>", { silent = true, buffer = bufnr })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      vim.keymap.set({ "n", "x" }, "<leader>lf", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      end, opts)

      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end
    end)

    require("mason-null-ls").setup({
      ensure_installed = {
        "pint",
      },
      handlers = {},
    })
  end,
}
