vim.g.phpactorCompletionIgnoreCase = true

vim.keymap.set('n', '<leader>pp', ':PhpactorContextMenu<CR>')
vim.keymap.set('n', '<leader>pt', ':PhpactorTransform<CR>')
vim.keymap.set('v', '<leader>pm', ':<C-U>PhpactorExtractMethod<CR>')
vim.keymap.set('v', '<leader>pe', ':<C-U>PhpactorExtractExpression<CR>')
