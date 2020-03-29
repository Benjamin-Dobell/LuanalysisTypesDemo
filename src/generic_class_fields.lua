---@class GenericFieldsA<A>
---@field a A
local GenericFieldsA

---@class GenericFieldsB<B> : GenericFieldsA<B>
---@field b B
local GenericFieldsB

---@class GenericFieldsC<C> : GenericFieldsB<C>
---@field c C
local GenericFieldsC

---@type GenericFieldsA<string>
local genericA

---@type GenericFieldsB<string>
local genericB

---@type GenericFieldsC<string>
local genericC

---@type string
local aString

---@type number
local aNumber

aString = genericA.a
aNumber = genericA.a -- Expect error

aString = genericB.a
aNumber = genericB.a -- Expect error
aString = genericB.b
aNumber = genericB.b -- Expect error

aString = genericC.a
aNumber = genericC.a -- Expect error
aString = genericC.b
aNumber = genericC.b -- Expect error
aString = genericC.c
aNumber = genericC.c -- Expect error

aString = genericA.a
aString = genericA.b -- Expect error
aString = genericA.c -- Expect error
