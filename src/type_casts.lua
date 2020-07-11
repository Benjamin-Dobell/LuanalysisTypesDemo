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
