---@type number
local aNumber

---@type boolean
local aBoolean

---@type nil | number
local nilOrNumber

---@type nil | boolean
local nilOrBoolean

---@type fun(): number, boolean...
local varreturnFunction

aNumber, nilOrBoolean, nilOrBoolean = varreturnFunction()
aNumber, nilOrBoolean, nilOrBoolean, nilOrNumber, nilOrBoolean = varreturnFunction() -- Expect error


---@param numberParam number
---@return number, boolean...
local function varreturnFunction2()
    if aNumber == 1 then
        return 1
    elseif aNumber == 2 then
        return 1, "not a boolean" -- Expect error
    elseif aNumber == 3 then
        return 1, true
    elseif aNumber == 4 then
        return 1, true, false
    else
        return -- Expect error
    end
end

aNumber, nilOrBoolean, nilOrBoolean = varreturnFunction2()
aNumber, nilOrBoolean, nilOrBoolean, nilOrNumber, nilOrBoolean = varreturnFunction2() -- Expect error

---@param a number
---@param b string
local function acceptsNumberString(a, b) end

acceptsNumberString(varreturnFunction2()) -- Expect error

---@param a number
---@vararg string
local function acceptsNumberVariadicString(a, ...) end

acceptsNumberVariadicString(varreturnFunction2()) -- Expect error

---@type fun(): boolean...
local varreturnFunction3

nilOrBoolean, nilOrBoolean = varreturnFunction3()
nilOrBoolean, nilOrBoolean, nilOrNumber, nilOrBoolean = varreturnFunction3() -- Expect error

---@return boolean...
local function varreturnFunction4()
    if aNumber == 1 then
        return
    elseif aNumber == 2 then
        return "not a boolean" -- Expect error
    elseif aNumber == 3 then
        return true
    elseif aNumber == 4 then
        return true, false
    end
end

nilOrBoolean, nilOrBoolean = varreturnFunction4()
nilOrBoolean, nilOrBoolean, nilOrNumber, nilOrBoolean = varreturnFunction4() -- Expect error

---@generic T
---@param list T[]
---@return T...
local function genericVarreturn(list)
    return table.unpack(list)
end

nilOrNumber, nilOrNumber = genericVarreturn({1, 2})
nilOrNumber, nilOrBoolean = genericVarreturn({1, 2}) -- Expect error

local implicitNilOrNumber1, implicitNilOrNumber2 = genericVarreturn({ 1, 2})

nilOrNumber = implicitNilOrNumber1
nilOrBoolean = implicitNilOrNumber1 -- Expect error
nilOrNumber = implicitNilOrNumber2
nilOrBoolean = implicitNilOrNumber2 -- Expect error
