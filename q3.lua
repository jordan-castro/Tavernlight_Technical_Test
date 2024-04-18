-- Q3 - Fix or improve the name and the implementation of the below method

function RemovePartyMember(playerId, membername)
    -- Get party refrence
    local player = Player(playerId)
    local party = player:getParty()

    for k, v in pairs(party:getMembers()) do
        -- Refrence the member
        local member = Player(membername)
        -- If member is found, remove from party.
        if v == member then
            party:removeMember(member)
            break
        end
    end
end
