local keymap = vim.keymap

keymap.set('n', 'Y', 'yy$')
-- keymap.set("n", "<C-s>", ":write<CR>", { desc = "Save" })
keymap.set("i", "jk", "<ESC>", { desc = "Escape" })
keymap.set({ "n", "i", "v" }, "<esc>", "<ESC><cmd>:nohl<CR>", { desc = "Esc" })
-- keymap.set("n", "<leader>W", "*``cgn", {desc = "Replace current word"})

--------------------------------------------------------------------------------
--- Move
--------------------------------------------------------------------------------

keymap.set("n", "<C-h>", "<c-w>h", { desc = "To left split" })
keymap.set("n", "<C-l>", "<c-w>l", { desc = "To right split" })
keymap.set("n", "<C-k>", "<c-w>k", { desc = "To top split" })
keymap.set("n", "<C-j>", "<c-w>j", { desc = "To bottom split" })

-- fixme: conflicting with native merge line "J"
-- keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
-- keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

--------------------------------------------------------------------------------
-- [b] for buffer
--------------------------------------------------------------------------------

keymap.set("n", "<leader>bd", '<cmd>lua MiniBufremove.delete()<CR>', { desc = "Delete buffer" })
keymap.set("n", "<leader>bD", '<Cmd>lua MiniBufremove.delete(0, true)<CR>', { desc = "Delete! buffer" })
keymap.set("n", "<leader>bf", "<cmd>Pick buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>bh", function() BufferSticks.toggle() end, { desc = "Buffer sticks: hide" })
keymap.set("n", "<leader>bj", function() BufferSticks.jump() end, { desc = "Buffer sticks: jump" })
keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
keymap.set("n", "<leader>br", ":update<CR> :source<CR>", { desc = "Update and source" })

--------------------------------------------------------------------------------
-- [c] for cursor
--------------------------------------------------------------------------------

-- TODO: configure multicursor mappings cf. https://github.com/jake-stewart/multicursor.nvim

--------------------------------------------------------------------------------
-- [f] for file
--------------------------------------------------------------------------------

keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fe", "<cmd>Oil<CR>", { desc = "Oil explore" })
keymap.set("n", "<leader>fh", "<cmd>Pick help<CR>", { desc = "Find help" })
keymap.set("n", "<leader>fl", '<cmd>Pick buf_lines scope="current"<CR>', { desc = "Grep file lines" })
keymap.set("n", "<leader>fr", "<cmd>Pick resume<CR>", { desc = "Mini pick resume" })
keymap.set('n', '<leader>fs', ':lua MiniSessions.select()<CR>', { desc = 'Find session' })
keymap.set("n", "<leader>fw", "<cmd>Pick grep_live<CR>", { desc = "Grep live" })
keymap.set("n", "<leader>fW", "<cmd>Pick grep pattern='<cword>'<CR>", { desc = "Grep word" })

--------------------------------------------------------------------------------
-- [g] for git
--------------------------------------------------------------------------------

keymap.set("n", "<leader>gC", "<cmd>DiffviewClose<CR>", { desc = "Diffvew close" })
keymap.set("n", "<leader>gh", '<cmd>Pick git_hunks path="%" scope=staged<CR>', { desc = "Pick buffer hunks" })
keymap.set("n", "<leader>gH", '<cmd>Pick git_hunks scope=staged<CR>', { desc = "Pick all hunks" })
keymap.set("n", "<leader>go", "<cmd>Neogit kind=vsplit<CR>", { desc = "Neogit open" })
keymap.set("n", "<leader>gO", "<cmd>DiffviewOpen<CR>", { desc = "Diffvew open" })

--------------------------------------------------------------------------------
-- [l] for lsp
--------------------------------------------------------------------------------

keymap.set(
    { 'n', 'x' },
    '<leader>la',
    function() require("fastaction").code_action() end,
    { desc = "Display code actions", buffer = bufnr }
)
keymap.set("n", "<Leader>ld", '<Cmd>lua vim.lsp.buf.definition()<CR>', { desc = "Source definition" })
keymap.set("n", "<Leader>lD", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
keymap.set("n", "<Leader>li", '<Cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "Implementations" })
keymap.set("n", "<Leader>lh", '<Cmd>lua vim.lsp.buf.hover()<CR>', { desc = "Hover" })
keymap.set("n", '<leader>lr', '<Cmd>Pick lsp scope="references"<CR>', { desc = 'References' })
keymap.set("n", '<leader>ls', '<Cmd>Pick lsp scope="workspace_symbol"<CR>', { desc = 'Symbols workspace' })
keymap.set("n", '<leader>lS', '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = 'Symbols document' })
-- keymap.set("n", "<leader>lo", "<cmd>SymbolsOutline<CR>", { desc = "Toggle outline" })

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

--------------------------------------------------------------------------------
-- [p] for php
--------------------------------------------------------------------------------

keymap.set({ "n", "v" }, "<leader>pm", "<cmd>PhpactorContextMenu<CR>", { desc = "Context menu" })
keymap.set("n", "<leader>pcc", "<cmd>PhpactorCopyFile<CR>", { desc = "Class copy" })
keymap.set("n", "<leader>pcn", "<cmd>PhpactorClassNew<CR>", { desc = "Class new" })
keymap.set("n", "<leader>pcm", "<cmd>PhpactorMoveFile<CR>", { desc = "Move file" })

--------------------------------------------------------------------------------
-- [q] for quickfix
--------------------------------------------------------------------------------

local quicker = require("quicker")

keymap.set({ "n" }, "<leader>qt", function() quicker.toggle() end, { desc = "Toggle quickfix" })

--------------------------------------------------------------------------------
-- [s] for session
--------------------------------------------------------------------------------

local session_new = 'MiniSessions.write(vim.fn.input("Session name: "))'

keymap.set('n', '<leader>sd', '<Cmd>lua MiniSessions.select("delete")<CR>', { desc = 'Delete' })
keymap.set('n', '<leader>sn', '<Cmd>lua ' .. session_new .. '<CR>', { desc = 'New' })
keymap.set('n', '<leader>sr', '<Cmd>lua MiniSessions.select("read")<CR>', { desc = 'Read' })
keymap.set('n', '<leader>sw', '<Cmd>lua MiniSessions.write()<CR>', { desc = 'Write current' })

--------------------------------------------------------------------------------
-- treesitter
--------------------------------------------------------------------------------

-- local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- vim way: ; goes to the direction you were moving.
-- keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
-- keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
-- keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
-- keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
-- keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

--------------------------------------------------------------------------------
-- flash
--------------------------------------------------------------------------------

local flash = require("flash")

keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash jump" })
keymap.set({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "Flash treesitter" })
keymap.set("o", "r", function() flash.remote() end, { desc = "Remote Flash" })
keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Flash Treesitter search" })

--------------------------------------------------------------------------------
-- glance
--------------------------------------------------------------------------------

-- keymap.set("n", "gD", "<cmd>Glance definitions<CR>", { desc = "Glance definitions" })
-- keymap.set("n", "gR", "<cmd>Glance references<CR>", { desc = "Glance references" })
-- keymap.set("n", "gY", "<cmd>Glance type_definitions<CR>", { desc = "Glance type definitions" })
-- keymap.set("n", "gM", "<cmd>Glance implementations<CR>", { desc = "Glance implementations" })
