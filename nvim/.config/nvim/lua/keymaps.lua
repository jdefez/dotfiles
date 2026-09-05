local keymap = vim.keymap

keymap.set('n', 'Y', 'yy$')
keymap.set("i", "jk", "<ESC>", { desc = "Escape" })
-- clears search highlight and multicursors
keymap.set({ "n", "i", "v" }, "<esc>", "<cmd>:nohl<CR><cmd>:edit!<CR><ESC>")

require("mini.clue").setup({
    -- Register `<Leader>` as trigger
    triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
    },

    -- Add descriptions for mapping groups
    clues = {
        { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
        { mode = 'n', keys = '<Leader>c', desc = '+Cursors' },
        { mode = 'n', keys = '<Leader>f', desc = '+Files' },
        { mode = 'n', keys = '<Leader>g', desc = '+Git' },
        { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
        { mode = 'n', keys = '<Leader>p', desc = '+Php' },
        { mode = 'n', keys = '<Leader>q', desc = '+Quickfix' },
        { mode = 'n', keys = '<Leader>s', desc = '+Sessions' },
        { mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
    },
})

--------------------------------------------------------------------------------
--- Move
--------------------------------------------------------------------------------

keymap.set("n", "<C-h>", "<c-w>h", { desc = "To left split" })
keymap.set("n", "<C-l>", "<c-w>l", { desc = "To right split" })
keymap.set("n", "<C-k>", "<c-w>k", { desc = "To top split" })
keymap.set("n", "<C-j>", "<c-w>j", { desc = "To bottom split" })

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
keymap.set("n", "<leader>bp", '<cmd>Copypath filename<CR>', { desc = "Copy filename" })
keymap.set("n", "<leader>bP", '<cmd>Copypath relative<CR>', { desc = "Copy relative path" })

--------------------------------------------------------------------------------
-- [f] for file
--------------------------------------------------------------------------------

keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fe",
    function() require("fyler").toggle({ kind = 'split_right_most' }) end,
    { desc = "File explorer" })
keymap.set("n", "<leader>fh", "<cmd>Pick help<CR>", { desc = "Find help" })
keymap.set("n", "<leader>fl", '<cmd>Pick buf_lines scope="current"<CR>', { desc = "Grep file lines" })
keymap.set("n", "<leader>fn", function() require("global-note").toggle_note() end, { desc = "Toggle global note" })

keymap.set("n", "<leader>fo",
    function()
        local fyler = require("fyler")
        fyler.toggle({ kind = 'split_right_most' })
        fyler.focus(vim.fn.expand('%:p'))
    end,
    { desc = "Focus file" }
)

keymap.set("n", "<leader>fr", "<cmd>Pick resume<CR>", { desc = "Mini pick resume" })
keymap.set("n", "<leader>fW", "<cmd>Pick grep_live<CR>", { desc = "Grep live" })
keymap.set("n", "<leader>fw", "<cmd>Pick grep pattern='<cword>'<CR>", { desc = "Grep word" })

--------------------------------------------------------------------------------
-- [g] for git
--------------------------------------------------------------------------------

keymap.set("n", "<leader>gd", "<cmd>CodeDiff<CR>", { desc = "Toggle code diff" })
keymap.set("n", "<leader>gh", '<cmd>Pick git_hunks path="%" scope=staged<CR>', { desc = "Pick buffer hunks" })
keymap.set("n", "<leader>gH", '<cmd>Pick git_hunks scope=staged<CR>', { desc = "Pick all hunks" })
keymap.set("n", "<leader>go", "<cmd>Neogit kind=vsplit<CR>", { desc = "Neogit open" })

--------------------------------------------------------------------------------
-- [l] for lsp
--------------------------------------------------------------------------------

keymap.set({ 'n', 'x' }, '<leader>la', function()
    require("fastaction").code_action()
end, { desc = "Display code actions", buffer = bufnr })
keymap.set("n", "<Leader>ld", function() vim.lsp.buf.definition() end, { desc = "Source definition" })
keymap.set("n", "<leader>lf", function()
    if vim.bo.filetype == 'php' then
        require('modules.pint').format()
    else
        vim.lsp.buf.format()
    end
end, { desc = "Format buffer" })
keymap.set("n", "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle inlay hints" })
keymap.set("n", "<Leader>li", function() vim.lsp.buf.implementation() end, { desc = "Implementations" })
keymap.set("n", "<Leader>lk", function() vim.lsp.buf.hover() end, { desc = "Hover" })
keymap.set("n", "<leader>ll", function() vim.diagnostic.setloclist() end, { desc = "List diagnostics" })
keymap.set("n", "<leader>lo", "<cmd>Outline<CR>", { desc = "Toggle outline" })
keymap.set("n", '<leader>lr', '<Cmd>Pick lsp scope="references"<CR>', { desc = 'References' })
keymap.set("n", '<leader>ls', '<Cmd>Pick lsp scope="workspace_symbol"<CR>', { desc = 'Symbols workspace' })
keymap.set("n", '<leader>lS', '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = 'Symbols document' })
keymap.set("n", "<Leader>lw", function() vim.diagnostic.open_float() end, { desc = "Show diagnostic" })
keymap.set("n", "<Leader>lW", function() vim.diagnostic.setqflist() end, { desc = "Set diagnostic to quickfix" })

--------------------------------------------------------------------------------
-- [p] for php
--------------------------------------------------------------------------------

keymap.set({ "n", "v" }, "<leader>pm", function()
    require('phpactor').rpc('context_menu', {})
end, { desc = "Phpactor context menu" })

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
-- [t] for terminal
--------------------------------------------------------------------------------

keymap.set('t', '<Esc>', "<C-\\><C-n>")
keymap.set("n", "<leader>tl", '<cmd>Term vertical<CR>', { desc = "Vertical terminal" })
keymap.set("n", "<leader>tj", '<cmd>Term horizontal<CR>', { desc = "Horizontal terminal" })

--------------------------------------------------------------------------------
-- flash
--------------------------------------------------------------------------------

local flash = require("flash")

keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash jump" })
-- NOTE: desabled conflicts with surround
-- keymap.set({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "Flash treesitter" })
keymap.set("o", "r", function() flash.remote() end, { desc = "Remote Flash" })
-- keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Flash Treesitter search" })
