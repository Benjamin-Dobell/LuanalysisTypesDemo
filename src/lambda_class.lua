---@class LambdaClass
---@overload fun(a: number): self
local LambdaClass = {}

setmetatable(LambdaClass,  {
    ---@param a number
    __call = function(_, a)
        local self = --[[---@type LambdaClass]] {}

        ---@return number
        function self.getNumber()
            return a
        end

        return self
    end
})

local missingArg = LambdaClass() -- Expect error
local wrongArg = LambdaClass("one") -- Expect error
local lambdaClass = LambdaClass(1)

---@type number
local aNumber = lambdaClass.getNumber()

---@type string
local aString = lambdaClass.getNumber() -- Expect error
