---@class ClassWithAField
local ClassWithAField = { field = "name" }

---@return number, ClassWithAField
local function multipleReturns()
    ---@type ClassWithAField
    local res
    return 1, res
end

---@type string
local aString

---@type number, ClassWithAField
local aNumber, classWithAField = multipleReturns()
classWithAField, aNumber = multipleReturns() -- Expect error
aNumber, classWithAField, aString = multipleReturns() -- Expect error
aNumber = multipleReturns() -- Expect weak warning
aNumber, aString = multipleReturns(), "some string"
aString, aNumber = "some string", multipleReturns() -- Expect weak warning

local implicitNumber, implicitClassWithAField = multipleReturns()


aNumber = implicitNumber
classWithAField = implicitClassWithAField

local a, b, c = multipleReturns() -- Expect error
local d = multipleReturns() -- Expect weak warning

---@param arg1 number
---@param arg2 string
---@vararg boolean
local function acceptsNumberStringVariadicBoolean(arg1, arg2, ...) end

---@param arg1 number
---@param arg2 string
local function acceptsNumberString(arg1, arg2) end

---@return number, string, boolean...
local function returnsNumberStringVariadicBoolean()
    return 1, "a string", true
end

---@return string, boolean...
local function returnStringVariadicBoolean()
    return "a string", true
end

---@return number, string, boolean
local function returnsNumberStringBoolean()
    return 1, "a string", true
end

acceptsNumberStringVariadicBoolean(1, "a string", true)
acceptsNumberStringVariadicBoolean(returnsNumberStringVariadicBoolean())
acceptsNumberStringVariadicBoolean(returnsNumberStringVariadicBoolean(), true) -- Expect error
acceptsNumberStringVariadicBoolean(1, returnStringVariadicBoolean())
acceptsNumberString(returnsNumberStringVariadicBoolean()) -- Expect weak warning
acceptsNumberString(returnsNumberStringBoolean()) -- Expect weak warning
