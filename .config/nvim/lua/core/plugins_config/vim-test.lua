vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<leader>tT', ':TestFile<CR>')
vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>')
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>')

vim.g['test#php#phpunit#executable'] = './vendor/bin/phpunit'
vim.g['test#echo_command'] = false
vim.g['test#strategy'] = 'vimux'
vim.g['test#php#phpunit#options'] = '--testdox'
