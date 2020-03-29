---@shape OurGenericShape<N>
---@field parameterOrNumber N | number
---@field aKnownStringLiteral 'a' | 'b' | 'c'

---@alias AliasAsParam 'one' | 'two' | 'three'

---@alias GenericAlias<N> string | OurGenericShape<N>

---@type GenericAlias<AliasAsParam>
local genericAlias = {
    parameterOrNumber = 'one',
    aKnownStringLiteral = 'a'
}

genericAlias = {
    parameterOrNumber = 'two',
    aKnownStringLiteral = 'b'
}

genericAlias = {
    parameterOrNumber = 1,
    aKnownStringLiteral = 'c'
}

genericAlias = {
    parameterOrNumber = 'invalid', -- Expect error
    aKnownStringLiteral = 'a'
}

genericAlias = {
    parameterOrNumber = 'three',
    aKnownStringLiteral = 'invalid', -- Expect error
}

genericAlias = { -- Expect error
    parameterOrNumber = 'owner'
}

genericAlias = 'a string'
genericAlias = 1 -- Expect error
genericAlias = {} -- Expect error

---@type GenericAlias<"different">
local aDifferentGenericAlias = genericAlias -- Expect error
