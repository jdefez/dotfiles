local hop = require('hop')

hop.setup {}

local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'L', function()
  hop.hint_lines_skip_whitespace({ current_line_only = false })
end, { remap = true })

vim.keymap.set('', 'W', function()
  hop.hint_patterns({ current_line_only = false })
end, { remap = true })

vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
