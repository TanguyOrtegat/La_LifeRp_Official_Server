
RegisterServerEvent('BuyCloth')
AddEventHandler('BuyCloth', function(args)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    local player = tostring(user.identifier)
    if user.money >= args[2] then
      if args[1] == "Haut" then
        MySQL.Async.execute("UPDATE outfits SET torso=@torso, torso_text=@torso_text, shirt=@shirt, shirt_text=@shirt_text, three=@three, three_text=@three_text WHERE identifier = @identifier",
        {['@identifier'] = tostring(player), ['@torso'] = args[5], ['@torso_text'] = args[6],['@shirt'] = tonumber(args[3]),['@shirt_text'] = tonumber(args[4]), ['@three'] = args[7], ['@three_text'] = args[8]})
      elseif args[1] == "Cravate" then
        MySQL.Async.execute("UPDATE outfits SET seven=@seven, seven_text=@seven_text WHERE identifier = @identifier",
        {['@identifier'] = tostring(player),['@seven'] = tonumber(args[3]),['@seven_text'] = tonumber(args[4])})
      elseif args[1] == "Pantalon" then
        MySQL.Async.execute("UPDATE outfits SET pants=@pants, pants_text=@pants_text WHERE identifier = @identifier",
        {['@identifier'] = tostring(player),['@pants'] = tonumber(args[3]),['@pants_text'] = tonumber(args[4])})
      elseif args[1] == "Chaussure" then
        MySQL.Async.execute("UPDATE outfits SET shoes=@shoes, shoes_text=@shoes_text WHERE identifier = @identifier",
        {['@identifier'] = tostring(player),['@shoes'] = tonumber(args[3]),['@shoes_text'] = tonumber(args[4])})
      elseif args[1] == "Chapeau" then
        MySQL.Async.execute("UPDATE outfits SET hat=@hat, hat_text=@hat_text WHERE identifier = @identifier",
        {['@identifier'] = tostring(player),['@hat'] = tonumber(args[3]),['@hat_text'] = tonumber(args[4])})
      elseif args[1] == "Lunettes" then
        MySQL.Async.execute("UPDATE outfits SET glass=@glass, glass_text=@glass_text WHERE identifier = @identifier",
        {['@identifier'] = tostring(player),['@glass'] = tonumber(args[3]),['@glass_text'] = tonumber(args[4])})
      end
      TriggerClientEvent("cshop:reloadOutfits_f", playerSource)
      LaLife.Player.Manager.RemovePlayerMoney(user, args[2])
      TriggerClientEvent("itinerance:notif", playerSource, "~g~Achat effectué !")
    else
      TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas assez d'argent !")
    end
  end)
end)

RegisterServerEvent('cshop:reloadOutfits_s')
AddEventHandler('cshop:reloadOutfits_s', function()
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    MySQL.Async.fetchAll("SELECT * FROM outfits WHERE identifier = @name", {['@name'] = tostring(user.identifier)}, function (result)
      TriggerClientEvent("cshop:reloadOutfits", playerSource, result[1].pants, result[1].pants_text, result[1].shoes, result[1].shoes_text, result[1].torso, result[1].torso_text, result[1].shirt, result[1].shirt_text, result[1].three, result[1].three_text, result[1].seven, result[1].seven_text, result[1].hat, result[1].hat_text, result[1].glass, result[1].glass_text, result[1].watch, result[1].watch_text)
    end)
  end)
end)