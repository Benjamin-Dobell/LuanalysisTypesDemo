---@type fun(numberParam: number, vararg boolean)
local varargFunction

varargFunction(1, true, true)
varargFunction(1, true, true, 4, true) -- Expect error

---@type fun(numberParam: number, ...: boolean)
local varargFunction2

varargFunction2(1, true, true)
varargFunction2(1, true, true, 4, true) -- Expect error

---@param numberParam number
---@vararg boolean
local function varargFunction3(numberParam, ...)
end

varargFunction3(1, true, true)
varargFunction3(1, true, true, 4, true) -- Expect error

---@type fun(vararg boolean)
local varargFunction4

varargFunction4(true, true)
varargFunction4(true, true, 4, true) -- Expect error
varargFunction4(1, true) -- Expect error

---@type fun(...: boolean)
local varargFunction5

varargFunction5(true, true)
varargFunction5(true, true, 4, true) -- Expect error
varargFunction5(1, true) -- Expect error

---@vararg boolean
local function varargFunction6(...)
end

varargFunction6(true, true)
varargFunction6(true, true, 4, true) -- Expect error
varargFunction6(1, true) -- Expect error

---@type number
local aNumber

---@type boolean
local aBoolean

---@type fun<T>(index: number, vararg T): T
local genericVarargFunction

aNumber = genericVarargFunction(1, 1, 2, 3)
aNumber = genericVarargFunction(1, true, false, true) -- Expect error
aBoolean = genericVarargFunction(1, 1, 2, 3) -- Expect error
aBoolean = genericVarargFunction(1, true, false, true)

----@type fun<T>(index: number, ...: T): T
local genericVarargFunction2

aNumber = genericVarargFunction2(1, 1, 2, 3)
aNumber = genericVarargFunction2(1, true, false, true) -- Expect error
aBoolean = genericVarargFunction2(1, 1, 2, 3) -- Expect error
aBoolean = genericVarargFunction2(1, true, false, true)

---@generic T
---@param index number
---@vararg T
---@return T
local function genericVarargFunction3(index, ...)
    return table.unpack({...}, index, 1)
end

aNumber = genericVarargFunction3(1, 1, 2, 3)
aNumber = genericVarargFunction3(1, true, false, true) -- Expect error
aBoolean = genericVarargFunction3(1, 1, 2, 3) -- Expect error
aBoolean = genericVarargFunction3(1, true, false, true)
