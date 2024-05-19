return {
  {
    "backdround/global-note.nvim",
    opts = {},
    keys = {
      {
        "<leader>N",
        function()
          require("global-note").toggle_note()
        end,
        desc = "Toggle global note",
      }
    }
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { mode = "n", "<leader>z", "<cmd>:ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
  },
  {
    '2kabhishek/termim.nvim',
    cmd = {
      -- JJ to Return to normal mode in terminals, remap for <C-\><C-n>
      'Fterm', -- open terminal in new tab
      'FTerm', -- same as Fterm but stays open after process exits
      'Sterm', -- open terminal in new horizontal split
      'STerm', -- same as Sterm but stays open after process exits
      'Vterm', -- open terminal in new vertical split
      'VTerm' -- same as Vterm but stays open after process exits
    },
  },
  -- {
  --   'gelguy/wilder.nvim',
  --   config = function()
  --     local wilder = require('wilder')

  --     wilder.setup({ modes = { ':', '/', '?' } })

  --     wilder.set_option('renderer', wilder.popupmenu_renderer(
  --       wilder.popupmenu_border_theme({
  --         highlights = {
  --           border = 'Normal', -- highlight to use for the border
  --         },
  --         -- 'single', 'double', 'rounded' or 'solid'
  --         -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
  --         border = 'rounded',
  --       })
  --     ))
  --   end,
  -- },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'karb94/neoscroll.nvim',
    opts = {}
  }
}
