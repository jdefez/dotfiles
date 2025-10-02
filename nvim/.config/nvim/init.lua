require('configs')
require('keymaps')
require('plugins')

require('lsp')
require('treesitter')

require("mason").setup({})

-- moving

local keymap = vim.keymap

require "mini.pick".setup()
keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fw", ":Pick grep<CR>", { desc = "Grep" })
keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find help" })
keymap.set("n", "<leader>fr", ":Pick resume<CR>", { desc = "Mini pick resume" })

require "oil".setup()
keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil explore" })

require("flash").setup({})
keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash jump" })
keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash treesitter" })
keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Flash Treesitter search" })

require("quicker").setup({})
keymap.set({ "n" }, "<leader>q", function() require("quicker").toggle() end, {desc = "Close quickfix"})
keymap.set({ "n"}, ">", function() require("quicker").expand { before = 2, after = 2, add_to_existing = true } end, {desc = "Expand quickfix context"})
keymap.set({ "n"}, "<", function() require("quicker").collapse() end, {desc = "Collapse quickfix context"})

-- git

require('gitsigns').setup({ signcolumn = true })

require("neogit").setup({})
keymap.set("n", "<leader>G", "<cmd>Neogit kind=vsplit<CR>", { desc = "Neogit open" })

-- editing

require("nvim-surround").setup({})

require("fastaction").setup({})
keymap.set(
    { 'n', 'x' },
    '<leader>ca',
    '<cmd>lua require("fastaction").code_action({ select_first = true })<CR>',
    { desc = "Select and apply first code action", buffer = bufnr }
)

-- UI
require("ibl").setup()

-- vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")
vim.cmd("hi DiagnosticUnderlineError gui=undercurl")
vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl")
