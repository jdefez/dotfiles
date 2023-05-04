-- vim.g.coq_settings = {
--   ['auto_start'] = true,
--   ['keymap.jump_to_mark'] = '<tab>',
--   ['keymap.eval_snips'] = '<leader>e',
-- }

-- local coq = require "coq"

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'phpactor',
    'graphql',
    'lemminx',
    'lua_ls',
    'yamlls',
    'jsonls',
    'sqlls',
    'html',
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
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
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

vim.diagnostic.config({ virtual_text = false })

-- coq.lsp_ensure_capabilities({})
require('lspconfig').sqlls.setup({
  capabilities = capabilities
})

require('lspconfig').lua_ls.setup({
  capabilities = capabilities
})

require('lspconfig').phpactor.setup({
  capabilities = capabilities
})

require('lspconfig').graphql.setup({
  capabilities = capabilities
})

require('lspconfig').yamlls.setup({
  capabilities = capabilities
})

require('lspconfig').jsonls.setup({
  capabilities = capabilities
})

require('lspconfig').html.setup({
  capabilities = capabilities
})

require('lspconfig').lemminx.setup({
  capabilities = capabilities
})
