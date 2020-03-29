---@shape Shape1
---@field a number

---@type Shape1
local shape1

---@class NotShape1
---@field a number
local NotShape1

---@type NotShape1
local notShape1

shape1 = {a = 1}
notShape1 = {a = 1} -- Expect error

shape1 = notShape1
notShape1 = shape1 -- Expect error

shape1 = {a = "not a number"} -- Expect error
shape1 = {a = 1, extraMember = "whatever"}

---@shape Shape2 : Shape1
---@field b string

---@type Shape2
local shape2

shape2 = shape1 -- Expect error
shape1 = shape2

shape2 = {a = 2} -- Expect error
shape2 = {a = 2, b = "some string"}
shape2 = {a = 2, b = 2} -- Expect error

---@shape GenericShape<T>
---@field a T

---@type number
local aNumber

---@type string
local aString

---@type GenericShape<number>
local genericNumberShape

genericNumberShape = {a = aNumber}
genericNumberShape = {a = aString} -- Expect error

---@type GenericShape<string>
local genericStringShape

genericStringShape = {a = aNumber} -- Expect error
genericStringShape = {a = aString}

---@shape DerivedGenericShape<T> : GenericShape<T>
---@field b T

---@type DerivedGenericShape<number>
local derivedGenericShape = {a = 1, b = 2}

local notALiteral = {a = aString}

derivedGenericShape = {a = aNumber} -- Expect error
derivedGenericShape = {a = 1, b = aString} -- Expect error
derivedGenericShape = notALiteral -- Expect error

---@param shape DerivedGenericShape<string>
local function takesAShape(shape)
end

takesAShape({a = aString, b = aString})
takesAShape({a = aNumber, b = aNumber}) -- Expect error

---@shape NestedShape
---@field shape1 Shape1
---@field shape2 Shape2

---@type NestedShape
local nestedShape = {
    shape1 = {a = aNumber},
    shape2 = {a = aNumber, b = aString}
}

nestedShape = {
    shape1 = {a = 1},
    shape2 = (shape2)
}

nestedShape = {
    shape1 = {a = aString}, -- Expect error
    shape2 = {a = aNumber} -- Expect error
}

local notShape2 = {a = 1, b = 10}

---@type NestedShape
local nestedShape3 = {
    shape1 = {a = aString, b = aString},
    shape2 = {a = 1, b = 1}
}

---@return NestedShape
local function returnNestedSahpe()
    return {
        shape1 = {a = {}}, -- Expect error
        shape2 = {a = aNumber, b = aNumber} -- Expect error
    }
end

---@shape ShapeWithOptionalField
---@field requiredField number
---@field optional number|nil

---@type ShapeWithOptionalField
local shapeWithOptionalField = {
    requiredField = 1
}

shapeWithOptionalField = {
    requiredField = 1,
    optional = aString -- Expect error
}
