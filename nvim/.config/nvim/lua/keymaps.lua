local keymap = vim.keymap

keymap.set('n', 'Y', 'yy$')
keymap.set("i", "jk", "<ESC>", { desc = "Escape" })
keymap.set({ "n", "i", "v" }, "<esc>", "<ESC><cmd>:nohl<CR>", { desc = "Esc" })

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
        -- { mode = 'n', keys = '<Leader>t', desc = '+Treesitter' },
    },
})

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

local mc = require("multicursor-nvim")

-- TODO: add multicursor-operator
-- Pressing `<leader>miwap` will create a cursor in every match of the
-- string captured by `iw` inside range `ap`.
-- This action is highly customizable, see `:h multicursor-operator`.
-- set({"n", "x"}, "<leader>m", mc.operator)

-- Add or skip cursor above/below the main cursor.

keymap.set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end, { desc = "Add up" })
keymap.set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end, { desc = "Add down" })
keymap.set({ "n", "x" }, "<s-up>", function() mc.lineSkipCursor(-1) end, { desc = "Skip up" })
keymap.set({ "n", "x" }, "<s-down>", function() mc.lineSkipCursor(1) end, { desc = "Skip down" })

-- Add or skip adding a new cursor by matching word/selection

keymap.set({ "n", "x" }, "<leader>cj", function() mc.matchAddCursor(1) end, { desc = "Add & match next" })
keymap.set({ "n", "x" }, "<leader>ck", function() mc.matchAddCursor(-1) end, { desc = "Add & match previous" })
keymap.set({ "n", "x" }, "<leader>cJ", function() mc.matchSkipCursor(1) end, { desc = "Skip & match next" })
keymap.set({ "n", "x" }, "<leader>cK", function() mc.matchSkipCursor(-1) end, { desc = "Skip & match previous" })

-- match new cursors within visual selections by regex.

keymap.set("x", "M", mc.matchCursors)

-- Add a cursor and jump to the next/previous search result.

keymap.set("n", "<leader>c/", function() mc.searchAddCursor(1) end, { desc = "Add & search next" })
keymap.set("n", "<leader>c#", function() mc.searchAddCursor(-1) end, { desc = "Add & search previous" })

-- Jump to the next/previous search result without adding a cursor.

keymap.set("n", "<leader>cs/", function() mc.searchSkipCursor(1) end, { desc = "Skip & search next" })
keymap.set("n", "<leader>cs#", function() mc.searchSkipCursor(-1) end, { desc = "Skip & search previous" })

-- Pressing `gaip` will add a cursor on each line of a paragraph.

keymap.set("n", "ga", mc.addCursorOperator)

-- Append/insert for each line of visual selections. Similar to block selection insertion.

keymap.set("x", "<leader>cI", mc.insertVisual, { desc = "Insert visual selection" })
keymap.set("x", "<leader>cA", mc.appendVisual, { desc = "Append visual selection" })

-- Disable and enable cursors.
keymap.set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle cursors" })

-- Mappings defined in a keymap layer only apply when there are multiple 
-- cursors. This lets you have overlapping mappings.

mc.addKeymapLayer(function(layerSet)
    -- Select a different cursor as the main one.
    layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "Rotate to previous cursor" })
    layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "Rotate to next cursor" })

    -- Delete the main cursor.
    layerSet({ "n", "x" }, "<leader>cx", mc.deleteCursor, { desc = "Delete cursor" })

    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end, { desc = "Enable/clear cursors" })
end)

--------------------------------------------------------------------------------
-- [f] for file
--------------------------------------------------------------------------------

keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fe", function() require("oil").open() end, { desc = "Oil explore" })
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
keymap.set("n", "<Leader>lk", '<Cmd>lua vim.lsp.buf.hover()<CR>', { desc = "Hover" })
keymap.set("n", '<leader>lr', '<Cmd>Pick lsp scope="references"<CR>', { desc = 'References' })
keymap.set("n", '<leader>ls', '<Cmd>Pick lsp scope="workspace_symbol"<CR>', { desc = 'Symbols workspace' })
keymap.set("n", '<leader>lS', '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = 'Symbols document' })

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
-- flash
--------------------------------------------------------------------------------

local flash = require("flash")

keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash jump" })
keymap.set({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "Flash treesitter" })
keymap.set("o", "r", function() flash.remote() end, { desc = "Remote Flash" })
keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Flash Treesitter search" })

--------------------------------------------------------------------------------
-- todo
--------------------------------------------------------------------------------

keymap.set("n", "<leader>t", ':TodoLocList<CR>', { desc = "Todo loc list" })
