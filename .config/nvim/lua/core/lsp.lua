local lspconfig = require("lspconfig")
local mason_lsp = require("mason-lspconfig")

require("mason").setup({})

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
  severity_sort = true,
  float = {
    show_header = true,
    source = "if_many",
    border = "rounded",
    focusable = false,
  },
})

mason_lsp.setup({
  ensure_installed = {
    "phpactor",
    "lua_ls",
  },
  automatic_installation = true,
})

local function on_attach(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  vim.keymap.set("n", "<space>K", vim.diagnostic.open_float, { buffer = bufnr, desc = "Hover diagnostic (lsp)" })
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition (lsp)" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration (lsp)" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation (lsp)" })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition (lsp)" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References (lsp)" })
  vim.keymap.set("n", "gO", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "Outgoing calls (lsp)" })
  vim.keymap.set("n", "go", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "Incoming calls (lsp)" })
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = false })
  end, { buffer = bufnr, desc = "Prev diagnostic" })
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({ float = false })
  end, { buffer = bufnr, desc = "Next diagnostic" })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lsp.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      inlay_hints = { enabled = true },
    })
  end,
})
