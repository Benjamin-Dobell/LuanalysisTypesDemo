---@type number
local aNumber

---@type boolean
local aBoolean

---@class Vector
---@field x number
---@field y number
---@field z number
---@field [1] number
---@field [2] number
---@field [3] number
---@field [number] boolean

---@type Vector
local vector

aNumber = vector.x
aNumber = vector.y
aNumber = vector.z

aBoolean = vector.x -- Expect error
aBoolean = vector.y -- Expect error
aBoolean = vector.z -- Expect error

aNumber = vector['x']
aNumber = vector['y']
aNumber = vector['z']

aBoolean = vector['x'] -- Expect error
aBoolean = vector['y'] -- Expect error
aBoolean = vector['z'] -- Expect error

aNumber = vector[1]
aNumber = vector[2]
aNumber = vector[3]
aNumber = vector[4] -- Expect error

aBoolean = vector[1] -- Expect error
aBoolean = vector[2] -- Expect error
aBoolean = vector[3] -- Expect error
aBoolean = vector[4]

aBoolean = vector[true] -- Expect error

---@type {[number]: boolean}
local tableField

aBoolean = tableField[1]
aNumber = tableField[1] -- Expect error

local anonymousClassTable = {}
anonymousClassTable[1] = 1

aBoolean = anonymousClassTable[1] -- Expect error
aNumber = anonymousClassTable[1]

local literalTable = {[1] = true, [2] = 1}

aBoolean = literalTable[1]
aNumber = literalTable[1] -- Expect error

aBoolean = literalTable[2] -- Expect error
aNumber = literalTable[2]
