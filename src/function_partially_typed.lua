local EventManager = {}

---@param eventName string
---@param handler fun: boolean
function EventManager.addBooleanHandler(eventName, handler)
end

EventManager.addBooleanHandler("noArgEvent", function()
    return true
end)

EventManager.addBooleanHandler("oneArgEvent", function(arg1)
    return true
end)

EventManager.addBooleanHandler("twoArgEvent", function(arg1, arg2)
    return true
end)

EventManager.addBooleanHandler("someEvent", function() -- Expect error
    return 1
end)

---@param eventName string
---@param handler fun
function EventManager.addHandler(eventName, handler)
end

EventManager.addHandler("noArgEvent", function()
    return true
end)

EventManager.addHandler("oneArgEvent", function(arg1)
    return true
end)

EventManager.addHandler("twoArgEvent", function(arg1, arg2)
    return true
end)

EventManager.addHandler("someEvent", function()
    return 1
end)

---@param eventName string
---@param handler fun(arg1: number)
function EventManager.addNumberArgHandler(eventName, handler)
end

EventManager.addNumberArgHandler("noArgEvent", function()
    return true
end)

EventManager.addNumberArgHandler("oneArgEvent", function(arg1)
    return true
end)

EventManager.addNumberArgHandler("twoArgEvent", function(arg1, arg2) -- Expect error
    return true
end)

EventManager.addNumberArgHandler("someEvent", function()
    return 1
end)

---@type fun(arg1: boolean)
local invalidHandler

EventManager.addNumberArgHandler("oneArgEvent", invalidHandler) -- Expect error
