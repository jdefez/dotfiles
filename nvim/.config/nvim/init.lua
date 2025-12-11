--------------------------------------------------------------------------------
-- TODO:
--------------------------------------------------------------------------------
-- Create a command to copy file path to clipboard
--  - https://neovim.io/doc/user/api.html#nvim_buf_get_name() `vim.api.nvim_buf_get_name(0)`
--
-- Install and try this package: https://github.com/ccaglak/phptools.nvim
-- Add sessions and sessions configs: zsh

--------------------------------------------------------------------------------
-- modules
--------------------------------------------------------------------------------

-- NOTE: additional configurations for dofiles project sessions
require('modules.session_helper').configure({
    project_directories = {
        {
            session_name = "neovim",
            dir = vim.fn.expand('~/dotfiles/nvim/.config/nvim')
        },
        {
            session_name = "ghostty",
            dir = vim.fn.expand('~/dotfiles/ghostty/.config/ghostty')
        },
        {
            session_name = "git",
            dir = vim.fn.expand('~/dotfiles/git/')
        },
        {
            session_name = "phpactor",
            dir = vim.fn.expand('~/dotfiles/phpactor/.config/phpactor')
        },
    }
})

--------------------------------------------------------------------------------
-- configs
--------------------------------------------------------------------------------

require('configs/options')
require('configs/lsp')

--------------------------------------------------------------------------------
-- plugins
--------------------------------------------------------------------------------

require('plugins/plenary')
require('plugins/icons')
require('plugins/treesitter')
require('plugins/lsp')
require('plugins/ui')
require('plugins/git')
require('plugins/edit')
require('plugins/move')
require('plugins/colorscheme')

--------------------------------------------------------------------------------
-- commands
--------------------------------------------------------------------------------

require('commands/pack')
-- require('commands/playground')

--------------------------------------------------------------------------------
-- keymaps
--------------------------------------------------------------------------------

require('keymaps')
