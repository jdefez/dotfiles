--------------------------------------------------------------------------------
-- TODO:
--------------------------------------------------------------------------------
-- Install and try this package: https://github.com/ccaglak/phptools.nvim
-- Add sessions and sessions configs for git, phpactor and zsh
-- try phpactor lua plugin : https://github.com/gbprod/phpactor.nvim/tree/main

--------------------------------------------------------------------------------
-- modules
--------------------------------------------------------------------------------

require('modules.session_helper').configure({
    -- NOTE: additional configurations for dofiles project sessions
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
