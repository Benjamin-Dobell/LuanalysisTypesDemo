---@class Unconstrained<T>
---@field someValue T
local Unconstrained = {}

---@class NumberConstrained<T : number>
local NumberConstrained = {}

---@class ChildNumberConstrained<T : number> : NumberConstrained<T>
local ChildNumberConstrained = {}

---@class InvalidNumberConstrained1 : NumberConstrained<string> @Expect error
local InvalidNumberConstrained1 = {}

---@class InvalidNumberConstrained2<T> : NumberConstrained<T> @Expect error
local InvalidNumberConstrained2 = {}

---@type Unconstrained<string>
local a

---@type Unconstrained<number>
local b

---@type NumberConstrained<number>
local c

---@type NumberConstrained<string> @Expect error
local d

---@type ChildNumberConstrained<number>
local e

---@type ChildNumberConstrained<string> @Expect error
local f
