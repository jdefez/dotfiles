--------------------------------------------------------------------------------
-- doom-one
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/NTBBloodbath/doom-one.nvim" },
})

vim.g.doom_one_cursor_coloring = false
vim.g.doom_one_terminal_colors = true
vim.g.doom_one_italic_comments = true
vim.g.doom_one_enable_treesitter = true
vim.g.doom_one_diagnostics_text_color = false
vim.g.doom_one_transparent_background = false

-- Pumblend transparency
vim.g.doom_one_pumblend_enable = false
vim.g.doom_one_pumblend_transparency = 20

-- Plugins integration
vim.g.doom_one_plugin_neogit = true
vim.g.doom_one_plugin_indent_blankline = true
vim.g.doom_one_plugin_neorg = false
vim.g.doom_one_plugin_barbar = false
vim.g.doom_one_plugin_telescope = false
vim.g.doom_one_plugin_nvim_tree = false
vim.g.doom_one_plugin_dashboard = false
vim.g.doom_one_plugin_startify = false
vim.g.doom_one_plugin_whichkey = false
vim.g.doom_one_plugin_vim_illuminate = false
vim.g.doom_one_plugin_lspsaga = false

vim.cmd("colorscheme doom-one")
vim.opt.background = "light"
