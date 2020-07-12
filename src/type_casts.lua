---@param returnString boolean
---@return string|number
local function stringOrNumber(returnString)
    return returnString and "someString" or 1
end

---@param n number
function wantsNumber(n)
end

wantsNumber(stringOrNumber(false)) -- Type mismatch. Required: 'number' Found 'string|number'
wantsNumber(--[[---@type number]] stringOrNumber(false))
wantsNumber(--[[---@not string]] stringOrNumber(false))
wantsNumber(--[[---@not number]] stringOrNumber(false)) -- Expect error

wantsNumber(
        ---@type number @Single line doc comments also work as type casts
        stringOrNumber(false)
)

wantsNumber(--[[---@type fun(): any]] 1) -- Type mismatch. Required: 'number' Found 'fun(): any'

---@param arr any[]
function wantsArray(arr)
end

local aString = "aString"

wantsArray(aString) -- Type mismatch. Required: 'any[]' Found 'string'
wantsArray(--[[--- @type any[] ]] aString) -- Trailing space used to separate array ']' from the block comment ']]'.


local aNumber = 1

---@return number, string
local function multiReturn()
    return 1, "a string"
end

aNumber, aString = multiReturn()
aString, aNumber = multiReturn() -- Expect error
aString, aNumber = --[[---@type string, number]] multiReturn()
aString, aNumber = --[[---@type string, string]] multiReturn() -- Expect error


---@type number|nil
local numberOrNil

wantsNumber(numberOrNil) -- Expect error
wantsNumber(--[[---@not nil]] numberOrNil)

---@param returnNumbers boolean
---@return number|string, number|string
local function multiReturn2(returnNumbers)
    return stringOrNumber(returnNumbers), stringOrNumber(returnNumbers)
end


aNumber, aNumber = multiReturn2(true) -- Expect error
aNumber, aNumber = --[[---@not string, string]] multiReturn2(true)
aNumber, aString = --[[---@not string, number]] multiReturn2(true)
aNumber = multiReturn2(true) -- Expect error
aNumber = --[[---@not string]] multiReturn2(true)


---@type number[]
local numberArray

local a, b, c = --[[---@not nil, nil, nil]] table.unpack(numberArray, 1, 3)

aNumber = a
aNumber = b
aNumber = c

aString = a -- Expect error
aString = b -- Expect error
aString = c -- Expect error

---@type (number | string)[]
local stringOrNumberArray

local d, e, f = --[[---@not nil | number, nil | number, nil | number]] table.unpack(stringOrNumberArray, 1, 3)

aNumber = d -- Expect error
aNumber = e -- Expect error
aNumber = f -- Expect error

aString = d
aString = e
aString = f

---@type nil | number
local nilOrNumber

local g, h, i = --[[---@not string...]] table.unpack(stringOrNumberArray, 1, 3)

nilOrNumber = g
nilOrNumber = h
nilOrNumber = i

aNumber = g -- Expect error
aNumber = h -- Expect error
aNumber = i -- Expect error

---@type nil | string
local nilOrString

local j, k, l = --[[---@type string...]] table.unpack(stringOrNumberArray, 1, 3)

nilOrNumber = j -- Expect error
nilOrNumber = k -- Expect error
nilOrNumber = l -- Expect error

nilOrString = j
nilOrString = k
nilOrString = l
