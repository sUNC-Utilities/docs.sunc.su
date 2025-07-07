--[[
This is obviously a very rough and quick implementation, and does not handle any clashes at all

Richy-Z@GitHub, https://richy.lol
]]

return function(arr)
    local constructed = {}

    for i = 1, #arr do
        constructed[arr[i]] = true
    end

    local contains = function(_, k)
        return constructed[k] == true
    end

    return setmetatable(constructed, {
        __newindex = function()
            error("Addition of new items is not permitted")
        end,

        __index = function(_, key)
            if key == "contains" then
                return contains
            end
        end
    })
end
