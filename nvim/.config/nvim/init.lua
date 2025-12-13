--------------------------------------------------------------------------------
-- TODO:
--------------------------------------------------------------------------------
-- Install and try this packages: 
--  - https://github.com/ccaglak/phptools.nvim
--  - sonarQube server: https://github.com/sonarsource/sonarlint.nvim
-- Add sessions and sessions configs for: zsh

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

require('configs.options')
require('configs.lsp')

--------------------------------------------------------------------------------
-- plugins
--------------------------------------------------------------------------------

require('plugins')

--------------------------------------------------------------------------------
-- commands
--------------------------------------------------------------------------------

require('commands')

--------------------------------------------------------------------------------
-- keymaps
--------------------------------------------------------------------------------

require('keymaps')
