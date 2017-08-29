RegisterServerEvent('menutaxi:hire_s')
AddEventHandler('menutaxi:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 17, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 17)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant que chauffeur de taxi !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menutaxi:fire_s')
AddEventHandler('menutaxi:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 17 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas chauffeur de taxi !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menutaxi:promote_s')
AddEventHandler('menutaxi:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 17 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 18, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 18)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 17, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 17)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas chauffeur de taxi !")
		end
  end)
  end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent('menutaxi:givefac_s')
AddEventHandler('menutaxi:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
	TriggerEvent('es:getPlayerFromId', netID, function(user)
--	if user.money >= amount th en
	local player = user.identifier
	local bankbalance = bankBalance(user.identifier)
	local new_balance = bankbalance - amount
	print(new_balance)
	MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'Taxi Garage'}, function (result)
	--  LaLife.Player.Manager.RemovePlayerMoney(user, amount)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'Taxi Garage'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
-- end
  end)
end)

--menutaxi:paidfordispatch

RegisterServerEvent('menutaxi:paidfordispatch')
AddEventHandler('menutaxi:paidfordispatch', function()
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    LaLife.Player.Manager.AddPlayerMoney(user, 800)
  end)
end)
