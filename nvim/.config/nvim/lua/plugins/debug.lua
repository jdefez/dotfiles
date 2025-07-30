return {
  { "rcarriga/nvim-dap-ui", enabled = false },
  {
    "miroshQa/debugmaster.nvim",
    lazy = false,
    -- osv is needed if you want to debug neovim lua code. Also can be used
    -- as a way to quickly test-drive the plugin without configuring debug adapters
    dependencies = {
       "mfussenegger/nvim-dap",
       "jbyuki/one-small-step-for-vimkind",
    },
    config = function()
      local dm = require "debugmaster"
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      -- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
      vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
      -- If you want to disable debug mode in addition to leader+d using the Escape key:
      -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
      -- This might be unwanted if you already use Esc for ":noh"
      vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
      local dap = require "dap"
      -- Configure your debug adapters here
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

      -- log level
      --   The log file is in the |stdpath| `cache` folder.
      --   To print the location:  > :lua print(vim.fn.stdpath('cache'))

      -- :DapShowLog
      dap.set_log_level("TRACE")

      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath "data" .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }
      dap.configurations.php = {
        {
          name = "Listen for Xdebug",
          type = "php",
          request = "launch",
          port = 9003, -- Default Xdebug 3 port (change to 9000 for Xdebug 2)
          stopOnEntry = false,
          pathMappings = {
            -- Map your local macOS path to the Docker container path
            ["/Users/ayctor/Code/app-delegatio"] = "app",
            -- Add additional mappings if needed
            -- ["/Users/ayctor/Code/app-delegatio/src"] = "/app",
            -- ["/Users/ayctor/Code/app-delegatio/tests"] = "/app",
          },
        },
        -- {
        --   name = "Launch currently open script",
        --   type = "php",
        --   request = "launch",
        --   program = "${file}",
        --   cwd = "${fileDirname}",
        --   port = 0,
        --   runtimeArgs = {
        --     "-dxdebug.start_with_request=yes",
        --   },
        --   env = {
        --     XDEBUG_MODE = "debug,develop",
        --     XDEBUG_CONFIG = "client_port=${port}",
        --   },
        -- },
      }
    end,
  },
}
