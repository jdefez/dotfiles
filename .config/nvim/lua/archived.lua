return {
	{
		"oxfist/night-owl.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[
	       colorscheme night-owl
	       highlight DiagnosticUnderlineError gui=undercurl
	       highlight DiagnosticUnderlineWarn gui=undercurl
	     ]])
		end,
	},
	{
		"ronisbr/nano-theme.nvim",
		init = function()
      vim.cmd([[
        colorscheme nano-theme
        highlight DiagnosticUnderlineError gui=undercurl
        highlight DiagnosticUnderlineWarn gui=undercurl
      ]])
			vim.o.background = "light" -- or "dark".
		end,
	},
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		opts = {
			style = "auto",
			variant = "default",
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true },
				variables = { bold = false },
			},
			-- on_colors = function(colors) end,
			on_highlights = function(highlights, colors)
				highlights.FlashCursor = { bg = colors.cyan_intense, fg = colors.bg_main }
				highlights.FlashPromptIcon = { bg = colors.green_intense, fg = colors.bg_main }
				highlights.FlashLabel = { bg = colors.red_intense, fg = colors.bg_main }
				highlights.FlashMatch = { bg = colors.blue_intense, fg = colors.bg_main }
				highlights.FlashCurrent = { bg = colors.green_intense, fg = colors.bg_main }
			end,
		},
		init = function()
			vim.cmd([[
	       colorscheme modus
	     ]])
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					},
				},
			})
			vim.cmd("colorscheme github_light")
		end,
	},
	{
		"roobert/palette.nvim",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			require("palette").setup({
				palettes = {
					main = "light",

					-- pastel, bright or dark
					accent = "dark",
					state = "dark",
				},

				italics = true,
				transparent_background = false,
			})

			vim.cmd([[
	     colorscheme palette
	     highlight DiagnosticUnderlineError gui=undercurl
	     highlight DiagnosticUnderlineWarn gui=undercurl
	     highlight Comment guifg=darkgrey
	     highlight NoiceCursor guibg=darkgrey
	     highlight NeogitDiffAdd guifg=#56A665 guibg=#e9e9ed
	     highlight NeogitDiffAddHighlight guifg=#56A665 guibg=#e9e9ed
	     highlight NeogitDiffDelete guifg=#B15555 guibg=#e9e9ed
	     highlight NeogitDiffDeleteHighlight guifg=#B15555 guibg=#e9e9ed
	     highlight FlashCursor guibg=blue guifg=white
	     highlight FlashPromptIcon guibg=blue guifg=white
	     highlight FlashLabel guibg=red guifg=white
	     highlight FlashMatch guibg=blue guifg=white
	     highlight FlashCurrent guibg=green guifg=white
	   ]])
		end,
	},
	{
		"roobert/palette.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function(_, opts)
			require("palette").setup({
				palettes = {
					-- dark or light
					main = "dark",
					-- pastel, bright or dark
					accent = "dark",
					state = "dark",
				},
				italics = true,
				bold = true,
				transparent_background = false,
			})
			vim.cmd([[
	     colorscheme palette
	     highlight DiagnosticUnderlineError gui=undercurl
	     highlight DiagnosticUnderlineWarn gui=undercurl
	     highlight NoiceCursor guibg=darkgrey
	     highlight NeogitDiffAdd guifg=#56A665 guibg=#191d33
	     highlight NeogitDiffAddHighlight guifg=#56A665 guibg=#191d33
	     highlight NeogitDiffDelete guifg=#B15555 guibg=#191d33
	     highlight NeogitDiffDeleteHighlight guifg=#B15555 guibg=#191d33
	     highlight FlashCursor guibg=blue guifg=white
	     highlight FlashPromptIcon guibg=blue guifg=white
	     highlight FlashLabel guibg=red guifg=white
	     highlight FlashMatch guibg=blue guifg=white
	     highlight FlashCurrent guibg=green guifg=white
	   ]])
		end,
	},
}
