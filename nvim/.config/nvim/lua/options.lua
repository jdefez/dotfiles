require "nvchad.options"

local o = vim.o
local g = vim.g
--
-- Enables cursorline
--
o.cursorlineopt = "both"

--
-- Using ufo provider need a large value, feel free to decrease the value
--

o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

o.guicursor = "n-v-c-sm-i-ci-ve:hor25,r-cr-o:hor25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

--
-- virtcolumn
--

o.colorcolumn = "88"
g.virtcolumn_char = "▕" -- char to display the line
g.virtcolumn_priority = 10 -- priority of extmark
