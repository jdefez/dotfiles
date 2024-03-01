return {
  "phpactor/phpactor",
  event = "VeryLazy",
  config = function()
    vim.g.phpactorCompletionIgnoreCase = true
  end,
  keys = {
    { "<leader>p", ":PhpactorContextMenu<CR>", desc = "Phpactor context menu" },
    -- { mode = "v", "<leader>pm", ":<C-U>PhpactorExtractMethod<CR>", desc = "Phpactor extract method" },
    -- { mode = "v", "<leader>pe", ":<C-U>PhpactorExtractExpression<CR>", desc = "Phpactor extract expression" },
    -- { mode = "v", "<leader>pi", ":<C-U>PhpactorInlineVariable<CR>", desc = "Phpactor inline variable" },
    -- { mode = "v", "<leader>pr", ":<C-U>PhpactorRenameVariable<CR>", desc = "Phpactor rename variable" },
    -- { mode = "v", "<leader>pt", ":<C-U>PhpactorTransform<CR>", desc = "Phpactor transform" },
    -- { mode = "v", "<leader>ps", ":<C-U>PhpactorExtractConstant<CR>", desc = "Phpactor extract constant" },
    -- { mode = "v", "<leader>pc", ":<C-U>PhpactorExtractProperty<CR>", desc = "Phpactor extract property" },
    -- { mode = "v", "<leader>pa", ":<C-U>PhpactorAddProperty<CR>", desc = "Phpactor add property" },
    -- { mode = "v", "<leader>pb", ":<C-U>PhpactorAddParameter<CR>", desc = "Phpactor add parameter" },
    -- { mode = "v", "<leader>pf", ":<C-U>PhpactorAddFunction<CR>", desc = "Phpactor add function" },
    -- { mode = "v", "<leader>pl", ":<C-U>PhpactorList<CR>", desc = "Phpactor list" },
    -- { mode = "v", "<leader>pw", ":<C-U>PhpactorMove<CR>", desc = "Phpactor move" },
    -- { mode = "v", "<leader>px", ":<C-U>PhpactorExtractClass<CR>", desc = "Phpactor extract class" },
    -- { mode = "v", "<leader>py", ":<C-U>PhpactorCopy<CR>", desc = "Phpactor copy" },
  },
}
