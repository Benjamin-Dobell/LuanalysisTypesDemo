tab = {hi = 2}

for i, v in ipairs(--[[---@type any]] tab.hi) do
end

local localVar = {}

function localVar:add(a, b)
    return a + b
end

function moo()
    return localVar
end

---@type function
local myThing

---@type any
local aAny

myThing = aAny

shallow = {1, function(a) end, 3}

deep = {
    indeed = {
        hi = {1, 2, 3}
    }
}

---@return boolean
function moo2()
    moo():add(123, 0.4)

    ---@type nil | 'indeed'
    local nilOrIndeed = 'indeed'

    local aNumber = deep.indeed['hi'][1]
    
    nonExistent.soWhat()

    ipairs(deep[--[[---@not nil]] nilOrIndeed].hi)
    return true
end
