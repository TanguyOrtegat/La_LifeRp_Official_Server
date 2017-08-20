RegisterServerEvent('es:updateName')
AddEventHandler('es:updateName', function(prenom, nom)
    local playerSource = source

	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
			MySQL.Async.execute("UPDATE users SET `nom`=@value WHERE identifier = @identifier", {['@value'] = nom, ['@identifier'] = user.identifier})
			MySQL.Async.execute("UPDATE users SET `prenom`=@value WHERE identifier = @identifier", {['@value'] = prenom, ['@identifier'] = user.identifier})
		else
			TriggerEvent("es:desyncMsg", 'es:updateName')
		end
	end)
end)

RegisterServerEvent('es:getName')
AddEventHandler('es:getName', function()
    local playerSource = source

	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
			local fullname = user.prenom .. " " .. user.nom
			TriggerClientEvent("es:f_getName", playerSource, fullname)
		else
			TriggerEvent("es:desyncMsg", 'es:getName')
		end
	end)
end)
