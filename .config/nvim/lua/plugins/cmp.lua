return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	init = function()
		local cmp = require("cmp")
		cmp.setup({
			-- formatting = cmp_format,
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				}),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
			},
			mapping = require("cmp").mapping.preset.insert({
				["<C-h>"] = require("cmp").mapping.abort(),
				["<C-l>"] = require("cmp").mapping.complete(),
				["<CR>"] = require("cmp").mapping.confirm({ select = true }),
				["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
				["<C-f>"] = require("cmp").mapping.scroll_docs(4),
				["<S-Tab>"] = require("cmp").mapping(function(fallback)
					if require("cmp").visible() then
						require("cmp").select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = require("cmp").config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "neorg" },
			}, {
				{ name = "buffer" },
			}),
		})
		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		require("cmp").setup.cmdline({ "/", "?" }, {
			mapping = require("cmp").mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		require("cmp").setup.cmdline(":", {
			mapping = require("cmp").mapping.preset.cmdline(),
			sources = require("cmp").config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
