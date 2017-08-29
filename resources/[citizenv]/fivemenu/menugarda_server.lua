RegisterServerEvent('menugarda:hire_s')
AddEventHandler('menugarda:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 26, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 26)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant que dépanneur !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menugarda:fire_s')
AddEventHandler('menugarda:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 26 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas dépanneur !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menugarda:promote_s')
AddEventHandler('menugarda:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 15 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 27, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 27)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 26, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 26)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas dépanneur !")
		end
  end)
  end)
end)

RegisterServerEvent('menugarda:givefac_s')
AddEventHandler('menugarda:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
  TriggerEvent('es:getPlayerFromId', netID, function(user)
  if user.money >= amount then
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'GardaLife'}, function (result)
      LaLife.Player.Manager.RemovePlayerMoney(user, amount)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'GardaLife'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
  else
    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
  end
  end)
end)