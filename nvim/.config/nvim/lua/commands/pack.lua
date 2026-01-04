local function complete_packages(ArgLead)
    local packages = vim.iter(vim.pack.get())
        :map(function(pack) return pack.spec.name end)
        :totable()

    if ArgLead ~= "" then
        packages = vim.tbl_filter(function(item)
            return vim.startswith(item, ArgLead)
        end, packages)
    end

    return packages
end

vim.api.nvim_create_user_command(
    'PackUpdate',
    function(info)
        if #info.fargs ~= 0 then
            vim.pack.update(info.fargs, { force = info.bang })
        else
            vim.pack.update(nil, { force = info.bang })
        end
    end,
    {
        desc = 'Update packages',
        nargs = '*',
        bang = true,
        complete = complete_packages,
    }
)

vim.api.nvim_create_user_command(
    'PackDelete',
    function(info)
        vim.pack.del(info.fargs)
    end,
    {
        desc = 'Delete packages',
        nargs = 1,
        complete = complete_packages,
    }
)
