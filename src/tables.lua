---@type table
local implicitUnknown

pairs(implicitUnknown)

---@type table<any, any>
local explicitUnknown

pairs(explicitUnknown)

---@type table<number, number>
local numberNumberTable

---@type table<number, string>
local numberStringTable

---@type table<string, string>
local stringStringTable

---@type number[]
local numberArray

---@type string[]
local stringArray

numberNumberTable[1] = 1
numberNumberTable[1] = "a string" -- Expect error

numberStringTable[1] = 1 -- Expect error
numberStringTable[1] = "a string"
numberStringTable[1] = nil

numberArray[1] = 1
numberArray[1] = "a string" -- Expect error
numberArray[1] = nil -- Expect error

stringArray[1] = 1 -- Expect error
stringArray[1] = "a string"

stringStringTable['a'] = 'a string'
stringStringTable['a'] = 1 -- Expect error
stringStringTable.a = 'a string'
stringStringTable.a = 1 -- Expect error

numberNumberTable = numberArray
numberNumberTable = stringArray -- Expect error
numberArray = stringArray -- Expect error

numberArray = {1, 2, 3}
numberNumberTable = {1, 2, 3}

-- Widen literal tables
numberArray = {[1] = 1, [3] = 3} -- Expect error
numberNumberTable = {[1] = 1, [3] = 3}

numberArray = {one = 1, two = 2, three = 3} -- Expect error
numberNumberTable = {one = 1, two = 2, three = 3} -- Expect error

stringArray = {"one", "two", "three"}
numberStringTable = {"one", "two", "three"}

-- Widen literal tables
stringArray = {[1] = "one", [3] = "three"} -- Expect error
numberStringTable = {[1] = "three", [3] = "three"}

---@param arg table<number, number>
local function wantsNumberNumberTable(arg) end

wantsNumberNumberTable(numberNumberTable)
wantsNumberNumberTable(numberStringTable) -- Expect error
wantsNumberNumberTable({[1] = 1, [3] = 3})
wantsNumberNumberTable({1, 2, 3})

---@type "stringLiteral"
local explictlyTypedLiteral

local tableAssignedWithLiteral = {
    a = "stringLiteral",
    b = "aDifferentStringLiteral"
}

explictlyTypedLiteral = tableAssignedWithLiteral.a
explictlyTypedLiteral = tableAssignedWithLiteral.b -- Expect error

local tableAssignedAfterDeclaration = {}

tableAssignedAfterDeclaration.a = "stringLiteral"
tableAssignedAfterDeclaration.b = "aDifferentStringLiteral"

explictlyTypedLiteral = tableAssignedAfterDeclaration.a
explictlyTypedLiteral = tableAssignedAfterDeclaration.b -- Expect error

---@type any
local anyValue

local tableWithoutEntries = {}

anyValue = tableWithoutEntries.keyThatDoesNotExist -- Expect error

stringArray = {}
numberArray = {}
numberNumberTable = {}
numberStringTable = {}
explicitUnknown = {}
implicitUnknown = {}
explictlyTypedLiteral = {} -- Expect error
wantsNumberNumberTable({})

---@type number
local thing

---@return table<'a', 1>
local function returnSpecificTable()
    if thing == 1 then
        local anonymousTable1 = {}
        anonymousTable1.a = 1
        return anonymousTable1
    elseif thing == 2 then
        local anonymousTable2 = {}
        anonymousTable2.a = 2
        return anonymousTable2 -- Expect error
    elseif thing == 3 then
        local anonymousTable3 = {}
        anonymousTable3.b = 1
        return anonymousTable3 -- Expect error
    else
        return {}
    end
end

---@type string
local aString

---@type table<string, {aNumber: number}>
local tableLiteralWithNonLiteralKey = {
    [aString] = {
        aNumber = 1
    }
}

tableLiteralWithNonLiteralKey = { -- Expect error
    [aString] = {
        aNumber = "wrong"
    },
}

---@type number[]
local arr = {1, 2, 3, [5]=1} -- Expect error
