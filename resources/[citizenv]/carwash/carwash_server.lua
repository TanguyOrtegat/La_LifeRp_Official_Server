local price = 25 -- you may edit this to your liking. if "enableprice = false" ignore this one

--DO-NOT-EDIT-BELLOW-THIS-LINE--
RegisterServerEvent('carwash:checkmoney')
AddEventHandler('carwash:checkmoney', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if tonumber(user.money) >= price then
            LaLife.Player.Manager.RemovePlayerMoney(user, price)
            TriggerClientEvent('carwash:success', playerSource)
        else
            TriggerClientEvent('itinerance:notif', playerSource, "~r~Vous avez besoin de " ..price.. "$ pour laver votre véhicule !")
        end
    end)
end)
