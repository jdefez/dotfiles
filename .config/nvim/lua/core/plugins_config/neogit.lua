local neogit = require('neogit')

-- TODO: check highlight configurations

neogit.setup({
  integrations = {
    diffview = true,
  },
})

vim.keymap.set('n', '<leader>G', '<cmd>Neogit kind=vsplit<CR>', { noremap = true, silent = true })
