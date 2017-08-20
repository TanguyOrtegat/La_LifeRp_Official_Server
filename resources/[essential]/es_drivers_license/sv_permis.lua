local price = 2500

--[[Register]]--

RegisterServerEvent('permis:updateDriverLicense')
RegisterServerEvent('permis:permischeckserver')

--[[Events]]--

AddEventHandler('permis:updateDriverLicense', function()
local playerSource = source
	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
	    local player = user.identifier
		updateDriverLicense(player)
	end)
end)

AddEventHandler('permis:permischeckserver', function()
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    local player = user.identifier
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @username",{['@username'] = player}, function (result)
    if (result) then
		if (tonumber(result[1].permis)) == 0 then
			if (tonumber(user.money) >= tonumber(price)) then
				LaLife.Player.Manager.RemovePlayerMoney(user, price)
				TriggerClientEvent('permis:permischeck', playerSource)
				TriggerClientEvent("itinerance:notif", playerSource, "~y~Attention, n'endomagez pas le véhicule sinon vous devrez recommencer !")
			else
				TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous avez besoin de " ..price.. "$ pour avoir votre permis de conduire !")
			end
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous avez déjà votre permis de conduire !")
		end
    else
		if (tonumber(result[1].permis)) == 0 then
			if (tonumber(user.money) >= tonumber(price)) then
				LaLife.Player.Manager.RemovePlayerMoney(user, price)
				TriggerClientEvent('permis:permischeck', playerSource)
				TriggerClientEvent("itinerance:notif", playerSource, "Vous avez donnÃ© ~g~" .. total .. "$")
			else
				TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous avez besoin de " ..price.. " $ pour avoir votre permis de conduire !")
			end
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous avez déjà votre permis de conduire !")
		end
    end
    end)
  end)
end)

--[[Function]]--

function updateDriverLicense(player)
  local player = player
  MySQL.Async.execute("UPDATE users SET `permis`=@value WHERE identifier = @identifier", {['@value'] = 12, ['@identifier'] = player})
end