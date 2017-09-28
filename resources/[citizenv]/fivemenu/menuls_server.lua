RegisterServerEvent('menuls1:hire_s')
AddEventHandler('menuls1:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 31, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 31)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls1:fire_s')
AddEventHandler('menuls1:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 31 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un employer !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls1:promote_s')
AddEventHandler('menuls1:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 31 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 30, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 30)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 31, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 31)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent('menuls1:givefac_s')
AddEventHandler('menuls1:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
  TriggerEvent('es:getPlayerFromId', target, function(user)
--  if user.money >= amount then
		local player = user.identifier
		local bankbalance = bankBalance(user.identifier)
		local new_balance = bankbalance - amount
		--print(new_balance)
		MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'LaGarda'}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'LSCustom Coffre 1/5'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
  end)
end)


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('menuls2:hire_s')
AddEventHandler('menuls2:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 33, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 33)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls2:fire_s')
AddEventHandler('menuls2:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 33 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un employer !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls2:promote_s')
AddEventHandler('menuls2:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 33 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 32, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 32)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 33, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 33)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent('menuls2:givefac_s')
AddEventHandler('menuls2:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
  TriggerEvent('es:getPlayerFromId', target, function(user)
--  if user.money >= amount then
		local player = user.identifier
		local bankbalance = bankBalance(user.identifier)
		local new_balance = bankbalance - amount
		--print(new_balance)
		MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'LaGarda'}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'LSCustom Coffre 2/5'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
  end)
end)


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('menuls3:hire_s')
AddEventHandler('menuls3:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 35, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 35)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls3:fire_s')
AddEventHandler('menuls3:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 35 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un employer !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls3:promote_s')
AddEventHandler('menuls3:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 35 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 34, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 34)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 35, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 35)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent('menuls3:givefac_s')
AddEventHandler('menuls3:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
  TriggerEvent('es:getPlayerFromId', target, function(user)
--  if user.money >= amount then
		local player = user.identifier
		local bankbalance = bankBalance(user.identifier)
		local new_balance = bankbalance - amount
		--print(new_balance)
		MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'LaGarda'}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'LSCustom Coffre 3/5'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
  end)
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('menuls4:hire_s')
AddEventHandler('menuls4:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 37, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 37)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls4:fire_s')
AddEventHandler('menuls4:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 37 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un employer !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls4:promote_s')
AddEventHandler('menuls4:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 37 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 36, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 36)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 37, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 37)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent('menuls4:givefac_s')
AddEventHandler('menuls4:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
  TriggerEvent('es:getPlayerFromId', target, function(user)
--  if user.money >= amount then
		local player = user.identifier
		local bankbalance = bankBalance(user.identifier)
		local new_balance = bankbalance - amount
		--print(new_balance)
		MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'LaGarda'}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'LSCustom Coffre 4/5'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
  end)
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('menuls5:hire_s')
AddEventHandler('menuls5:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 39, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 39)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls5:fire_s')
AddEventHandler('menuls5:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 39 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un employer !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuls5:promote_s')
AddEventHandler('menuls5:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 37 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 38, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 38)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 39, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 39)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent('menuls5:givefac_s')
AddEventHandler('menuls5:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
  TriggerEvent('es:getPlayerFromId', target, function(user)
--  if user.money >= amount then
		local player = user.identifier
		local bankbalance = bankBalance(user.identifier)
		local new_balance = bankbalance - amount
		--print(new_balance)
		MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'LaGarda'}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'LSCustom Coffre 5/5'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
  end)
end)
