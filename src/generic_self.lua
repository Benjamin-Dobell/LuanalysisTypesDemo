---@type number
local aNumber

---@type string
local aString

---@class GenericSelfA<T : string>
---@field a T
local GenericSelfA = {}

---@return self
function GenericSelfA:colonMethod()
    ---@type self
    local selfTypedVar = self

    ---@type GenericSelfA<string>
    local someGenericSelfA

    someGenericSelfA = selfTypedVar -- Expect error
    self = someGenericSelfA -- Expect error
    selfTypedVar = someGenericSelfA -- Expect error
    aNumber = selfTypedVar -- Expect error

    
    aNumber = selfTypedVar.a -- Expect error
    aString = selfTypedVar.a

    return self
end

---@return self
function GenericSelfA.dotMethod()
    ---@type self
    local selfTypedVar = self -- Expect error - self is not defined, not a colon method

    ---@type GenericSelfA<string>
    local someGenericSelfA

    someGenericSelfA = selfTypedVar -- Expect error
    self = someGenericSelfA
    selfTypedVar = someGenericSelfA -- Expect error
    aNumber = selfTypedVar -- Expect error

    aNumber = selfTypedVar.a -- Expect error
    aString = selfTypedVar.a

    return selfTypedVar
end

---@return self
GenericSelfA.lambdaMethod = function()
    ---@type self
    local selfTypedVar = self -- Expect error - self is not defined, not a colon method

    ---@type GenericSelfA<string>
    local someGenericSelfA

    someGenericSelfA = selfTypedVar -- Expect error
    self = someGenericSelfA
    selfTypedVar = someGenericSelfA -- Expect error
    aNumber = selfTypedVar -- Expect error

    aNumber = selfTypedVar.a -- Expect error
    aString = selfTypedVar.a

    return selfTypedVar
end

---@type GenericSelfA<string>
local selfAString

---@class GenericSelfB<T : string> : GenericSelfA<T>
---@field b T
local GenericSelfB = {}

---@type GenericSelfB<string>
local selfBString

---@type GenericSelfB<"string literal">
local selfBStringLiteral

selfBString = GenericSelfB:colonMethod() -- Expect error
selfBString = GenericSelfB.dotMethod() -- Expect error
selfBString = GenericSelfB.lambdaMethod() -- Expect error

selfAString = GenericSelfA:colonMethod() -- Expect error
selfAString = GenericSelfA.dotMethod() -- Expect error
selfAString = GenericSelfA.lambdaMethod() -- Expect error

selfBString = selfBString:colonMethod()
selfBString = selfBString.dotMethod()
selfBString = selfBString.lambdaMethod()

selfAString = selfBString:colonMethod()
selfAString = selfBString.dotMethod()
selfAString = selfBString.lambdaMethod()

selfBString = selfAString:colonMethod() -- Expect error
selfBString = selfAString.dotMethod() -- Expect error
selfBString = selfAString.lambdaMethod() -- Expect error

selfBStringLiteral = selfBStringLiteral:colonMethod()
selfBStringLiteral = selfBStringLiteral.dotMethod()
selfBStringLiteral = selfBStringLiteral.lambdaMethod()

selfAString = selfBStringLiteral:colonMethod() -- Expect error
selfAString = selfBStringLiteral.dotMethod() -- Expect error
selfAString = selfBStringLiteral.lambdaMethod() -- Expect error

selfBString = selfBStringLiteral:colonMethod() -- Expect error
selfBString = selfBStringLiteral.dotMethod() -- Expect error
selfBString = selfBStringLiteral.lambdaMethod() -- Expect error
