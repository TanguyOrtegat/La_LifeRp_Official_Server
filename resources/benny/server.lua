useES = true


local tbl = {
	[1] = {locked = false, player = -1},
}

local modPrices = {
	["repair"] = 1500,
	["clean"] = 30,
	["extra"] = 0,
	["neons"] = 2250,
	["paint"] = 1000,
	["Steering Wheel"] = 750,
	["Air Filter"] = 2000,
	["Dashboard"] = 2000,
	["Ornaments"] = 500,
	["Struts"] = 500,
	["Engine Block"] = 2000,
	["Roof"] = 2500,
	["Side Skirt"] = 1500,
	["Trim"] = 500,
	["Windows"] = 500,
	["Vanity Plates"] = 1000,
	["Frame"] = 6000,
	["Grille"] = 2000,
	["Dial"] = 1000,
	["Door Speaker"] = 1500,
	["Rear Bumper"] = 2500,
	["Front Bumper"] = 2500,
	["Spoilers"] = 2000,
	["Trim 2"] = 1000,
	["Seats"] = 1500,
	["Tank"] = 500,
	["Aerials"] = 750,
	["Arch Cover"] = 1000,
	["Fender"] = 2000,
	["Right Fender"] = 1000,
	["Exhaust"] = 2000,
	["Hood"] = 3000,
	["Hydraulics"] = 1000,
	["Trunk"] = 1000,
	["Speakers"] = 500,
	["Plaques"] = 1000,
	["Shifter Leavers"] = 500,
	["Livery"] = 5000,
	["Performance_1"] = 10000,
	["Performance_2"] = 20000,
	["Performance_3"] = 30000,
	["Performance_4"] = 40000,
	["Turbo"] = 40000,
	["Wheels"] = 2000,
	["Wheel Types"] = 0,
}



Citizen.CreateThread(function()
	RegisterServerEvent('fx_customs:LockGarage')
	AddEventHandler('fx_customs:LockGarage', function(b,garage,player)
		tbl[tonumber(garage)].locked = b
		tbl[tonumber(garage)].player = player
		TriggerClientEvent('LockGarage',-1,tbl)
	end)

	function openGarage()
		for theId,theValues in pairs(tbl) do
			if tbl[theId].locked == true and tbl[theId].player ~= -1 and not GetPlayerName(tbl[theId].player) then
				local pl = GetPlayerName(tbl[theId].player)
				tbl[theId].locked = false
				TriggerClientEvent('LockGarage',-1,tbl)
				Citizen.Trace("garage closed but player not found, opening..")
			end
		end
		SetTimeout(20000, openGarage)
	end
	SetTimeout(20000, openGarage)

	RegisterServerEvent("fx_customs:RequestPriceList")
	AddEventHandler("fx_customs:RequestPriceList", function()
		TriggerClientEvent("fx_customs:RequestPriceList",source,modPrices)
	end)

	if useES == false then
		for theRow,theKey in pairs(modPrices) do
			modPrices[theRow] = 0
		end
	end

	RegisterServerEvent("fx_customs:payPart")
	AddEventHandler('fx_customs:payPart', function(price)
		sorse = source
		if useES then
			couldafford = false
			TriggerEvent('es:getPlayerFromId', sorse, function(ourUser)
				if (tonumber(ourUser.money) >= tonumber(price)) then
			    	LaLife.Player.Manager.RemovePlayerMoney(ourUser,price)
					couldafford = true
				else
					couldafford = false
				end
			end)
		else
			couldafford = true
		end

		TriggerClientEvent("lscustoms:payedForPart", sorse, couldafford)
	end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent("benny:fac")
AddEventHandler("benny:fac", function(amount)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
--  if user.money >= amount then
		local player = user.identifier
		local bankbalance = bankBalance(user.identifier)
		local new_balance = bankbalance - amount
		--print(new_balance)
		MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'Remorqueur Garage'}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'Remorqueur Garage'})
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
  end)
end)
