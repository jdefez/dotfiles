return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		-- default mappings
		-- co — choose ours
		-- ct — choose theirs
		-- cb — choose both
		-- c0 — choose none
		-- ]x — move to previous conflict
		-- [x — move to next conflict
		init = function()
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = { "GitConflictDetected" },
				callback = function(ev)
					print("Conflict detected in " .. vim.fn.expand("<afile>"))
					vim.keymap.set("n", "cww", function()
						engage.conflict_buster()
						create_buffer_local_mappings()
					end)
				end,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map("n", "<leader>hs", gs.stage_hunk)
					map("n", "<leader>hr", gs.reset_hunk)
					map("v", "<leader>hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("n", "<leader>hS", gs.stage_buffer)
					map("n", "<leader>hu", gs.undo_stage_hunk)
					map("n", "<leader>hR", gs.reset_buffer)
					map("n", "<leader>hp", gs.preview_hunk)
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end)
					map("n", "<leader>tb", gs.toggle_current_line_blame)
					map("n", "<leader>hd", gs.diffthis)
					map("n", "<leader>hD", function()
						gs.diffthis("~")
					end)
					map("n", "<leader>td", gs.toggle_deleted)

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
		},
		keys = {
			{ "<leader>G", "<cmd>Neogit kind=auto<CR>", desc = "Neogit open" },
		},
	},
}
