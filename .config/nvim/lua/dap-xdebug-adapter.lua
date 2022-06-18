---@diagnostic disable: undefined-global
local dap = require('dap')

-- php adapter: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#PHP
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

require("nvim-dap-virtual-text").setup()
