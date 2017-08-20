RegisterServerEvent('menumedic:healcoma_s')
AddEventHandler('menumedic:healcoma_s', function(netID)
	local playerSource = source

	TriggerEvent('es:getPlayerFromId', netID, function(user)
		if user.status == "dead" then
			TriggerClientEvent("menumedic:healcoma_f", playerSource)
			TriggerEvent("es_em:sv_resurectPlayer", netID)
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas dans le coma !")
		end
	end)
end)

RegisterServerEvent('menumedic:heal_s')
AddEventHandler('menumedic:heal_s', function(netID)
	local playerSource = source

	TriggerEvent('es:getPlayerFromId', netID, function(user)
		TriggerClientEvent("itinerance:notif", playerSource, "~g~Vous avez soigné la cible avec succès !")
		TriggerClientEvent("menumedic:heal_f", netID)
	end)
end)