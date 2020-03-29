---@type number
local aNumber

---@type string
local aString

---@class SelfA
---@field a string
local SelfA = {}

---@return self
function SelfA:colonMethod()
    ---@type self
    local selfTypedVar = self

    ---@type SelfA
    local someSelfA

    someSelfA = self
    self = someSelfA -- Expect error
    selfTypedVar = someSelfA -- Expect error
    aNumber = self -- Expect error

    aNumber = self.a -- Expect error
    aString = self.a

    return self
end

---@type number
self = 1

---@return self
function SelfA.dotMethod()
    ---@type self
    local selfTypedVar = self -- Expect error

    ---@type SelfA
    local someSelfA

    someSelfA = self
    self = someSelfA -- Expect error
    selfTypedVar = someSelfA -- Expect error
    aNumber = self -- Expect error

    aNumber = self.a -- Expect error
    aString = self.a

    return self
end

---@return self
SelfA.lambdaMethod = function()
    ---@type self
    local selfTypedVar = self

    ---@type SelfA
    local someSelfA

    someSelfA = self
    self = someSelfA -- Expect error
    selfTypedVar = someSelfA -- Expect error
    aNumber = self -- Expect error

    aNumber = self.a -- Expect error
    aString = self.a

    end

    return self
end

---@type SelfA
local selfA

---@class SelfB : SelfA
---@field bb string
local SelfB = {}

---@type SelfB
local selfB

selfB = SelfB:colonMethod()
selfB = SelfB:dotMethod()
selfB = SelfB:lambdaMethod()

selfA = SelfB:colonMethod()
selfA = SelfB:dotMethod()
selfA = SelfB:lambdaMethod()

selfB = SelfA:colonMethod() -- Expect error
selfB = SelfA:dotMethod() -- Expect error
selfB = SelfA:lambdaMethod() -- Expect error

selfB = selfB:colonMethod()
selfB = selfB:dotMethod()
selfB = selfB:lambdaMethod()

selfA = selfB:colonMethod()
selfA = selfB:dotMethod()
selfA = selfB:lambdaMethod()

selfB = selfA:colonMethod() -- Expect error
selfB = selfA:dotMethod() -- Expect error
selfB = selfA:lambdaMethod() -- Expect error



