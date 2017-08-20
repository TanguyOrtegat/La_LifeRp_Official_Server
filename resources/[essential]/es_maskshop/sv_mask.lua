
RegisterServerEvent('BuyMask')
AddEventHandler('BuyMask', function(args)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    local player = tostring(user.identifier)
    if user.money >= args[2] then
      if args[1] == "Masque" then
        MySQL.Async.execute("UPDATE outfits SET mask=@mask, mask_text=@mask_text WHERE identifier = @identifier",
        {['@identifier'] = tostring(player),['@mask'] = tonumber(args[3]),['@mask_text'] = tonumber(args[4])})
      end
      TriggerClientEvent("maskshop:reloadOutfits_f", playerSource)
      LaLife.Player.Manager.RemovePlayerMoney(user, args[2])
      TriggerClientEvent("itinerance:notif", playerSource, "~g~Achat effectué !")
    else
      TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas assez d'argent !")
    end
  end)
end)

RegisterServerEvent('maskshop:reloadOutfits_s')
AddEventHandler('maskshop:reloadOutfits_s', function()
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    MySQL.Async.fetchAll("SELECT mask,mask_text FROM outfits WHERE identifier = @name", {['@name'] = tostring(user.identifier)}, function (result)
      TriggerClientEvent("maskshop:reloadOutfits", playerSource, result[1].mask, result[1].mask_text)
    end)
  end)
end)