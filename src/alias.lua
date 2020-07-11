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

---@type fun(a: MyAlias, b: MyAlias): void
local myAliasFun

myAliasFun(classToBeAliased, 1) -- Expect error
myAliasFun(classToBeAliased, classToBeAliased)


---@alias IdentifierString 0
---@alias IdentifierNumber 1

---@type IdentifierString
local STRING = 0

---@type IdentifierNumber
local NUMBER = 1

---@alias Identifier IdentifierString | IdentifierNumber

---@alias StringTuple {[1]: IdentifierString, [2]: string}
---@alias NumberTuple {[1]: IdentifierNumber, [2]: number}

---@alias IdentifiedTuple StringTuple | NumberTuple

---@type IdentifiedTuple
local identifiedTuple

identifiedTuple = {STRING, "a string"}
identifiedTuple = {NUMBER, "a string"} -- Expect error

identifiedTuple = {STRING, 1} -- Expect error
identifiedTuple = {NUMBER, 1}

---@type Identifier
local identifier = identifiedTuple[1]

STRING = identifiedTuple[1] -- Expect error
NUMBER = identifiedTuple[1] -- Expect error

identifiedTuple[1] = STRING -- Expect error
identifiedTuple[1] = NUMBER -- Expect error

---@generic K, V
---@param tab table<K, V>
local function acceptArrayAsGenericTable(tab)
end

---@alias SomeAliasedType number
---@alias SomeAliasedArrayOfAliasedType SomeAliasedType[]

---@type SomeAliasedArrayOfAliasedType
local arrayOfAlias

acceptArrayAsGenericTable(arrayOfAlias)
acceptArrayAsGenericTable({1, 2, 3})
acceptArrayAsGenericTable(1) -- Expect error
