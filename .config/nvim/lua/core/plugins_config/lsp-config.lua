vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>lx', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>lf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

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

vim.diagnostic.config({ virtual_text = false })

require('lspconfig').lua_ls.setup(
  coq.lsp_ensure_capabilities({})
)

require('lspconfig').phpactor.setup(
  coq.lsp_ensure_capabilities({})
)

require('lspconfig').graphql.setup(
  coq.lsp_ensure_capabilities({})
)

require('lspconfig').yamlls.setup(
  coq.lsp_ensure_capabilities({})
)

require('lspconfig').jsonls.setup(
  coq.lsp_ensure_capabilities({})
)

require('lspconfig').gopls.setup(
  coq.lsp_ensure_capabilities({})
)

require('lspconfig').html.setup(
  coq.lsp_ensure_capabilities({})
)
