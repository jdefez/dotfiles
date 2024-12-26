-- NOTE: Enable remote debugging in your php.ini
-- xdebug.mode=develop,debug
-- xdebug.start_with_request=yes

local dap = require "dap"
local fn = vim.fn

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
  },
}

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = {
    -- Using: mason
    fn.expand "$HOME/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
  },
}
