---@param num number
local function wantsNumber(num) end

---@type number
local aNumber

---@type string
local aString

---@type any
local unknown

wantsNumber(aNumber)
wantsNumber(aString) -- Expect error
wantsNumber(unknown)

aNumber = aNumber
aNumber = aString -- Expect error
aNumber = unknown

aString = aString
aString = aNumber -- Expect error
aString = unknown

unknown = unknown
unknown = aNumber
unknown = aString
