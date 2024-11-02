vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

--
-- Bootstrap lazy and all plugins
--

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

--
-- Load plugins
--

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

--
-- Load theme
--

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
-- require "configs.dotfiles"

vim.schedule(function()
  require "mappings"
end)

local function refresh_nvim_tree()
  local cwd = vim.fn.getcwd()
  require("nvim-tree.api").tree.change_root(cwd)
end

vim.api.nvim_create_autocmd({ "DirChanged" }, { callback = refresh_nvim_tree })
