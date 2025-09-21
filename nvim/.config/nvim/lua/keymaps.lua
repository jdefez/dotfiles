local keymap = vim.keymap

keymap.set('n', 'Y', 'yy$')
keymap.set("i", "<S-TAB>", "<C-x><C-o>", { desc = "Trigger completion" })
keymap.set("n", "<C-s>", ":write<CR>", { desc = "Save" })
keymap.set("n", "<leader>s", ":update<CR> :source<CR>", { desc = "Update and source" })
keymap.set("i", "jk", "<ESC>", { desc = "Escape" })
keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
keymap.set("n", "<leader>x", ":bdelete<cr>", { desc = "Close buffer"})
keymap.set("n", "<C-h>", "<c-w>h", {desc = "To left split" })
keymap.set("n", "<C-l>", "<c-w>l", {desc = "To right split" })
keymap.set("n", "<C-k>", "<c-w>k", {desc = "To top split" })
keymap.set("n", "<C-j>", "<c-w>j", {desc = "To bottom split" })
