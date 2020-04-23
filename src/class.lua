---@class EmptyClass
local EmptyClass = {}

---@type EmptyClass
local emptyClass

---@class ClassWithFields
---@field a string
---@field b number
local ClassWithFields = {}

---@type ClassWithFields
local classWithFields

classWithFields.a = 1 -- Expect error "Type mismatch. Required: 'string'. Found: 'number'"
classWithFields.b = "someString" -- Expect error "Type mismatch. Required: 'number'. Found: 'string'"

classWithFields.a = "someString"
classWithFields.b = 1

classWithFields.a = "someOtherString"
classWithFields.b = 2

classWithFields = { -- Expect error "Type mismatch. Required: 'ClassWithFields' Found: 'table'"
    a = "someString",
    b = 1
}

---@class Callable
---@overload fun(a: number, b: number): ClassWithFields
local Callable = {}

---@type Callable
local callable

classWithFields = callable(1, 2)
emptyClass = callable(1, 2) -- Expect error
