-- Q1 - Fix or improve the implementation of the below methods

local function releaseStorage(player, amount)
    player:setStorageValue(amount, -1)
end

local function addEvent(method, number, player)
    method(number, player)
end

function OnLogout(player)
    -- Because we use "1000" mulitple times, it should be placed into it's own variable
    local amount = 1000
    if player:getStorageValue(amount) == 1 then
        -- Because we are already passing the amount into the addEvent,
        -- addEvent should subsequentially pass it into releaseStorage
        addEvent(releaseStorage, amount, player)
    end
    return true
end
