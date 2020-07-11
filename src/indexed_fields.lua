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

---@alias OneOrTwo 1|2
---@alias OneOrFour 1|4

---@type OneOrTwo
local oneOrTwo

---@type OneOrFour
local oneOrFour

aNumber = vector[oneOrTwo]
aNumber = vector[oneOrFour] -- Expect error


---@alias AOrB 'a' | 'b'

---@type AOrB
local aOrB

---@shape UnionIndexer
---@field [AOrB] boolean
---@field [OneOrTwo] boolean
---@field [3|4] boolean

---@type UnionIndexer
local unionIndexer

aBoolean = unionIndexer.a
aBoolean = unionIndexer['a']
aBoolean = unionIndexer[aOrB]
aNumber = unionIndexer.a -- Expect error
aNumber = unionIndexer['a'] -- Expect error

aBoolean = unionIndexer[1]
aBoolean = unionIndexer[oneOrTwo]
aNumber = unionIndexer[1] -- Expect error
aNumber = unionIndexer[oneOrTwo] -- Expect error

---@alias ThreeOrFour 3|4

---@type 3|4
local threeOrFour

---@type ThreeOrFour
local aliasThreeOrFour

aBoolean = unionIndexer[3]
aBoolean = unionIndexer[threeOrFour]
aBoolean = unionIndexer[aliasThreeOrFour]
aNumber = unionIndexer[3] -- Expect error
aNumber = unionIndexer[threeOrFour] -- Expect error
aNumber = unionIndexer[aliasThreeOrFour] -- Expect error
