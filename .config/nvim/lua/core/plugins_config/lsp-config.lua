local lsp_zero = require("lsp-zero").preset({})
local navic = require("nvim-navic")

lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

vim.diagnostic.config({
	update_in_insert = false,
	virtual_text = false,
	underline = true,
	signs = true,
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"phpactor",
		"graphql",
		"lemminx",
		"lua_ls",
		"yamlls",
		"jsonls",
		"sqlls",
		"html",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>lx", ":CodeActionMenu<cr>", { silent = true, buffer = bufnr })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
	vim.keymap.set({ "n", "x" }, "<leader>lf", function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end)

require("mason-null-ls").setup({
	ensure_installed = {
		"pint",
	},
	handlers = {
	},
})

-- automatic formatting on save
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local lsp_attach = function(client, bufnr)
--   lsp_zero.async_autoformat(client, bufnr)
-- end
