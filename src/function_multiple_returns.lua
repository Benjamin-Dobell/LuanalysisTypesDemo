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
    if aNumber == 1 then
        return 1, "a string", true
    elseif aNumber == 2 then
        ---@type string @Expect error
        return 1, "a string", true -- Expect error
    else
        return returnsNumberStringVariadicBoolean() -- Expect error
    end
end

acceptsNumberStringVariadicBoolean(1, "a string", true)
acceptsNumberStringVariadicBoolean(returnsNumberStringVariadicBoolean())
acceptsNumberStringVariadicBoolean(returnsNumberStringVariadicBoolean(), true) -- Expect error
acceptsNumberStringVariadicBoolean(1, returnStringVariadicBoolean())
acceptsNumberString(returnsNumberStringVariadicBoolean())
acceptsNumberString(returnsNumberStringBoolean()) -- Expect weak warning

---@return number, number
local function returnsNumberNumber()
    return 0, 0
end

---@return string, string
local function returnsStringString()
    return "a", "a"
end

local returnsNumberNumberOrStringString = {returnsNumberNumber, returnsStringString}

---@type number | string
local numberOrString

for _, fun in ipairs(returnsNumberNumberOrStringString) do
    local numberOrString1, numberOrString2 = fun()

    numberOrString = numberOrString1
    numberOrString = numberOrString2

    aNumber = numberOrString1 -- Expect error
    aNumber = numberOrString2 -- Expect error
end


---@return 1, 2, 3
local function returns123()
    return 1, 2, 3
end

---@type number[]
local numberArray = {returns123()}

---@overload fun(f: (fun: void), ...: any): nil|string
---@generic T
---@param f fun: T
---@return string | T
local function returnStringOrGeneric(f, ...)
    return aString
end

local inferredNumberOrString = returnStringOrGeneric(returns123)

numberOrString = inferredNumberOrString
aNumber = inferredNumberOrString -- Expect error

local hmm = returnStringOrGeneric(function() end)

aString = hmm
