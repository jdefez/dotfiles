--------------------------------------------------------------------------------
-- Collection module
--------------------------------------------------------------------------------
-- TODO: implements methods:
-- - contains
-- - filter
-- - every
-- - some
-- - shift
-- - unshift
-- - pop ??
-- - merge
-- - sort

local Collection = {}
Collection.__index = Collection

function Collection:new(tbl)
    local obj = setmetatable({}, self)
    obj.table = tbl or {}

    return obj
end

---@description Create a new collection from a table
Collection.collect = function(tbl)
    return Collection:new(tbl)
end

---@return self
function Collection:push(...)
    local items = { ... }
    for _, item in ipairs(items) do
        table.insert(self.table, item)
    end

    return self
end

---@param fn function to apply to each item
---@return self
function Collection:each(fn)
    for _, item in ipairs(self.table) do
        fn(item)
    end

    return self
end

function Collection:count()
    return #self.table
end

function Collection:is_empty()
    return self:count() == 0
end

function Collection:is_not_empty()
    return self:count() > 0
end

return Collection
