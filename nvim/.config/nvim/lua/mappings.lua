require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "Y", "yy$")

-- NOTE: removing NvChad terminal mappings

nomap("n", "<M-h>")
nomap("n", "<M-i>")
nomap("n", "<M-v>")

--
-- nvim-tree
--

local function nvim_tree_on_attach(bufnr)
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

  --
  -- default mappings
  --

  api.config.mappings.default_on_attach(bufnr)

  --
  -- nvimtree
  --

  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  -- vim.keymap.set("n", "<c-z>", api.node.open.preview, opts "Open preview")

  require("float-preview").attach_nvimtree(bufnr)
end

require("nvim-tree").setup {
  on_attach = nvim_tree_on_attach,
}

--
-- Treewalker
--

map("n", "<C-]>", ":Treewalker Down<CR>", { desc = "Treewalker down" })
map("n", "<C-[>", ":Treewalker Up<CR>", { desc = "Treewalker up" })
map("n", "<S-h>", ":Treewalker Left<CR>", { desc = "Treewalker in" })
map("n", "<S-l>", ":Treewalker Right<CR>", { desc = "Treewalker out" })

--
-- Telescope
--

map("n", "<leader>fW", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "telescope grep current word" })

--
-- Gitsigns
--

require("gitsigns").setup {
  on_attach = function(bufnr)
    local gitsigns = require "gitsigns"

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal { "]c", bang = true }
      else
        gitsigns.nav_hunk "next"
      end
    end)

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal { "[c", bang = true }
      else
        gitsigns.nav_hunk "prev"
      end
    end)

    map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
    map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
    map("v", "<leader>gs", function()
      gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, { desc = "Stage hunk" })
    map("v", "<leader>gr", function()
      gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, { desc = "Reset hunk" })
    map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
    map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
    map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
    map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
    map("n", "<leader>gb", function()
      gitsigns.blame_line { full = true }
    end, { desc = "Blame line" })
    map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame line" })
    map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })
    map("n", "<leader>gD", function()
      gitsigns.diffthis "~"
    end, { desc = "Diff this (cached)" })
    map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle deleted" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
  end,
}
