return {
  {
    "nvim-neotest/neotest",
    ft = { "php" },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-pest" {
            ignore_dirs = { "vendor", "node_modules" },
          },
        },
      }
    end,
    keys = {
      {
        mode = { "n" },
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest tests",
      },
      {
        mode = { "n" },
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run test file",
      },
      {
        mode = { "n" },
        "<leader>ts",
        function()
          require("neotest").run.run { suite = true }
        end,
        desc = "Run test suite",
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      -- "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "V13Axel/neotest-pest",
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
      local dap = require "dap"

      -- dap.defaults.fallback.external_terminal = {
      --   command = "wezterm",
      --   args = { "-e" },
      -- }

      -- https://microsoft.github.io/vscode-codicons/dist/codicon.html
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" }) -- debug-breakpoint-conditional
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
      --
      -- require("utils").on_ft("dap-repl", function(event)
      --   vim.api.nvim_buf_set_option(event.buf, "buflisted", false)
      --   require("dap.ext.autocompl").attach()
      -- end)
      --
      -- require("dap.repl").commands = vim.tbl_extend("force", require("dap.repl").commands, {
      --   continue = { ".continue", "c" },
      --   next_ = { ".next", "n" },
      --   into = { ".into", "s" },
      --   into_targets = { "st" },
      --   out = { ".out", "r" },
      --   scopes = { ".scopes", "a" },
      --   threads = { ".threads", "t", "threads" },
      --   frames = { ".frames", "f", "bt" },
      --   exit = { "exit", ".exit", "q" },
      --   up = { ".up", "up" },
      --   down = { ".down", "down" },
      --   goto_ = { ".goto", "j" },
      --   capabilities = { ".capabilities", ".ca" },
      --   custom_commands = {
      --     [".echo"] = function(text)
      --       dap.repl.append(text)
      --     end,
      --   },
      -- })
    end,
    -- stylua: ignore
    keys = {
      -- NOTE: Running the program
      { "<leader>dr", "<cmd>Telescope dap configurations<cr>", desc = "run", },
      { "<leader>dl", function() require("dap").run_last() end, desc = "run last", },
      { "<leader>dR", function() require("dap").restart() end, desc = "restart", },
      { "<leader>dq", function() require("dap").terminate() end, desc = "terminate", },
      -- NOTE: steps
      { "<leader>dp", function() require("dap").step_back() end, desc = "step back", }, -- [p]revious
      { "<leader>dn", function() require("dap").step_over() end, desc = "step over", }, -- [n]ext
      { "<leader>di", function() require("dap").step_into() end, desc = "step into", }, -- [i]nto
      { "<leader>do", function() require("dap").step_out() end, desc = "step out", }, -- [o]ut, [u]ninto
      { "<leader>dc", function() require("dap").continue() end, desc = "continue", }, -- Run until breakpoint or program termination
      { "<leader>dh", function() require("dap").run_to_cursor() end, desc = "step to here(cursor)", }, -- step to [h]ere
      -- NOTE: breakpoints
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "[B] toggle breakpoint", },
      { "<leader>da", "<cmd>Telescope dap list_breakpoints<cr>", desc = "[B] show all breakpoints", },
      { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "[B] removes all breakpoints", },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end, desc = "[B] conditional breakpoint", },
      { "<leader>dL", function() require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end, desc = "[B] logpoint", },
      -- NOTE: dapui
      { "<leader>du", function() require("dapui").toggle() end, desc = "toggle dapui", },
      -- NOTE: watch expressions
      { "<A-e>", function() require("dapui").eval() end, desc = "eval (<A-e>)", mode = { "n", "v" }, },
      { "<leader>dk", function() require("dapui").eval() end, desc = "eval (<A-e>)", mode = { "n", "v" }, },
      { "<leader>dK", function() require("dap.ui.widgets").preview() end, desc = "preview expression", },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("telescope").load_extension "dap"
    end,
  },
}
