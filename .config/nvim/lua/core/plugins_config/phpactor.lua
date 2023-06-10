vim.g.phpactorCompletionIgnoreCase = true

vim.keymap.set('n', '<leader>pp', ':PhpactorContextMenu<CR>', { silent = true })
vim.keymap.set('n', '<leader>pt', ':PhpactorTransform<CR>', { silent = true })
vim.keymap.set('v', '<leader>pm', ':<C-U>PhpactorExtractMethod<CR>', { silent = true })
vim.keymap.set('v', '<leader>pe', ':<C-U>PhpactorExtractExpression<CR>', { silent = true })
