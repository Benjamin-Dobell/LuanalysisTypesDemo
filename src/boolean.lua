---@type boolean
local unknownBoolean

---@type true|false
local unknownLiteralBoolean

---@type true
local trueLiteral

---@type false
local falseLiteral

unknownBoolean = unknownLiteralBoolean
unknownLiteralBoolean = unknownBoolean

unknownBoolean = true
unknownBoolean = false
unknownBoolean = trueLiteral
unknownBoolean = falseLiteral

unknownLiteralBoolean = true
unknownLiteralBoolean = false
unknownLiteralBoolean = trueLiteral
unknownLiteralBoolean = falseLiteral

trueLiteral = true
trueLiteral = false -- Expect error
trueLiteral = trueLiteral
trueLiteral = falseLiteral -- Expect error
trueLiteral = unknownBoolean -- Expect error
trueLiteral = unknownLiteralBoolean -- Expect error

falseLiteral = true -- Expect error
falseLiteral = false
falseLiteral = falseLiteral
falseLiteral = trueLiteral -- Expect error
falseLiteral = unknownBoolean -- Expect error
falseLiteral = unknownLiteralBoolean -- Expect error
