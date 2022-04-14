-- local dapui = require("dapui")
local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/jean/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
}

-- vim.fn.sign_define('DapBreakpoint', {
--   text = '🛑',
--   texthl = '',
--   linehl = '',
--   numhl = ''
-- })

-- dapui config

-- dapui.setup({
--   icons = { expanded = "▾", collapsed = "▸" },
--   mappings = {
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
--         size = 0.5,
--       },
--       { id = "breakpoints", size = 0.1 },
--       { id = "stacks", size = 0.2 },
--       { id = "watches", size = 0.2 },
--     },
--     size = 45,
--     position = "left",
--   },
--   tray = {
--     elements = { "repl" },
--     size = 15,
--     position = "bottom",
--   },
--   floating = {
--     max_height = nil,
--     max_width = nil,
--     border = "single",
--     mappings = {
--       close = { "q", "<Esc>" },
--     },
--   },
--   windows = { indent = 1 },
-- })

--[[ dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end ]]
