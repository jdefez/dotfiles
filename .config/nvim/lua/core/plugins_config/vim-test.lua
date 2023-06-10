vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { silent = true })
vim.keymap.set('n', '<leader>tT', ':TestFile<CR>', { silent = true })
vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>', { silent = true })
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { silent = true })
vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>', { silent = true })

vim.g['test#php#phpunit#executable'] = './vendor/bin/phpunit'
vim.g['test#echo_command'] = false
vim.g['test#strategy'] = 'toggleterm'
vim.g['test#toggleterm#term_position'] = "vert"
vim.g['test#php#phpunit#options'] = '--testdox'
