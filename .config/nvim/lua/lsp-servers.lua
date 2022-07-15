---@diagnostic disable: undefined-global
-- lsp servers

-- function: on_attach attaching completion to lsp server
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

-- Create the language server config file. Configs file can be found here:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
-- /lua/lspconfig/language-server-name.lua

local servers = {
  'sumneko_lua', 'jsonls', 'yamlls', 'graphql', 'intelephense'
  -- 'emmet_ls', 'intelephense', 'phpactor', 'psalm', 'dockerls',
}


-- install instruction can be found here:
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run

require'lspconfig'.intelephense.setup{}

require'lspconfig'.sumneko_lua.setup{}

require'lspconfig'.graphql.setup{}

require'lspconfig'.jsonls.setup{}

-- require'lspconfig'.eslint.setup{}

-- require'lspconfig'.phpactor.setup{}

-- require'lspconfig'.emmet_ls.setup{}

-- require'lspconfig'.dockerls.setup{}

-- require'lspconfig'.psalm.setup{}

-- install info found here:
-- https://github.com/redhat-developer/yaml-language-server#getting-started
require'lspconfig'.yamlls.setup{}

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local m = require('mapx').setup({ global = 'skip', whichkey = true })

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- illuminate

  m.nname('', 'Illuminate')
  nnoremap('<A-n>', 'lua require"illuminate".next_reference{wrap=true}<cr>', 'Illuminate next')
  nnoremap('<A-p>', 'lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', 'Illuminate previous')

  -- lsp

  m.nname('g', 'lsp: navigation')
  nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Lsp: declaration')
  nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'Lsp: definition')
  nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'Lsp: references')
  nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Lsp: implementation')

  -- saga

  m.nname('<leader>l', 'Lsp')
  nnoremap('<leader>lr', ':Lspsaga rename<CR>', 'Rename')
  nnoremap('<leader>lk', ':Lspsaga hover_doc<cr>', 'Show documentation')
  nnoremap('<leader>ld', ':Lspsaga preview_definition<CR>', 'Preview definition')
  nnoremap('<leader>ls', ':Lspsaga signature_help<CR>', 'Signature help')
  nnoremap('<leader>lh', ':Lspsaga lsp_finder<CR>', 'Word definition and reference')
  nnoremap('<leader>lx', ':Lspsaga code_action<cr>', 'Show code actions')
  vnoremap('<leader>lx', ':<C-U>Lspsaga range_code_action<cr>', 'Show code actions')
  nnoremap('<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Lsp: format')

  require 'illuminate'.on_attach(client)
end

local lspconfig = require('lspconfig')
local coq = require('coq')

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(
    coq.lsp_ensure_capabilities({
      on_attach = on_attach,
      flags = { debounce_text_changes = 150 },
      capabilities = capabilities,
    })
  )
end
