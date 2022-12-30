vim.keymap.set('n', 'Y', 'yy$')
vim.keymap.set('i', 'jj', '<ESC>')

vim.keymap.set('n', '<S-Up>', ':m .-2<CR>==')
vim.keymap.set('n', '<S-Down>', ':m .+1<CR>==')
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv")
