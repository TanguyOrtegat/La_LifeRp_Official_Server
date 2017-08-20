RegisterServerEvent('lock:getCar')
AddEventHandler('lock:getCar', function(callback)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            TriggerClientEvent("lock:f_getCar", playerSource, {user.vehicle, user.jobVehicle})
        else
            TriggerEvent("es:desyncMsg", "lock_s.lua GetCar")
        end
    end)
end)
