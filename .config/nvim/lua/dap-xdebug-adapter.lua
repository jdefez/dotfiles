local dap = require('dap')
-- local dapui = require('dapui')

-- vim.g.dap_virtual_text = true

-- php adapter: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#PHP
--
-- install:
-- git clone https://github.com/xdebug/vscode-php-debug.git
-- cd vscode-php-debug
-- npm install && npm run build

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/ayctor/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
}

vim.fn.sign_define('DapBreakpoint', {
  text = '🛑',
  texthl = '',
  linehl = '',
  numhl = ''
})
vim.fn.sign_define('DapBreakpointRejected', {
  text = "",
  texthl = "LspDiagnosticsSignHint",
  linehl = "",
  numhl = "",
})
vim.fn.sign_define('DapStopped', {
  text = "⭐️",
  texthl = "LspDiagnosticsSignInformation",
  linehl = "DiagnosticUnderlineInfo",
  numhl = "LspDiagnosticsSignInformation",
})

-- dapui config

-- dapui.setup({
--   icons = { expanded = "▾", collapsed = "▸" },
--   mappings = {
--     -- Use a table to apply multiple mappings
--     expand = { "<CR>", "<2-LeftMouse>" },
--     open = "o",
--     remove = "d",
--     edit = "e",
--     repl = "r",
--   },
--   sidebar = {
--     elements = {
--       {
--         id = "scopes",
--         size = 0.25, -- Can be float or integer > 1
--       },
--       { id = "breakpoints", size = 0.25 },
--       { id = "stacks", size = 0.25 },
--       { id = "watches", size = 00.25 },
--     },
--     size = 40,
--     position = "left",
--   },
--   tray = {
--     elements = { "repl" },
--     size = 10,
--     position = "bottom",
--   },
--   floating = {
--     max_height = nil, -- These can be integers or a float between 0 and 1.
--     max_width = nil, -- Floats will be treated as percentage of your screen.
--     border = "single", -- Border style. Can be "single", "double" or "rounded"
--     mappings = {
--       close = { "q", "<Esc>" },
--     },
--   },
--   windows = { indent = 1 },
-- })

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end

-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end

-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
