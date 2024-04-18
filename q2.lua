-- Q2 - Fix or improve the implementation of the below method

function PrintSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local result = db.storeQuery(
    -- Escape the argument
        string.format("SELECT name FROM guilds WHERE max_members < '%d';", memberCount)
    )

    -- Loop through rows
    for k, row in pairs(result) do
        print(row.getString("name"))
    end
end
