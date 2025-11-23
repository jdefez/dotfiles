--------------------------------------------------------------------------------
-- TODO:
--------------------------------------------------------------------------------
-- Install and try this package: https://github.com/ccaglak/phptools.nvim
-- Add sessions and sessions configs for git, phpactor and zsh

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

require('plugins/ui')
require('plugins/lsp')
require('plugins/git')
require('plugins/edit')
require('plugins/move')
require('plugins/treesitter')
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
