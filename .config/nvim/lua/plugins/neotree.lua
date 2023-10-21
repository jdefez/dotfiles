return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    enable_git_status = false,
    enable_diagnostics = false,
    window = {
      position = "right",
    }
  },
  keys = {
    { '<leader>n', ':Neotree toggle<cr>' }
  }
}
