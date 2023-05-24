require('mason').setup()
require("lsp-format").setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'phpactor',
    'graphql',
    'lemminx',
    'lua_ls',
    'yamlls',
    'jsonls',
    'html',
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client)
  require("lsp-format").on_attach(client)
end

vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>lx', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

vim.diagnostic.config({ virtual_text = false })

require('lspconfig').sqlls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').phpactor.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').graphql.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').yamlls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').lemminx.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
