LaLife.Player.IdentifierSourceMapping = {};
LaLife.Player.SourceIdentifierMapping = {};
LaLife.Player.UserRegistry = {}

---
--- Set the correct mapping for identifier <-> source
---
AddEventHandler("LaLife:Player:SetSource", function(identifier, source, callback)
    LaLife.Player.IdentifierSourceMapping[identifier] = source
    LaLife.Player.SourceIdentifierMapping[source] = identifier
    LaLife.Player.UserRegistry[identifier] = nil

    callback()
end)

AddEventHandler('playerDropped', function()
    if LaLife.Player.SourceIdentifierMapping[source] then
        local identifier = LaLife.Player.SourceIdentifierMapping[source]

        LaLife.Player.SourceIdentifierMapping[source] = nil
        LaLife.Player.IdentifierSourceMapping[identifier] = nil
        LaLife.Player.UserRegistry[identifier] = nil
    end
end)

---
--- Get player by source
---
AddEventHandler("LaLife:Player:GetBySource", function(source, callback)
    local identifier = LaLife.Player.SourceIdentifierMapping[source]

    if identifier == nil then
        callback(nil)

        return
    end

    if not (LaLife.Player.UserRegistry[identifier] == nil) then
        callback(LaLife.Player.UserRegistry[identifier])

        return
    end

    LaLife.Player.Manager.GetPlayer(identifier, source, function (user)
        LaLife.Player.UserRegistry[identifier] = user

        callback(user)
    end);
end)

---
--- Get player by identifier
---
AddEventHandler("LaLife:Player:GetByIdentifier", function(identifier, callback)
    if not (LaLife.Player.UserRegistry[identifier] == nil) then
        callback(LaLife.Player.UserRegistry[identifier])

        return
    end

    LaLife.Player.Manager.GetPlayer(identifier, LaLife.Player.IdentifierSourceMapping[identifier], function (user)
        LaLife.Player.UserRegistry[identifier] = user

        callback(user)
    end);
end)

---
--- Get the source for a given identifier
---
AddEventHandler("LaLife:Player:GetSource", function(identifier, callback)
    callback(LaLife.Player.IdentifierSourceMapping[identifier])
end)

---
--- Get the identifier for a given source
---
AddEventHandler("LaLife:Player:GetIdentifier", function(source, callback)
    callback(LaLife.Player.SourceIdentifierMapping[source])
end)

---
--- Get all connected players
---
AddEventHandler("LaLife.Player.Manager.GetConnectedPlayers", function (callback)
    callback(LaLife.Player.UserRegistry)
end)

---
--- Save player
---
AddEventHandler("LaLife:Player:Save", function(partialUser, callback)
    -- Merging info
    for key, value in pairs(partialUser) do
        LaLife.Player.UserRegistry[partialUser.identifier][key] = value
    end

    if callback then
       callback()
    end
end)

--- Essential Mode Retro Compatibility
RegisterServerEvent('es:firstJoinProper')
AddEventHandler('es:firstJoinProper', function()

end)

--- Clean values when no players
Citizen.CreateThread(function()
    while true do
        Wait(10000)

        for identifier, user in pairs(LaLife.Player.UserRegistry) do
            local found = false

            for _, source in pairs(GetPlayers()) do
                if tonumber(user.source) == tonumber(source) then
                    found = true
                end
            end

            if not found then
                print('Player ' .. user.identifier .. ' timed out')
                LaLife.Player.SourceIdentifierMapping[user.source] = nil
                LaLife.Player.IdentifierSourceMapping[identifier] = nil
                LaLife.Player.UserRegistry[identifier] = nil
            end
        end
    end
end)

