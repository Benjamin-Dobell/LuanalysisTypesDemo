---@type any
local anything

---@type number
local anyNumber

---@type string
local anyString

---@type boolean
local anyBoolean

---@type 1
local number1

---@type 2
local number2

---@type "string1"
local string1

---@type 1|"string1"
local number1OrString1

---@generic T
---@param arg T
local function fn(arg)
    -- T = anonymous type : void (inherits from void because we can make no assumptions about it)
    local var = arg

    anyNumber = var -- Expect error
    anyString = var -- Expect error
    anything = var
end

-- T = any
fn(anything)
fn(anyNumber)
fn(number1)
fn(anyString)
fn(string1)


---@generic T : number
---@param arg T
local function fn2(arg)
    -- T = anonymous type : number
    local var = arg

    anyNumber = var
    number1 = var -- Expect error
    anyString = var -- Expect error
end

-- T = number
fn2(anything)
fn2(anyNumber)
fn2(number1)
fn2(anyString) -- Expect error
fn2(string1) -- Expect error




---@generic T
---@param arg1 T
---@param arg2 T
local function fn3(arg1, arg2) end

-- T = 1|2
fn3(number1, number2)

-- T = 1|"string1"
fn3(number1, string1)



---@generic T : number
---@param arg1 T
---@param arg2 T
local function fn4(arg1, arg2)
    -- T = anonymous type : number

    anyNumber = arg1
    anyNumber = arg2
    number1 = arg1 -- Expect error
    number1 = arg2 -- Expect error

    
    ---@type T
    local t

    t = arg1
    t = arg2

    arg1 = arg2
    arg2 = arg1
end

-- T = 1|2
fn4(number1, number2)

-- T = number
fn4(number1, string1) -- Expect error



---@generic T
---@param arg T
---@return T
local function fn5(arg)
    return arg
end

-- T = typeof(arg)
string1 = fn5(string1)
anyString = fn5(string1)
number1 = fn5(number1)
number2 = fn5(number2)
number1 = fn5(number2) -- Expect error
anyNumber = fn5(number1)



---@generic T
---@param arg1 T
---@param arg2 T
------@return T
local function fn6(arg1, arg2)
    return arg1
end

-- T = 1|2
anything = fn6(number1, number2)
anyNumber = fn6(number1, number2)
anyString = fn6(number1, number2) -- Expect error
number1 = fn6(number1, number2) -- Expect error
number2 = fn6(number1, number2) -- Expect error

-- T = 1|"string1"
anyNumber = fn6(number1, string1) -- Expect error
anyString = fn6(number1, string1) -- Expect error
number1OrString1 = fn6(number1, string1)

-- T = number
anything = fn6(number1, anyNumber)
anyNumber = fn6(number1, anyNumber)
anyString = fn6(number1, anyNumber) -- Expect error
number1 = fn6(number1, anyNumber) -- Expect error
number2 = fn6(number1, anyNumber) -- Expect error



---@generic T
---@param arg1 T
---@param arg2 T
---@param arg3 table<T, T>
------@return T
local function fn7(arg1, arg2, arg3)
    return arg1
end

---@type table<number, number>
local numberNumberTable

---@type table<1, 1>
local number1Number1Table

-- T = 1
anything = fn7(number1, number1, number1Number1Table)
anyNumber = fn7(number1, number1, number1Number1Table)
anyString = fn7(number1, number1, number1Number1Table) -- Expect error
number1 = fn7(number1, number1, number1Number1Table)
number2 = fn7(number1, number1, number1Number1Table) -- Expect error

-- T = number
anything = fn7(number1, number2, numberNumberTable)
anyNumber = fn7(number1, number2, numberNumberTable)
anyString = fn7(number1, number2, numberNumberTable) -- Expect error
number1 = fn7(number1, number2, numberNumberTable) -- Expect error
number2 = fn7(number1, number2, numberNumberTable) -- Expect error

