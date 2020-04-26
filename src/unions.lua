---@type string|number
local stringOrNumberVar

---@param returnString boolean
---@return string|number
local function stringOrNumber(returnString)
    return returnString and "someString" or 1
end

---@type any
local unknown

stringOrNumberVar = "hi"
stringOrNumberVar = 7
stringOrNumberVar = stringOrNumber(unknown)

---@type "hi"|number
local stringLiteralOrNumber

stringOrNumberVar = stringLiteralOrNumber

stringLiteralOrNumber = stringOrNumberVar -- Expect error as string is not a subtype of "hi" (a string literal).

---@type table<string, "A" | "B">
local aOrB

---@type table<string, "B" | "A">
local bOrA

---@type table<string, "A" | "C">
local aOrC

aOrB = bOrA
bOrA = aOrB
aOrB = aOrC -- Expect error
