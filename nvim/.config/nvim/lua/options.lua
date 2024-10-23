require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

-- NOTE: Using ufo provider need a large value, feel free to decrease the value

o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

o.guicursor = "n-v-c-sm-i-ci-ve:hor25,r-cr-o:hor25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
