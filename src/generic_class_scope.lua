---@class GenericInMethod<T>
---@field a T
local GenericInMethod = {}

---@param arg T
function GenericInMethod:colonMethod(arg)
    ---@type T
    local thing

    thing = self.a
end

---@param arg T
function GenericInMethod.dotMethod(arg)
    ---@type T
    local thing

    thing = self.a
end

---@param arg T
GenericInMethod.lambdaMethod = function(arg)
    ---@type T
    local thing

    thing = self.a
end

-- Expect error
---@generic T
---@param arg T
function GenericInMethod:colonMethodShadow(arg)
end


-- Expect error
---@generic T
---@param arg T
function GenericInMethod:dotMethodShadow(arg)
end

-- Expect error
---@generic T
---@param arg T
GenericInMethod.lambdaMethodShadow = function(arg)
end
