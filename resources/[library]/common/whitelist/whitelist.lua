AddEventHandler("queue:playerJoinQueue", function(source, setKickReason)
    local steamIdentifier = GetPlayerIdentifiers(source)[1]
    local results = MySQL.Sync.fetchAll('SELECT * FROM whitelist WHERE steam_id = @identifier', {
        identifier = steamIdentifier,
    });

    if #results ~= 1 then
        setKickReason("Vous n'etes pas sur la whitelist")
        CancelEvent()

        return
    end

    local connected = results[1]

    if connected.banned ~= 0 then
        setKickReason("Vous etes bannis : " .. connected.banned_reason)
        CancelEvent()

        return
    end
end)

local function setPriorities()
    MySQL.Async.fetchAll('SELECT * FROM whitelist WHERE banned = 0', {}, function (whitelisted)
        for key, user in ipairs(whitelisted) do
            AddPriority(user.steam_id, user.priority)
        end
    end)

    SetTimeout(60000, setPriorities)
end

AddEventHandler('onMySQLReady', function ()
    setPriorities()
end)
