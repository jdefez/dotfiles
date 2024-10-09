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
      'VTerm'  -- same as Vterm but stays open after process exits
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = {
        marks = false,
        registers = false,
        spelling = {
          enabled = false,
          suggestions = 20,
        },
      },
    }
  },
  {
    'karb94/neoscroll.nvim',
    opts = {}
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        view_search = false,
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
          },
          opts = { skip = true },
        },
      },
      -- popupmenu = {
      --   backend = "cmp",
      -- }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    }
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {},
    keys = {
      {
        "zR",
        function()
          return require("ufo").openAllFolds()
        end,
        desc = "Open folds",
      },
      {
        "zM",
        function()
          return require("ufo").closeAllFolds()
        end,
        desc = "Close folds",
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = {
        normal = { fg = "#999999" },
      }
    },
  }
}