---@type number[]
local numberArray

-- T = number
anything = fn7(number1, number2, numberArray)
anyNumber = fn7(number1, number2, numberArray)
anyString = fn7(number1, number2, numberArray) -- Expect error
number1 = fn7(number1, number2, numberArray) -- Expect error
number2 = fn7(number1, number2, numberArray) -- Expect error
anyNumber = fn7(number1, number2, {3})
number1 = fn7(number1, number2, {3}) -- Expect error


---@type table<string|number, string|number>
local stringOrNumberStringOrNumberTable

---@type string|number
local stringOrNumber

-- T = commonAncestor(arg1, arg2) = number|string
anything = fn7(number1, string1, stringOrNumberStringOrNumberTable)
stringOrNumber = fn7(number1, string1, stringOrNumberStringOrNumberTable)
anyNumber = fn7(number1, number2, stringOrNumberStringOrNumberTable) -- Expect error
anyString = fn7(number1, number2, stringOrNumberStringOrNumberTable) -- Expect error


---@generic K, V
---@param arg1 K
---@param arg2 V
---@param arg3 table<K, V>
---@return table<K, V>
local function fn8(arg1, arg2, arg3)
    return arg3
end

---@type table<string, number>
local stringNumberTable

-- K = string, V = number
stringOrNumber = fn8(anyString, number1, stringNumberTable) -- Expect error
stringNumberTable = fn8(anyString, number1, stringNumberTable)
stringNumberTable = fn8(string1, number1, stringNumberTable)
stringNumberTable = fn8(anyString, number1, numberArray) -- Expect error
stringNumberTable = fn8(anyNumber, number1, numberArray) -- Expect error


---@generic K : string, T : table<K, string>
---@param arg1 K
---@param arg2 T
---@return T
local function fn9(arg1, arg2)
    return arg2
end

---@type table<string, string>
local stringStringTable

-- K = string, T = table<string, string>
anyString = fn9(anyString, stringStringTable) -- Expect error
stringStringTable = fn9(anyString, stringStringTable)
stringStringTable = fn9(anyString, stringNumberTable) -- Expect error
stringStringTable = fn9(string1, stringStringTable)

---@type table<"string1", string>
local string1StringTable

-- K = "string1", T = table<"string1", string>
string1StringTable = fn9(string1, string1StringTable)
string1StringTable = fn9(string1, stringStringTable) -- Expect error
stringStringTable = fn9(string1, string1StringTable) -- Expect error

---@generic T : boolean
local function fn10()
    -- Expect error
    ---@generic T : string
    local function fn10Nested(arg)
    end
end


---@type fun<K, V>(tab: table<K, V>, func: fun(key: K, value: V))
local fn11

-- K = 1|2,
fn11({a = 1, b = 2}, function(key, value)
    anyString = key
    anyNumber = key -- Expect error
    anyString = value -- Expect error
    anyNumber = value
end)

fn11(stringNumberTable, function(key, value)
    anyString = key
    anyNumber = key -- Expect error
    anyString = value -- Expect error
    anyNumber = value
end)

fn11({a = "a", b = "b"}, function(key, value)
    anyString = key
    anyNumber = key -- Expect error
    anyString = value
    anyNumber = value -- Expect error
end)

fn11(stringStringTable, function(key, value)
    anyString = key
    anyNumber = key -- Expect error
    anyString = value
    anyNumber = value -- Expect error
end)

fn11({[1] = "a", [2] = "b"}, function(key, value)
    anyString = key -- Expect error
    anyNumber = key
    anyString = value
    anyNumber = value -- Expect error
end)

fn11({"a", "b"}, function(key, value)
    anyString = key
    anyNumber = key -- Expect error
    anyString = value
    anyNumber = value -- Expect error
end)

fn11(numberArray, function(key, value)
    anyString = key -- Expect error
    anyNumber = key
    anyString = value -- Expect error
    anyNumber = value
end)


