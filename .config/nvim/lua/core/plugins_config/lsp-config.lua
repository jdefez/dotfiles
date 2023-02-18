vim.g.coq_settings = {
  ['auto_start'] = true,
  ['keymap.jump_to_mark'] = '<tab>',
  ['keymap.eval_snips'] = '<leader>e',
}

local coq = require "coq"

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'phpactor',
    'graphql',
    'lua_ls',
    'yamlls',
    'jsonls',
    'gopls',
    'html',
  }
})

local on_attach = function(_, _)
  -- handled by lsp-saga
  -- vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, {})
  -- vim.keymap.set('n', '<leader>lx', vim.lsp.buf.code_action, {})
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
end

require('lspconfig').lua_ls.setup(
  coq.lsp_ensure_capabilities({
    on_attach = on_attach
  })
)

require('lspconfig').phpactor.setup(
  coq.lsp_ensure_capabilities({
    on_attach = on_attach
  })
)

require('lspconfig').graphql.setup(
  coq.lsp_ensure_capabilities({
    on_attach = on_attach
  })
)

require('lspconfig').yamlls.setup(
  coq.lsp_ensure_capabilities({
    on_attach = on_attach
  })
)

require('lspconfig').jsonls.setup(
  coq.lsp_ensure_capabilities({
    on_attach = on_attach
  })
)

require('lspconfig').gopls.setup(
  coq.lsp_ensure_capabilities({
    on_attach = on_attach
  })
)

require('lspconfig').html.setup(
  coq.lsp_ensure_capabilities({
    on_attach = on_attach
  })
)
