--------------------------------------------------------------------------------
-- ui
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/echasnovski/mini.extra" },
    { src = "https://github.com/xiyaowong/virtcolumn.nvim" },
    { src = "https://github.com/okuuva/auto-save.nvim" },
    { src = "https://github.com/echasnovski/mini.bufremove" },
    { src = "https://github.com/echasnovski/mini.animate" },
    { src = "https://github.com/echasnovski/mini.statusline" },
    { src = "https://github.com/echasnovski/mini.sessions" },
    { src = "https://github.com/echasnovski/mini.clue" },
    { src = "https://github.com/SmiteshP/nvim-navic" }, -- barbecue dependency
    { src = "https://github.com/utilyre/barbecue.nvim" },
    { src = "https://github.com/echasnovski/mini.starter" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/backdround/global-note.nvim"},
})

require('mini.extra').setup()
require("auto-save").setup({})
require("mini.bufremove").setup({})
require("mini.animate").setup({
    cursor = {
        enable = false
    }
})
require("mini.statusline").setup({})
require("mini.starter").setup({})
require("barbecue").setup({
    theme = "default"
})
require("global-note").setup({
    -- TODO: add global note config
})
require("mini.sessions").setup({
    autoread = false,
    autowrite = true,
    hooks = {
        post = {
            read = require('modules.session_helper').find_root_dir,
        },
    }
})
require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})
