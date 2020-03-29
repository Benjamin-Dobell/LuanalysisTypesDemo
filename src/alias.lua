---@class ClassToBeAliased
---@field a string

---@alias MyAlias ClassToBeAliased

---@type MyAlias
local myAlias

---@type ClassToBeAliased
local classToBeAliased

classToBeAliased = myAlias
classToBeAliased = 1 -- Expect error

myAlias = classToBeAliased
myAlias = 1 -- Expect error
