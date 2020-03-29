---@class SomeClass

---@alias DirectAlias SomeClass

---@alias IndirectAlias DirectAlias

---@alias ReallyIndirectAlias IndirectAlias

---@type SomeClass
local someClass

---@type ReallyIndirectAlias
local reallyIndirectAlias = someClass

reallyIndirectAlias = 'invalid' -- Expect error
reallyIndirectAlias = someClass
someClass = reallyIndirectAlias


---@class SomeGenericClass<T>

---@alias DirectGenericAlias<T> SomeGenericClass<T>

---@alias IndirectGenericAlias<T> DirectGenericAlias<T>

---@alias ReallyIndirectGenericAlias<T> IndirectGenericAlias<T>

---@type SomeGenericClass<string>
local someGenericClass

---@type ReallyIndirectGenericAlias<string>
local reallyIndirectGenericAlias

reallyIndirectGenericAlias = 'invalid' -- Expect error
reallyIndirectGenericAlias = someGenericClass
someGenericClass = reallyIndirectGenericAlias



---@alias InfiniteAlias1 string|InfiniteAlias2
---@alias InfiniteAlias2 number|InfiniteAlias1

---@type InfiniteAlias1
local infiniteAlias1

---@type InfiniteAlias2
local infiniteAlias2

infiniteAlias1 = {} -- Expect error
infiniteAlias1 = 1
infiniteAlias1 = 'string'
infiniteAlias1 = infiniteAlias2
infiniteAlias2 = {} -- Expect error
infiniteAlias2 = 1
infiniteAlias2 = 'string'
infiniteAlias2 = infiniteAlias1


---@alias InfiniteGenericAlias1<T> T|InfiniteGenericAlias2<T>
---@alias InfiniteGenericAlias2<T> InfiniteGenericAlias1<T>

---@type InfiniteGenericAlias1<string>
local infiniteGenericAlias1

---@type InfiniteGenericAlias2<string>
local infiniteGenericAlias2

infiniteGenericAlias1 = 1 -- Expect error
infiniteGenericAlias1 = 'string'
infiniteGenericAlias1 = infiniteGenericAlias2

infiniteGenericAlias2 = 1 -- Expect error
infiniteGenericAlias2 = 'string'
infiniteGenericAlias2 = infiniteGenericAlias1
