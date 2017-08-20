fuelCost = 0.5

RegisterServerEvent('frfuel:fuelAdded')-- fuel events
AddEventHandler('frfuel:fuelAdded', function(amount) --fuelAmount
    local playerSource = source

	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if user ~= nil then
			local cost = round(amount * fuelCost)
            LaLife.Player.Manager.RemovePlayerMoney(user, cost)
		else
			TriggerEvent("es:desyncMsg", 'frfuel:fuelAdded')
		end
	end)
end)

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
