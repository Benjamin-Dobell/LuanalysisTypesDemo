---@param param string
local closureParams = function(param)
    ---@type string
    local a
    a = param
end

---@return string
local closureReturn = function()
    return "moo"
end

---@param param string
local badClosureParams = function(param)
    ---@type number
    local a
    a = param -- Expect error
end

---@return string
local badClosureReturn = function()
    return 1 -- Expect error
end
