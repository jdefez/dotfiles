local export = {};
function export.on_attach(client, bufnr)
  local m = require('mapx').setup({ global = false, whichkey = true })
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  m.nname('g', 'lsp: navigation')
  nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Lsp: declaration')
  nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'Lsp: definition')
  nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'Lsp: references')
  nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Lsp: implementation')

  -- saga

  m.nname('<leader>l', 'Lsp')
  nnoremap('<leader>lr', ':Lspsaga rename<CR>', 'Rename')
  nnoremap('<leader>lk', ':Lspsaga hover_doc<cr>', 'Show documentation')
  nnoremap('<leader>ld', ':Lspsaga peek_definition<CR>', 'Peek definition')
  nnoremap('<leader>lh', ':Lspsaga lsp_finder<CR>', 'Word definition and reference')
  nnoremap('<leader>lx', ':Lspsaga code_action<cr>', 'Show code actions')
  vnoremap('<leader>lx', ':<C-U>Lspsaga range_code_action<cr>', 'Show code actions')
  nnoremap('<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', 'format')

  -- illuminate

  -- m.nname('', 'Illuminate')
  -- nnoremap('<M-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', 'Illuminate next')
  -- nnoremap('<M-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', 'Illuminate previous')
  -- require 'illuminate'.on_attach(client)
end

return export
