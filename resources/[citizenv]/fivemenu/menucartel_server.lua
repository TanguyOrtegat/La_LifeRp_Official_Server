RegisterServerEvent('menucartel:hire_s')
AddEventHandler('menucartel:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 7, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user,user.job,7)
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

RegisterServerEvent('menucartel:fire_s')
AddEventHandler('menucartel:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.subjob) == 7 or tonumber(user.subjob) == 8 or tonumber(user.subjob) == 9 then
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

RegisterServerEvent('menucartel:promote_s')
AddEventHandler('menucartel:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 9 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 10, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,10)
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 9, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, user.job,9)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

RegisterServerEvent('menucartel:promote_1_s')
AddEventHandler('menucartel:promote_1_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 7 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 8, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,8)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

RegisterServerEvent('menucartel:promote_2_s')
AddEventHandler('menucartel:promote_2_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.subjob)) == 8 then
			MySQL.Async.execute("UPDATE users SET `subjob`=@value WHERE identifier = @identifier", {['@value'] = 9, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, user.job,9)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)
