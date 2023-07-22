local neogit = require('neogit')

neogit.setup({})

vim.keymap.set('n', '<leader>G', '<cmd>Neogit kind=vsplit<CR>', { noremap = true, silent = true })
