---@type number
local aNumber

---@type boolean
local aBoolean

---@type fun(): number, boolean...
local varreturnFunction

aNumber, aBoolean, aBoolean = varreturnFunction()
aNumber, aBoolean, aBoolean, aNumber, aBoolean = varreturnFunction() -- Expect error




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
        return -- Expect
    end
end

aNumber, aBoolean, aBoolean = varreturnFunction2()
aNumber, aBoolean, aBoolean, aNumber, aBoolean = varreturnFunction2() -- Expect error

---@type fun(): boolean...
local varreturnFunction3

aBoolean, aBoolean = varreturnFunction3()
aBoolean, aBoolean, aNumber, aBoolean = varreturnFunction3() -- Expect error

---@return boolean...
local function varreturnFunction6()
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

aBoolean, aBoolean = varreturnFunction6()
aBoolean, aBoolean, aNumber, aBoolean = varreturnFunction6() -- Expect error

---@generic T
---@param list T[]
---@return T...
local function genericVarreturn(list)
    return table.unpack(list)
end

aNumber, aNumber = genericVarreturn({1, 2})
aNumber, aBoolean = genericVarreturn({1, 2}) -- Expect error

local implicitNumber1, implicitNumber2 = genericVarreturn({1, 2})

aNumber = implicitNumber1
aBoolean = implicitNumber1 -- Expect error
aNumber = implicitNumber2
aBoolean = implicitNumber2 -- Expect error
