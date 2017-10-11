RegisterServerEvent('menuweed:hire_s')
AddEventHandler('menuweed:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 11, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user,user.job,11)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
  TriggerEvent('es:getPlayerFromId', playerSource, function(owner)
	  if (owner) then
		  local identifier = user.identifier
		  LaLife.Player.Manager.RemovePlayerMoney(owner,10000)
	  end
	end)
end)

RegisterServerEvent('menuweed:fire_s')
AddEventHandler('menuweed:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.subjob) == 11 or tonumber(user.subjob) == 12 or tonumber(user.subjob) == 13 then
		MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, user.job,1)
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

RegisterServerEvent('menuweed:promote_s')
AddEventHandler('menuweed:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 13 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 25, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,14)
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 13, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, user.job,13)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

RegisterServerEvent('menuweed:promote_1_s')
AddEventHandler('menuweed:promote_1_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 11 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 12, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,12)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

RegisterServerEvent('menuweed:promote_2_s')
AddEventHandler('menuweed:promote_2_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 12 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 13, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,13)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)
