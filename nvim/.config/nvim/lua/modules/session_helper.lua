local M = {}

-- Default configuration
M.project_directories = {}

-- Configure the module with custom settings
M.configure = function(opts)
    opts = opts or {}
    M.project_directories = opts.project_directories or M.project_directories
end

-- Find directory in project_directories table by session_name
local function find_in_table(needle, haystack)
    for _, value in ipairs(haystack) do
        if value.session_name == needle then
            return value.dir
        end
    end
    return nil
end

-- Change to a directory
local function change_to_directory(path)
    print('Changing directory to ' .. path)
    vim.cmd('cd ' .. vim.fn.fnameescape(path))
end

-- Find git root directory
local function find_git_root(buf_dir)
    local git_dir = vim.fs.find('.git', {
        path = buf_dir,
        upward = true,
    })[1]

    if git_dir then
        return vim.fn.fnamemodify(git_dir, ':h')
    end
    return nil
end

-- Main function to find and change to root directory
M.find_root_dir = function(session_data)
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    if not bufname or bufname == '' then
        print('No buffer loaded, cannot determine project root')
        return
    end

    local buf_dir = vim.fn.fnamemodify(bufname, ':h')
    local root_dir = find_git_root(buf_dir)

    if not root_dir then
        print('No .git directory found, keeping current directory')
        return
    end

    local dir_name = vim.fn.fnamemodify(root_dir, ':t')

    -- Special handling for dotfiles directory
    if dir_name == 'dotfiles' then
        local path = find_in_table(session_data.name, M.project_directories)
        if path then
            change_to_directory(path)
            return
        end
    end

    change_to_directory(root_dir)
end

return M
