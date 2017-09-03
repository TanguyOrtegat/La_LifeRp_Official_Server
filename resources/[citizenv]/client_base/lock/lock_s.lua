RegisterServerEvent('lock:getCar')
AddEventHandler('lock:getCar', function(callback)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("CTZN" .. string.sub(user.identifier, -4))
            TriggerClientEvent("lock:f_getCar", playerSource, {plateveh, user.jobVehicle})
        else
            TriggerEvent("es:desyncMsg", "lock_s.lua GetCar")
        end
    end)
end)
