return {
  {
    "sindrets/diffview.nvim",
    lazy = false,
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
  {
    "NeogitOrg/neogit",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      { "<leader>G", "<cmd>Neogit kind=vsplit<CR>", desc = "Neogit open" },
    },
  },
  -- {
  --   "akinsho/git-conflict.nvim",
  --   version = "*",
  --   lazy = false,
  --   config = true,
  --   -- default mappings
  --   -- co — choose ours
  --   -- ct — choose theirs
  --   -- cb — choose both
  --   -- c0 — choose none
  --   -- ]x — move to previous conflict
  --   -- [x — move to next conflict
  --   init = function()
  --     vim.api.nvim_create_autocmd({ "User" }, {
  --       pattern = { "GitConflictDetected" },
  --       callback = function(ev)
  --         print("Conflict detected in " .. vim.fn.expand "<afile>")
  --         vim.keymap.set("n", "cww", function()
  --           engage.conflict_buster()
  --           create_buffer_local_mappings()
  --         end)
  --       end,
  --     })
  --   end,
  -- },
}
