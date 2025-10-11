local keymap = vim.keymap

keymap.set('n', 'Y', 'yy$')
keymap.set("i", "<S-TAB>", "<C-x><C-o>", { desc = "Trigger completion" })
keymap.set("n", "<C-s>", ":write<CR>", { desc = "Save" })
keymap.set("n", "<leader>s", ":update<CR> :source<CR>", { desc = "Update and source" })
keymap.set("i", "jk", "<ESC>", { desc = "Escape" })
keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
keymap.set("n", "<C-h>", "<c-w>h", { desc = "To left split" })
keymap.set("n", "<C-l>", "<c-w>l", { desc = "To right split" })
keymap.set("n", "<C-k>", "<c-w>k", { desc = "To top split" })
keymap.set("n", "<C-j>", "<c-w>j", { desc = "To bottom split" })
keymap.set("n", "<Leader>ds", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap.set({"n", "i", "v"}, "<esc>", "<ESC><cmd>:nohl<CR>", { desc = "Show diagnostic" })

-- lsp default keymaping

-- "gra" modes: Normal + Visual : vim.lsp.buf.code_action()
-- "gri" modes: Normal : vim.lsp.buf.implementation()
-- "grn" modes: Normal : vim.lsp.buf.rename()
-- "grr" modes: Normal : vim.lsp.buf.references()
-- "grt" modes: Normal : vim.lsp.buf.type_definition()
-- "gO" modes: Normal : vim.lsp.buf.document_symbol()
-- CTRL-S modes: Insert : vim.lsp.buf.signature_help()
-- "an" modes: Visual : outer incremental selections : vim.lsp.buf.selection_range() 
-- "in" modes: Visual : inner incremental selections, vim.lsp.buf.selection_range() 

-- fastaction

keymap.set(
    { 'n', 'x' },
    '<leader>a',
    '<cmd>lua require("fastaction").code_action({ select_first = true })<CR>',
    { desc = "Select and apply first code action", buffer = bufnr }
)

-- oil

keymap.set("n", "<leader>O", "<cmd>Oil<CR>", { desc = "Oil start" })

-- glance

-- keymap.set("n", "gD", "<cmd>Glance definitions<CR>", { desc = "Glance definitions" })
-- keymap.set("n", "gR", "<cmd>Glance references<CR>", { desc = "Glance references" })
-- keymap.set("n", "gY", "<cmd>Glance type_definitions<CR>", { desc = "Glance type definitions" })
-- keymap.set("n", "gM", "<cmd>Glance implementations<CR>", { desc = "Glance implementations" })

-- phpactor
keymap.set("n", "<leader>p", "<cmd>PhpactorContextMenu<CR>", { desc = "Phpactor context menu" })

-- fastaction

keymap.set(
    { 'n', 'x' },
    '<leader>a',
    function() require("fastaction").code_action() end,
    { desc = "Display code actions", buffer = bufnr }
)

-- outline
-- keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle outline" })

-- symbol outline
keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { desc = "Toggle outline" })

-- mini.bufremove
keymap.set("n", "<leader>x", function() MiniBufremove.delete(0) end, { desc = "Mini buffremove" })

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

-- diffview

keymap.set("n", "<leader>D", "<cmd>DiffviewOpen<CR>", { desc = "Diffvew open" })
keymap.set("n", "<leader>Dc", "<cmd>DiffviewClose<CR>", { desc = "Diffvew close" })
