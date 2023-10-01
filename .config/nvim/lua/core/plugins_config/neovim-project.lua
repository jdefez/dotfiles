-- Enable saving the state of plugins in the session
-- Save global variables that start with
-- an uppercase letter and contain at least one lowercase letter.
vim.opt.sessionoptions:append("globals")

-- setup neovim-project plugin
require("neovim-project").setup {
  -- define project roots
  projects = {
    "~/Code/*",
    "~/.config/nvim",
    "~/.config/kitty",
  },
}

vim.keymap.set('n',
  '<leader>P',
  '<cmd>Telescope neovim-project discover<CR>',
  { noremap = true, silent = true }
)
