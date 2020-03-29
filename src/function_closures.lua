---@class ClassWithClosureMethods
local ClassWithClosureMethods = {}

---@param tab table
---@return boolean
function ClassWithClosureMethods.regularMethod(tab)
    tab = "not a table" -- Expect error
    tab = {}
    return true
end

---@param tab table
---@return boolean
ClassWithClosureMethods.closureMethod = function(tab)
    tab = "not a table" -- Expect error
    tab = {}
    return true
end

---@param tab table
---@return boolean
local function localRegularFunction(tab)
    tab = "not a table" -- Expect error
    tab = {}
    return true
end

---@param tab table
---@return boolean
local localClosureFunction = function(tab)
    tab = "not a table" -- Expect error
    tab = {}
    return true
end

---@type boolean
local aBoolean

---@type string
local aString

-- Usage inspections

aBoolean = ClassWithClosureMethods.regularMethod({})
aString = ClassWithClosureMethods.regularMethod({}) -- Expect error
aBoolean = ClassWithClosureMethods.regularMethod("not a table") -- Expect error

aBoolean = ClassWithClosureMethods.closureMethod({})
aString = ClassWithClosureMethods.closureMethod({}) -- Expect error
aBoolean = ClassWithClosureMethods.closureMethod("not a table") -- Expect error

aBoolean = localRegularFunction({})
aString = localRegularFunction({}) -- Expect error
aBoolean = localRegularFunction("not a table") -- Expect error

aBoolean = localClosureFunction({})
aString = localClosureFunction({}) -- Expect error
aBoolean = localClosureFunction("not a table") -- Expect error

---@param param string
---@return string
local closureInternalTypeInspections = function(param)
    ---@type string
    local a
    a = param

    ---@type number
    local b
    b = param -- Expect error

    param = "okay"
    param = 1 -- Expect error

    --@type fun(): boolean
    local sometimes

    if sometimes() then
        return "a string"
    else
        return 1 -- Expect error
    end
end
