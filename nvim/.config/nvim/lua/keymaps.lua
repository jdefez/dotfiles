local keymap = vim.keymap

keymap.set('n', 'Y', 'yy$')
keymap.set("i", "<S-TAB>", "<C-x><C-o>", { desc = "Trigger completion" })
keymap.set("n", "<C-s>", ":write<CR>", { desc = "Save" })
keymap.set("n", "<leader>s", ":update<CR> :source<CR>", { desc = "Update and source" })
keymap.set("i", "jk", "<ESC>", { desc = "Escape" })
keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
keymap.set("n", "<leader>x", ":bdelete<cr>", { desc = "Close buffer" })
keymap.set("n", "<C-h>", "<c-w>h", { desc = "To left split" })
keymap.set("n", "<C-l>", "<c-w>l", { desc = "To right split" })
keymap.set("n", "<C-k>", "<c-w>k", { desc = "To top split" })
keymap.set("n", "<C-j>", "<c-w>j", { desc = "To bottom split" })

-- mini.pick

keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fw", ":Pick grep<CR>", { desc = "Grep" })
keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find help" })
keymap.set("n", "<leader>fr", ":Pick resume<CR>", { desc = "Mini pick resume" })

-- oil

keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil explore" })

-- flash

keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash jump" })
keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash treesitter" })
keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Flash Treesitter search" })

-- quicker

keymap.set({ "n" }, "<leader>q", function() require("quicker").toggle() end, { desc = "Close quickfix" })
keymap.set({ "n" }, ">", function() require("quicker").expand { before = 2, after = 2, add_to_existing = true } end,
    { desc = "Expand quickfix context" })
keymap.set({ "n" }, "<", function() require("quicker").collapse() end, { desc = "Collapse quickfix context" })

-- buffer-sticks

keymap.set("n", "<leader>bj", function() BufferSticks.jump() end, { desc = "Buffer sticks: jump" })
keymap.set("n", "<leader>bh", function() BufferSticks.toggle() end, { desc = "Buffer sticks: hide" })

-- neogit

keymap.set("n", "<leader>G", "<cmd>Neogit kind=vsplit<CR>", { desc = "Neogit open" })


-- fastaction

keymap.set(
    { 'n', 'x' },
    '<leader>ca',
    '<cmd>lua require("fastaction").code_action({ select_first = true })<CR>',
    { desc = "Select and apply first code action", buffer = bufnr }
)
