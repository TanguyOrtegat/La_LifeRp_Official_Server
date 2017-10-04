RegisterServerEvent('drink:addmoney')
AddEventHandler('drink:addmoney', function(money, name)
		local playerSource = source
        print("in strip")
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = name}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(math.floor(money*0.65))), ['@identifier'] = name})
      TriggerClientEvent("itinerance:notif", playerSource, "Vous avez reçu une facture de ~r~".. money.."$~w~.")
    end)
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        LaLife.Player.Manager.RemovePlayerMoney(user,money)
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
end)
