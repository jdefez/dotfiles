return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.o.background = "light"
      vim.cmd([[ colorscheme vscode ]])
    end
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     -- vim.o.background = "light"
  --     vim.cmd([[ colorscheme tokyonight-moon ]])
  --   end
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     integrations = {
  --       cmp = true,
  --       gitsigns = true,
  --       nvimtree = false,
  --       treesitter = true,
  --       neotree = true,
  --       rainbow_delimiters = true,
  --       telescope = {
  --         enabled = true,
  --       },
  --       mini = {
  --         enabled = false,
  --         indentscope_color = "",
  --       },
  --     },
  --   },
  --   config = function()
  --     vim.cmd([[
  --       colorscheme catppuccin
  --       highlight DiagnosticUnderlineError gui=undercurl
  --       highlight DiagnosticUnderlineWarn gui=undercurl
  --     ]])
  --   end
  -- },
}
