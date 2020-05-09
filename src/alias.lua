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

---@alias UnionAlias string|ClassToBeAliased

---@type string
local aString

---@type UnionAlias
local unionAlias

unionAlias = aString
aString = unionAlias -- Expect error

unionAlias = classToBeAliased
classToBeAliased = unionAlias -- Expect error

unionAlias = myAlias
myAlias = unionAlias -- Expect error

---@alias AliasedFunction fun(a: string): void

---@type AliasedFunction
local aliasedFunction

aliasedFunction(1) -- Expect error
aliasedFunction("okay")
