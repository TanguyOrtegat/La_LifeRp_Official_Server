RegisterServerEvent("player:serviceOn")
RegisterServerEvent("player:serviceOff")
RegisterServerEvent("call:makeCall")
RegisterServerEvent("call:getCall")

local inService = {
    ["police"] = {},
    ["medic"] = {},
    ["taxi"] = {},
	  ["tow"] = {},
    ["garda"] = {},
}
local callActive = {
    ["police"] = {taken = false},
    ["medic"] = {taken = false},
    ["taxi"] = {taken = false},
	["tow"] = {taken = false},
}
local timing = 60000

-- Add the player to the inService table
AddEventHandler("player:serviceOn", function(job)
	local playerSource = source
    table.insert(inService[job], playerSource)
end)

-- Remove the player to the inService table
AddEventHandler("player:serviceOff", function(job)
local playerSource = source
    if job == nil then
        for _,v in pairs(inService) do
            removeService(v)
        end
    end
    removeService(playerSource, job)
end)

-- Receive call event
AddEventHandler("call:makeCall", function(job, pos, message)
local playerSource = source
	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    -- Players can't call simultanously the same service
	local name = tostring(user.prenom.. " " ..user.nom)
    if callActive[job].taken then
        TriggerClientEvent("target:call:taken", callActive[job].target, 2)
        CancelEvent()
    end
    -- Save the target of the call
    callActive[job].target = playerSource
    callActive[job].taken = true
    -- Send notif to all players in service
    for _, player in pairs(inService[job]) do
        TriggerClientEvent("call:callIncoming", player, job, pos, message, name, tostring(user.telephone))
    end
    -- Say to the target after 'timing' seconds that nobody will come
    SetTimeout(timing, function()
        if callActive[job].taken then
            TriggerClientEvent("target:call:taken", callActive[job].target, 0)
        end
        callActive[job].taken = false
    end)
	end)
end)

AddEventHandler("call:getCall", function(job)
    callActive[job].taken = false
	local playerSource = source
    -- Say to other in service people that the call is taken
    for _, player in pairs(inService[job]) do
        if player ~= playerSource then
            TriggerClientEvent("call:taken", player)
        end
    end
    -- Say to a target that someone come
    if not callActive[job].taken then
        TriggerClientEvent("target:call:taken", callActive[job].target, 1)
    end
end)

function removeService(player, job)
    for i,val in pairs(inService[job]) do
        if val == player then
            table.remove(inService[job], i)
            return
        end
    end
end
