--------------------------------------------------------------------------------
-- mac clear
--------------------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/boningmaple/mac-clear" }
})
require("mac-clear").setup({
    -- colors_overrides = function(theme)
    --     return {
    --         -- One color for both light and dark.
    --         blue = "#ad64be",
    --
    --         -- Or use different colors for light and dark.
    --         magenta = theme == "light" and "#ffffff" or "#abcabc",
    --
    --         -- Or define a new color that is not in this colorscheme
    --         new_color = theme == "light" and "#b44444" or "#b55555",
    --     }
    -- end,

    groups_overrides = function(theme, colors)
        return {
            -- -- Use raw colors directly.
            -- Normal = { bg = "#000000", fg = "#ffffff" },
            --
            -- -- Or use the colors.
            -- Keyword = { fg = colors.magenta },
            --
            -- -- Or use different colors for light and dark.
            -- Function = { fg = theme == "light" and colors.blue or colors.red },
            --
            -- -- Or use your new color
            -- Identifier = { fg = colors.new_color }
        }
    end,
})

vim.cmd.colorscheme("mac-clear")
