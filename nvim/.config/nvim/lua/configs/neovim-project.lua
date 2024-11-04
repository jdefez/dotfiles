--
-- NOTE: neovim-project: we need this to reload nvim-tree when moving in a project
--

local augroup = vim.api.nvim_create_augroup("user_cmds", {
  clear = true,
})

local function refresh_nvim_tree()
  require("nvim-tree.api").tree.change_root(vim.fn.getcwd())
end

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = { "*" },
  group = augroup,
  desc = "Update current working directory after changing directory",
  callback = function()
    refresh_nvim_tree()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = { "SessionLoadPost" },
  group = augroup,
  desc = "Update current working after loading session",
  callback = function()
    refresh_nvim_tree()
  end,
})
