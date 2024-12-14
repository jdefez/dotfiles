require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<leader>/")

map("i", "jk", "<ESC>")
map("n", "Y", "yy$")

--
-- NOTE: Treewalker
--

map("n", "<C-]>", ":Treewalker Down<CR>", { desc = "Treewalker down" })
map("n", "<C-[>", ":Treewalker Up<CR>", { desc = "Treewalker up" })
map("n", "<C-h>", ":Treewalker Left<CR>", { desc = "Treewalker in" })
map("n", "<C-l>", ":Treewalker Right<CR>", { desc = "Treewalker out" })

--
-- NOTE: nvim-tree
--

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- NOTE: Default mappings

  api.config.mappings.default_on_attach(bufnr)

  -- NOTE: Custom mappings

  map("n", "?", api.tree.toggle_help, opts "Help")
  -- vim.keymap.set("n", "<c-z>", api.node.open.preview, opts "Open preview")

  require("float-preview").attach_nvimtree(bufnr)
end

require("nvim-tree").setup {
  on_attach = my_on_attach,
}

--
-- NOTE: Telescope
--

map("n", "<leader>fW", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "telescope grep current word" })
