RegisterServerEvent('menulost:hire_s')
AddEventHandler('menulost:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 2, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, user.job, 2)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
  TriggerEvent('es:getPlayerFromId', playerSource, function(owner)
	if (owner) then
		local identifier = owner.identifier
		LaLife.Player.Manager.RemovePlayerMoney(owner,10000)
	end
  end)
end)

RegisterServerEvent('menulost:fire_s')
AddEventHandler('menulost:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.subjob) == 2 or tonumber(user.subjob) == 3 then
		MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, user.job, 1)
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

RegisterServerEvent('menulost:promote_s')
AddEventHandler('menulost:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 3 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 4, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,4)
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 3, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, user.job,3)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

RegisterServerEvent('menulost:promote_1_s')
AddEventHandler('menulost:promote_1_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 2 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 3, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,3)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)
