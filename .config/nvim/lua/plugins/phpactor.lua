return {
  "phpactor/phpactor",
  lazy = true,
  opts = {},
  ft = 'php',
  init = function()
    vim.g.phpactorCompletionIgnoreCase = true
  end,
  keys = {
    { '<leader>pp', '<cmd>PhpactorContextMenu<CR>', desc = 'Phpactor Menu' },
    { mode = 'v', '<leader>pm', ':<C-U>PhpactorExtractMethod<CR>', desc = 'Phpactor extract method' },
    { mode = 'v', '<leader>pe', ':<C-U>PhpactorExtractExpression<CR>', desc = 'Phpactor extract expression' },
    -- { '<leader>pt', ':PhpactorTransform<CR>', desc = '' },
  }
}
