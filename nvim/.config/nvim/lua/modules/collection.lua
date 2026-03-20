--------------------------------------------------------------------------------
-- Collection module
--------------------------------------------------------------------------------

local Collection = {}
Collection.__index = Collection

---@class Collection
function Collection:new(tbl)
    local obj = setmetatable({}, self)
    obj.table = tbl or {}
    return obj
end

---@description helper function to create a new collection from a table
Collection.collect = function(tbl)
    return Collection:new(tbl)
end

---@description helper function to determine if a table is an array
function Collection:isArray(t)
    local i = 0
    for _ in pairs(t) do
        i = i + 1
        if t[i] == nil then return false end
    end
    return true
end

---@description Add one or more items to the collection
---@return self
function Collection:push(...)
    local items = { ... }
    for _, item in ipairs(items) do
        table.insert(self.table, item)
    end
    return self
end

---@description Add one item to the collection
---@param key string|number
---@param value any
---@return self
function Collection:put(key, value)
    self.table[key] = value
    return self
end

---@description Get the value of a key
---@param key string|number
---@return any
function Collection:get(key)
    return self.table[key]
end

---@description Get the keys of the collection
---@return table
function Collection:keys()
    local keys = {}
    for key, _ in pairs(self.table) do
        table.insert(keys, key)
    end
    return keys
end

---@description Get the values of the collection
---@return table
function Collection:values()
    local values = {}
    if self:isArray(self.table) then
        for _, value in ipairs(self.table) do
            table.insert(values, value)
        end
        return values
    end

    for _, value in pairs(self.table) do
        table.insert(values, value)
    end

    return values
end

---@description Merge the collection with another one
---@param collection Collection
---@return self
function Collection:merge(collection)
    for key, value in pairs(collection.table) do
        if type(key) == 'number' then
            self:push(value)
        else
            self:put(key, value)
        end
    end
    return self
end

---@description Remove and return the first item from the collection
---@return any
function Collection:shift()
    return table.remove(self.table, 1)
end

---@description Remove and return the last item from the collection
---@return any
function Collection:pop()
    return table.remove(self.table, #self.table)
end

---@description Return the first item from the collection
---@return any
function Collection:first()
    return self.table[1]
end

---@description Return the last item from the collection
---@return any
function Collection:last()
    return self.table[#self.table]
end

---@description Iterate over the collection
---@param fn function(value: any, key: any)
---@return self
function Collection:each(fn)
    for key, value in ipairs(self.table) do
        fn(value, key)
    end
    return self
end

---@description Filter the collection
---@param fn function(value: any, key: any)
---@return self
function Collection:filter(fn)
    local new_collection = Collection:new()
    for key, value in ipairs(self.table) do
        if fn(value, key) then
            new_collection:push(value)
        end
    end
    return new_collection
end

function Collection:count()
    if self:isArray(self.table) then
        return #self.table
    end

    return Collection:new(self:values()):count()
end

function Collection:is_empty()
    return self:count() == 0
end

function Collection:is_not_empty()
    return self:count() > 0
end

---@description Determine if the collection contains a value
---@param key string|function
---@param value any
---@return boolean
function Collection:contains(key, value)
    if value == nil then
        for k, v in pairs(self.table) do
            if type(key) == 'function' and key(v, k) then
                return true
            elseif v == key then
                return true
            end
        end
    elseif (type(key) == 'string' and value ~= nil) then
        return self:get(key) == value
    end
    return false
end

---@description Determine if some collection item matches the given predicate
---@param fn function(value: any, key: any)
---@return boolean
function Collection:some(fn)
    for key, value in ipairs(self.table) do
        if fn(value, key) then
            return true
        end
    end
    return false
end

---@description Determine if all collection items match the given predicate
---@param fn function(value: any, key: any)
---@return boolean
function Collection:every(fn)
    for key, value in ipairs(self.table) do
        if not fn(value, key) then
            return false
        end
    end
    return true
end

---@description Return the difference between two collections
---@param collection Collection
---@return Collection
function Collection:diff(collection)
    local found = Collection:new()
    for _, value in ipairs(self.table) do
        if not collection:contains(value) then
            found:push(value)
        end
    end
    return found
end

return Collection
