---@class ReturnA
local ReturnA = {}

---@class ReturnB : ReturnA
local ReturnB = {}

---@class ReturnC : ReturnB
local ReturnC = {}

---@type fun(a: "stringLiteral"): ReturnB
local callback

---@type fun(a: string): ReturnC @Covariant return, contravariant parameters.
local subtype

callback = subtype

---@type fun(a: string): ReturnA
local notSubtype

callback = notSubtype -- Expect error (Return type not covariant)

---@type fun(a: string): ReturnB
local callback2

---@type fun(a: "stringLiteral"): ReturnB
local notSubtype2

callback2 = notSubtype2 -- Expect error (Parameter type not contravariant)

