return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "auto",
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = false,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
          background = "base",
          background_nc = "_experimental_nc",
          panel = "surface",
          panel_nc = "base",
          border = "highlight_med",
          comment = "muted",
          link = "iris",
          punctuation = "subtle",

          error = "love",
          hint = "iris",
          info = "foam",
          warn = "gold",

          headings = {
            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          },
          -- or set all headings at once
          -- headings = 'subtle'
        },

        -- Change specific vim highlight groups
        -- https://github.com/rose-pine/neovim/wiki/Recipes
        highlight_groups = {
          ColorColumn = { bg = "rose" },

          -- Blend colours against the "base" background
          CursorLine = { bg = "foam", blend = 10 },
          StatusLine = { fg = "love", bg = "love", blend = 10 },

          -- By default each group adds to the existing config.
          -- If you only want to set what is written in this config exactly,
          -- you can set the inherit option:
          -- Search = { bg = "gold", inherit = false },
        },
      })

      vim.cmd('colorscheme rose-pine')
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
						functions = "bold",
						keywords = "bold",
						variables = "NONE",
						conditionals = "NONE",
						constants = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "italic,bold",
					},
				},
			})
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[
	       colorscheme night-owl
	       highlight DiagnosticUnderlineError gui=undercurl
	       highlight DiagnosticUnderlineWarn gui=undercurl
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
		"roobert/palette.nvim",
		lazy = false,
		enabled = true,
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
}
