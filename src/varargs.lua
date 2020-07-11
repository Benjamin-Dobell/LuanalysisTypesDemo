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

---@type nil | number
local nilOrNumber

---@type nil | boolean
local nilOrBoolean

---@vararg number
local function varargFunction7(...)
    nilOrNumber = ...
    nilOrNumber, nilOrNumber = ...
    nilOrBoolean, nilOrBoolean = ... -- Expect error
    nilOrBoolean, nilOrBoolean = ... -- Expect error
end

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
    return --[[---@type T]] table.unpack({...}, index, 1)
end

aNumber = genericVarargFunction3(1, 1, 2, 3)
aNumber = genericVarargFunction3(1, true, false, true) -- Expect error
aBoolean = genericVarargFunction3(1, 1, 2, 3) -- Expect error
aBoolean = genericVarargFunction3(1, true, false, true)


---@type 1
local one

---@type 3
local three

---@type table<string, string>
local stringStringTable

---@generic K, V
---@vararg table<K, V>
---@return table<K, V>
local function merge(...)
    ---@type table<K, V>
    local res

    return res
end

local mergedLiteralArr = merge({1, 2}, {3, 4})
local mergedLiteralMap = merge({a = 1, b = 2}, {c = 3, d = 4})

mergedLiteralArr[1] = one
mergedLiteralArr[1] = three
mergedLiteralArr[1] = 5 -- Expect error

mergedLiteralMap.a = one
mergedLiteralMap.a = three
mergedLiteralMap.a = 5 -- Expect error

mergedLiteralMap.e = one -- Expect error

local mergedStringStringMap = merge(stringStringTable, stringStringTable)

mergedStringStringMap.a = "a string"
mergedStringStringMap.a = 1 -- Expect error
mergedStringStringMap['a'] = "a string"
mergedStringStringMap['a'] = 1 -- Expect error


---@type fun<K, V>(...: table<K, V>): table<K, V>
local typeMerge

local typeMergedLiteralArr = typeMerge({1, 2}, {3, 4})
local typeMergedLiteralMap = typeMerge({a = 1, b = 2}, {c = 3, d = 4})

typeMergedLiteralArr[1] = one
typeMergedLiteralArr[1] = three
typeMergedLiteralArr[1] = 5 -- Expect error

typeMergedLiteralMap.a = one
typeMergedLiteralMap.a = three
typeMergedLiteralMap.a = 5 -- Expect error

typeMergedLiteralMap.e = one -- Expect error

local typeMergedStringStringMap = typeMerge(stringStringTable, stringStringTable)

typeMergedStringStringMap.a = "a string"
typeMergedStringStringMap.a = 1 -- Expect error
typeMergedStringStringMap['a'] = "a string"
typeMergedStringStringMap['a'] = 1 -- Expect error

---@overload fun<K, V>(...: table<K, V>): table<K, V>
local function overloadMerge(...)
end

local overloadMergedLiteralArr = overloadMerge({1, 2}, {3, 4})
local overloadMergedLiteralMap = overloadMerge({a = 1, b = 2}, {c = 3, d = 4})

overloadMergedLiteralArr[1 ] = one
overloadMergedLiteralArr[1] = three
overloadMergedLiteralArr[1] = 5 -- Expect error

overloadMergedLiteralMap.a = one
overloadMergedLiteralMap.a = three
overloadMergedLiteralMap.a = 5 -- Expect error

overloadMergedLiteralMap.e = one -- Expect error

local overloadMergedStringStringMap = overloadMerge(stringStringTable, stringStringTable)

overloadMergedStringStringMap.a = "a string"
overloadMergedStringStringMap.a = 1 -- Expect error
overloadMergedStringStringMap['a'] = "a string"
overloadMergedStringStringMap['a'] = 1 -- Expect error

---@return number...
local returnVarNumber() end

---@vararg number
local acceptVarNumber(...) end

acceptVarNumber(returnVarNumber())
