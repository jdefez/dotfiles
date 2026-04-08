--------------------------------------------------------------------------------
-- ui
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.extra" },
    { src = "https://github.com/xiyaowong/virtcolumn.nvim" },
    { src = "https://github.com/okuuva/auto-save.nvim" },
    { src = "https://github.com/nvim-mini/mini.bufremove" },
    { src = "https://github.com/nvim-mini/mini.animate" },
    { src = "https://github.com/nvim-mini/mini.statusline" },
    { src = "https://github.com/nvim-mini/mini.sessions" },
    { src = "https://github.com/nvim-mini/mini.cmdline" },
    { src = "https://github.com/nvim-mini/mini.clue" },
    { src = "https://github.com/SmiteshP/nvim-navic" }, -- barbecue dependency
    { src = "https://github.com/utilyre/barbecue.nvim" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/backdround/global-note.nvim" },
})

--------------------------------------------------------------------------------
-- todo: implement this post https://www.reddit.com/r/neovim/comments/1sfmgkb/how_does_the_new_ui2_message_cmdline_replacement/

require('vim._core.ui2').enable()

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "msg",
-- 	callback = function()
-- 		local ui2 = require("vim._core.ui2")
-- 		local win = ui2.wins and ui2.wins.msg
-- 		if win and vim.api.nvim_win_is_valid(win) then
-- 			vim.api.nvim_set_option_value(
-- 				"winhighlight",
-- 				"Normal:NormalFloat,FloatBorder:FloatBorder",
-- 				{ scope = "local", win = win }
-- 			)
-- 		end
-- 	end,
-- })
--
-- local ui2 = require("vim._core.ui2")
-- local msgs = require("vim._core.ui2.messages")
-- local orig_set_pos = msgs.set_pos
-- msgs.set_pos = function(tgt)
-- 	orig_set_pos(tgt)
-- 	if (tgt == "msg" or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
-- 		pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
-- 			relative = "editor",
-- 			anchor = "NE",
-- 			row = 1,
-- 			col = vim.o.columns - 1,
-- 			border = "rounded",
-- 		})
-- 	end
-- end


--------------------------------------------------------------------------------

require('mini.extra').setup()
require("auto-save").setup({})
require("mini.bufremove").setup({})
require("mini.animate").setup({
    cursor = {
        enable = false
    }
})
require("mini.statusline").setup({})
require("barbecue").setup({
    theme = "default"
})
require("global-note").setup({})
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
require("mini.cmdline").setup({})
