---@class EmptyClass
local SimpleClass = {}

---@type EmptyClass
local emptyClass

---@class ClassWithFields
---@field a string
---@field b number
local ClassWithFields = {}

---@type ClassWithFields
local tablesAreNotClasses

tablesAreNotClasses.a = 1 -- Expect error "Type mismatch. Required: 'string'. Found: 'number'"
tablesAreNotClasses.b = "someString" -- Expect error "Type mismatch. Required: 'number'. Found: 'string'"

tablesAreNotClasses.a = "someString"
tablesAreNotClasses.b = 1

tablesAreNotClasses.a = "someOtherString"
tablesAreNotClasses.b = 2

tablesAreNotClasses = { -- Expect error "Type mismatch. Required: 'ClassWithFields' Found: 'table'"
    a = "someString",
    b = 1
}
