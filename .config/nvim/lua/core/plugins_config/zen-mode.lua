local zenmode = require("zen-mode")

zenmode.setup({
  options = {
    signcolumn = "no",      -- disable signcolumn
    number = false,         -- disable number column
    relativenumber = false, -- disable relative numbers
    -- cursorline = false, -- disable cursorline
    -- cursorcolumn = false, -- disable cursor column
    -- foldcolumn = "0", -- disable fold column
    -- list = false, -- disable whitespace characters
  },
  plugins = {
    gitsigns = { enabled = true },
    kitty = { enabled = true },
  },
})

vim.keymap.set('n', '<leader>z', zenmode.toggle, { noremap = true, silent = true })
