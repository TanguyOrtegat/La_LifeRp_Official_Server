RegisterServerEvent('menupres:hiresec_s')
AddEventHandler('menupres:hiresec_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 20, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 20,user.subjob)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectu�e!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez �t� engag� en tant que secr�taire du pr�sident !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menupres:hiregarde_s')
AddEventHandler('menupres:hiregarde_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 19, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 19,user.subjob)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectu�e!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez �t� engag� en tant qu'agent du FBI !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menupres:fire_s')
AddEventHandler('menupres:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 20 or tonumber(user.job) == 19 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1,user.subjob)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectu�e!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez �t� licenci� !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas secr�taire ou agent du FBI !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)
