require "nvchad.options"

local o = vim.o
local g = vim.g

-- vim.diagnostic.config { virtual_lines = { virtual_lines = true } }

-- NOTE: Enable cursorline!

o.cursorlineopt = "both"

-- NOTE: treesitter folding options

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99

-- o.guicursor = "n-v-c-sm-i-ci-ve:hor25,r-cr-o:hor25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

--
-- virtcolumn
--

o.colorcolumn = "80"
g.virtcolumn_char = "▕" -- char to display the line
g.virtcolumn_priority = 10 -- priority of extmark
