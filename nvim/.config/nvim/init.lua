--------------------------------------------------------------------------------
-- TODO:
--------------------------------------------------------------------------------
-- Install and try:
--  - SonarQube server: https://github.com/sonarsource/sonarlint.nvim
--  - Treesitter text objects (branch: main)

--------------------------------------------------------------------------------
-- Modules
--------------------------------------------------------------------------------

-- NOTE: provides with pathes for dofiles project sessions

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
        {
            session_name = "fish",
            dir = vim.fn.expand('~/dotfiles/fish/.config/fish')
        },
    }
})

--------------------------------------------------------------------------------
-- Configs
--------------------------------------------------------------------------------

require('configs.options')
require('configs.lsp')

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

require('plugins')

--------------------------------------------------------------------------------
-- Commands
--------------------------------------------------------------------------------

require('commands')

--------------------------------------------------------------------------------
-- Keymaps
--------------------------------------------------------------------------------

require('keymaps')

--------------------------------------------------------------------------------
-- color scheme
--------------------------------------------------------------------------------

require('colorschemes')
