--------------------------------------------------------------------------------
-- Sample class implementation
--------------------------------------------------------------------------------

local Person = {}
Person.__index = Person

function Person:new(name)
  local obj = setmetatable({}, self)
  obj.name = name or "unknown"
  return obj
end

function Person:greet()
  print("Hello, I'm " .. self.name)
end

local jean = Person:new("Jean-François")
jean:greet()
