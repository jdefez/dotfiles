return {
  -- {
  --   "askfiy/visual_studio_code",
  --   priority = 100,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = false,
        treesitter = true,
        neotree = true,
        rainbow_delimiters = true,
        telescope = {
          enabled = true,
        },
        mini = {
          enabled = false,
          indentscope_color = "",
        },
      },
    },
    config = function()
      vim.cmd([[
	       colorscheme catppuccin
	       highlight DiagnosticUnderlineError gui=undercurl
	       highlight DiagnosticUnderlineWarn gui=undercurl
	     ]])
    end
  },
}
