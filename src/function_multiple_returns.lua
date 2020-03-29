---@class ClassWithAField
local ClassWithAField = { field = "name" }

---@return number, ClassWithAField
local function multipleReturns()
    ---@type ClassWithAField
    local res
    return 1, res
end

---@type number
local aNumber

---@type ClassWithAField
local classWithAField

---@type string
local aString

aNumber, classWithAField = multipleReturns()
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