---@type 1
local one

---@type 3
local three


---@generic K, V
---@param a table<K, V>
---@param b table<K, V>
---@return table<K, V>
local function merge(a, b)
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


---@type fun<K, V>(a: table<K, V>, b: table<K, V>): table<K, V>
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


---@overload fun<K, V>(a: table<K, V>, b: table<K, V>): table<K, V>
local function overloadMerge(a, b)
end

local overloadMergedLiteralArr = overloadMerge({1, 2}, {3, 4})
local overloadMergedLiteralMap = overloadMerge({a = 1, b = 2}, {c = 3, d = 4})

overloadMergedLiteralArr[1] = one
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


---@overload fun<T : number>(value: T): void
---@generic T : string
---@param optional number
---@param value T
local function overloadedT(value, optional) end

overloadedT(1)
overloadedT("string") -- Expect error

overloadedT(1, 1) -- Expect error
overloadedT("string", 1)


---@generic T
---@param builder fun(): T
---@return T
function build(builder)
    return builder()
end

stringNumberTable = build(function()
    return {a = 1}
end) -- Expect error

stringNumberTable = build(function()
    ---@type table<string, number>
    return {a = 1}
end)


---@type nil | boolean
local nilOrBoolean

---@type nil | number
local nilOrNumber

---@type nil | string
local nilOrString

---@type nil | number | string
local nilOrNumberOrString

---@return string, number
local function returnsStringNumber()
    return "one", 1
end

---@return number, boolean...
local function returnsNumberVariadicBoolean()
    return 1, true, false
end

local function chainedMultipleResults()
    return returnsStringNumber(), returnsStringNumber()
end

---@generic T
---@param f fun(): T
---@return boolean, T
function genericParameterMultipleResults(f, ...)
    return true, f()
end

anyBoolean, anyString, anyNumber = genericParameterMultipleResults(returnsStringNumber)
anyBoolean, anyString, anyString = genericParameterMultipleResults(returnsStringNumber) -- Expect error
anyBoolean, anyBoolean, anyString, anyNumber = genericParameterMultipleResults(returnsStringNumber), genericParameterMultipleResults(returnsStringNumber)

anyBoolean, anyNumber = genericParameterMultipleResults(returnsNumberVariadicBoolean)
anyBoolean, anyNumber, nilOrBoolean, nilOrBoolean = genericParameterMultipleResults(returnsNumberVariadicBoolean)
anyBoolean, anyNumber, nilOrString = genericParameterMultipleResults(returnsNumberVariadicBoolean) -- Expect error
anyBoolean, anyBoolean, anyNumber, nilOrBoolean, nilOrBoolean = genericParameterMultipleResults(returnsNumberVariadicBoolean), genericParameterMultipleResults(returnsNumberVariadicBoolean)
anyBoolean, anyBoolean, anyNumber, nilOrBoolean, nilOrString = genericParameterMultipleResults(returnsNumberVariadicBoolean), genericParameterMultipleResults(returnsNumberVariadicBoolean) -- Expect error

anyBoolean, anyString, anyString, anyNumber = genericParameterMultipleResults(chainedMultipleResults)
anyBoolean, anyString, anyString, anyString = genericParameterMultipleResults(chainedMultipleResults) -- Expect error
anyBoolean, anyBoolean, anyString, anyString, anyNumber = genericParameterMultipleResults(chainedMultipleResults), genericParameterMultipleResults(chainedMultipleResults)

---@generic T
---@param f fun(): T
---@return boolean, T...
function variadicGenericParameterMultipleResults(f, ...)
    return true, f(), f(), f()
end

anyBoolean, nilOrString, nilOrNumberOrString, nilOrNumberOrString = variadicGenericParameterMultipleResults(returnsStringNumber)
anyBoolean, nilOrString, nilOrNumber = variadicGenericParameterMultipleResults(returnsStringNumber) -- Expect error
