--[[
################################################################
- Creator: Jyben
- Date: 02/05/2017
- Url: https://github.com/Jyben/emergency
- Licence: Apache 2.0
################################################################
--]]
RegisterServerEvent('es_em:sendEmergency')
AddEventHandler('es_em:sendEmergency', function(reason, playerIDInComa, x, y, z)
    local playerSource = source

    TriggerEvent("LaLife.Player.Manager.GetConnectedPlayers", function(players)
        for i,v in pairs(players) do
            TriggerClientEvent('es_em:sendEmergencyToDocs', v.source, reason, playerIDInComa, x, y, z, playerSource)
        end
    end)
end)

RegisterServerEvent('es_em:getTheCall')
AddEventHandler('es_em:getTheCall', function(playerName, playerID, x, y, z, sourcePlayerInComa)
    local playerSource = source
    local fullname = playerName

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            fullname = user.prenom .. " " .. user.nom
        else
            TriggerEvent("es:desyncMsg", 'es_em:getTheCall')
        end
    end)

    TriggerEvent("LaLife.Player.Manager.GetConnectedPlayers", function(players)
        for i,v in pairs(players) do
            TriggerClientEvent('es_em:callTaken', v.source, fullname, playerID, x, y, z, sourcePlayerInComa)
        end
    end)
end
)

RegisterServerEvent('es_em:sv_resurectPlayer')
AddEventHandler('es_em:sv_resurectPlayer', function(sourcePlayerInComa)
    TriggerClientEvent('es_em:cl_resurectPlayer', sourcePlayerInComa)
end)

RegisterServerEvent('es_em:sv_getJobId')
AddEventHandler('es_em:sv_getJobId', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local jobid = user.job
            TriggerClientEvent('es_em:cl_setJobId', playerSource, jobid)
        else
            TriggerEvent("es:desyncMsg", 'es_em:sv_getJobId')
        end
    end)
end)

RegisterServerEvent('es_em:sv_getDocConnected')
AddEventHandler('es_em:sv_getDocConnected', function()
    local playerSource = source

    TriggerEvent("LaLife.Player.Manager.GetConnectedPlayers", function(players)
        local isConnected = false

        for i,v in pairs(players) do
            if (v.identifier ~= nil) then
                local connectedCount = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM users LEFT JOIN jobs ON jobs.job_id = users.job WHERE users.identifier = @identifier AND job_id = 13", {['@identifier'] = v.identifier})
                isConnected = connectedCount ~= 0
            end
        end

        TriggerClientEvent('es_em:cl_getDocConnected', playerSource, isConnected)
    end)
end)

RegisterServerEvent('es_em:sv_setService')
AddEventHandler('es_em:sv_setService', function(service)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                enService = 2,
            })
        else
            TriggerEvent("es:desyncMsg", 'es_em:sv_setService')
        end
    end)
end)

-- Par DayField :)!
RegisterServerEvent("delete:weapon")
AddEventHandler('delete:weapon', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            MySQL.Async.execute("DELETE from user_weapons WHERE identifier = @username", {['@username'] = player})
        else
            TriggerEvent("es:desyncMsg", 'delete:weapon')
        end
    end)
end)

RegisterServerEvent('es_em:sv_removeMoney')
AddEventHandler('es_em:sv_removeMoney', function()
    local playerSource = source

    TriggerEvent("es:getPlayerFromId", playerSource, function(user)
        if (user) then
            if user.money > 0 then
                LaLife.Player.Manager.SetPlayerMoney(user, 0)
            end
            if user.dirtymoney > 0 then
                LaLife.Player.Manager.SetPlayerDirtyMoney(user, 0)
            end
        end
    end)
end)

RegisterServerEvent('es_em:sv_sendMessageToPlayerInComa')
AddEventHandler('es_em:sv_sendMessageToPlayerInComa', function(sourcePlayerInComa)
    TriggerClientEvent('es_em:cl_sendMessageToPlayerInComa', sourcePlayerInComa)
end)

RegisterServerEvent('es_em:getAmbulanceHelicoGarage')
AddEventHandler('es_em:getAmbulanceHelicoGarage', function(vehicule)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("MEDI" .. string.sub(user.identifier, -4))
            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plateveh,
            }, function ()
                TriggerClientEvent("es_em:SpawnHelicoAmbulance", playerSource, vehicule, plateveh, false)
            end)
        else
            TriggerEvent("es:desyncMsg", 'es_em:getAmbulanceHelicoGarage')
        end
    end)
end)

RegisterServerEvent('es_em:getAmbulanceGarage')
AddEventHandler('es_em:getAmbulanceGarage', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("MEDI" .. string.sub(user.identifier, -4))

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plateveh,
            }, function ()
                TriggerClientEvent("es_em:SpawnAmbulance", playerSource, plateveh)
            end)
        else
            TriggerEvent("es:desyncMsg", 'es_em:getAmbulanceGarage')
        end
    end)
end)

AddEventHandler('playerDropped', function()

end)

TriggerEvent('es:addCommand', 'respawn', function(source, args, user)
    TriggerClientEvent('es_em:cl_respawn', source)
end)
