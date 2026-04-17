--------------------------------------------------------------------------------
-- mfd
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/kungfusheep/mfd.nvim" },
})

-- mfd
-- mfd-dark
-- mfd-stealth
-- mfd-amber
-- mfd-mono
-- mfd-scarlet
-- mfd-paper
-- mfd-hud	
-- mfd-nvg
-- mfd-gbl-light
-- mfd-gbl-dark
-- mfd-lumon
-- mfd-nerv
-- mfd-flir
-- mfd-flir-bh
-- mfd-flir-rh
-- mfd-flir-fusion
-- mfd-blackout

require('mfd').setup({
    accessibility_contrast = 0, -- 0 (default) to 10 (max WCAG compliance)
    no_italic = false,         -- disable italic highlighting (default: false)
    bright_comments = true,   -- legacy: equivalent to accessibility_contrast = 4
})

vim.cmd.colorscheme('mfd-paper')
