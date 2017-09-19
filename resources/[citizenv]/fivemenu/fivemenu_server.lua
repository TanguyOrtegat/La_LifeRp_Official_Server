RegisterServerEvent('vmenu:getUpdates')
AddEventHandler('vmenu:getUpdates', function(openMenu)
    local playerSource = source
	--print("-[FiveMenu]- Updating Menu...")
	-- Requêtes SQL ou autre ici...
	local MenuOpts = {
		BottlesNumber = 42,
	}
	if openMenu then
		MenuOpts.openMenu = true
	else
		TriggerEvent('es:getPlayerFromId', playerSource, function(user)
			if (user) then
				-- TriggerEvent('es:getPlayerFromIdentifier', user.identifier, function(user)
				-- 	MenuOpts.user = user
				-- end)
			end
		end)
	end
	--------------------------------

	MenuOpts.firstLoad = true
	-- Envoie des données et Ouverture du Menu...
	TriggerClientEvent("vmenu:serverOpenMenu", playerSource, MenuOpts)

end)

local userInfos = {}

function updateUserMenu(playerSource, openMenu)
    local userInfos = {}

    -- Spawned = false,
    -- Loaded = false,
    -- group = "0",
    -- permission_level = 0,
    -- money = 0,
    -- dirtymoney = 0,
    -- job = 0,
    -- police = 0,
    -- enService = 0,
    -- nom = "",
    -- prenom = "",
    -- vehicle = "",
    -- identifier = nil,
    -- telephone = ""
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            userInfos["group"] = user.group
            userInfos["permission_level"] = user.permission_level
            userInfos["money"] = user.money
            userInfos["dirtymoney"] = user.dirtymoney
            userInfos["job"] = user.job
            userInfos["police"] = user.police
            userInfos["enService"] = user.enService
            userInfos["nom"] = user.nom
            userInfos["prenom"] = user.prenom
            userInfos["vehicle"] = user.vehicle
            userInfos["telephone"] = user.telephone
            userInfos["identifier"] = user.identifier
            userInfos["gender"] = user.gender
        end
    end)
    userInfos.Loaded = true
    -- Envoie des données et Ouverture du Menu...
    TriggerClientEvent("vmenu:setUser", playerSource, userInfos)
end

RegisterServerEvent('vmenu:updateUserFromId')
AddEventHandler('vmenu:updateUserFromId', function(playerSource, openMenu)
    updateUserMenu(playerSource, openMenu)
end)

RegisterServerEvent('vmenu:updateUser')
AddEventHandler('vmenu:updateUser', function(openMenu)
	--print("-[FiveMenu]- Updating User...")
    updateUserMenu(source, openMenu)
end)

AddRegisteredUserEventHandler("vmenu:identity_check_s", function(playerSource, user)
    local player = user.identifier
	local permis = nil
	local permisArme = nil
	local permisBateau = nil
	local permisPilote = nil
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @username",{['@username'] = player}, function (result)
		if (result) then
			if (tonumber(result[1].permis)) == 0 then
				permis = "~r~Non"
			else
				permis = (tonumber(result[1].permis))
			end
			if (tonumber(result[1].permisArme)) == 0 then
				permisArme = "~r~Non"
			else
				permisArme = "~g~Oui"
			end
			if (tonumber(result[1].permisBateau)) == 0 then
				permisBateau = "~r~Non"
			else
				permisBateau = "~g~Oui"
			end
			if (tonumber(result[1].permisPilote)) == 0 then
				permisPilote = "~r~Non"
			else
				permisPilote = "~g~Oui"
			end
			TriggerClientEvent('vmenu:identity', playerSource, permis, permisArme, permisBateau, permisPilote)
		else
			if (tonumber(result[1].permis)) == 0 then
				permis = "~r~Non"
			else
				permis = (tonumber(result[1].permis))
			end
			if (tonumber(result[1].permisArme)) == 0 then
				permisArme = "~r~Non"
			else
				permisArme = "~g~Oui"
			end
			if (tonumber(result[1].permisBateau)) == 0 then
				permisBateau = "~r~Non"
			else
				permisBateau = "~g~Oui"
			end
			if (tonumber(result[1].permisPilote)) == 0 then
				permisPilote = "~r~Non"
			else
				permisPilote = "~g~Oui"
			end
			TriggerClientEvent('vmenu:identity', playerSource, permis, permisArme, permisBateau, permisPilote)
		end
    end)
end)

RegisterServerEvent('vmenu:bourse_s')
AddEventHandler('vmenu:bourse_s', function()
    local playerSource = source
    local roche, rochechange, cuivre, cuivrechange, fer, ferchange, diamant, diamantchange, morue, moruechange, sardine, sardinechange, daurade, dauradechange, saumon, saumonchange, vin, vinchange, bcuivre, bcuivrechange, pfer, pferchange, patate, patatechange = nil

    MySQL.Async.fetchAll("SELECT * FROM bourse",{}, function (result)
    --print(tostring(result[1].changement))
      roche = result[1].prix
      rochechange = tonumber(result[1].changement)
      cuivre = result[2].prix
      cuivrechange = tonumber(result[2].changement)
      fer = result[3].prix
      ferchange =tonumber( result[3].changement)
      diamant = result[4].prix
      diamantchange = tonumber(result[4].changement)
      morue = result[5].prix
      moruechange = tonumber(result[5].changement)
      sardine = result[6].prix
      sardinechange = tonumber(result[6].changement)
      daurade = result[7].prix
      dauradechange = tonumber(result[7].changement)
      saumon = result[8].prix
      saumonchange = tonumber(result[8].changement)
      vin = result[9].prix
      vinchange = tonumber(result[9].changement)
      patate = result[12].prix
      patatechange = tonumber(result[12].changement)
      bcuivre = result[10].prix
      bcuivrechange = tonumber(result[10].changement)
      pfer = result[11].prix
      pferchange = tonumber(result[11].changement)
      TriggerClientEvent("vmenu:bourse", playerSource, roche, rochechange, cuivre, cuivrechange, fer, ferchange, diamant, diamantchange, morue, moruechange, sardine, sardinechange, daurade, dauradechange, saumon, saumonchange, vin, vinchange, bcuivre, bcuivrechange, pfer, pferchange, patate, patatechange)
    end)

end)


AddRegisteredUserEventHandler("vmenu:sync_s", function(playerSource, user)
	local player = user.identifier
	if (user) then
		MySQL.Async.execute("UPDATE coordinates SET `x`=@valx,`y`=@valy,`z`=@valz WHERE identifier = @identifier",
		{['@valx'] = user.coords.x, ['@valy'] = user.coords.y, ['@valz'] = user.coords.z, ['@identifier'] = player})

		TriggerClientEvent("itinerance:notif", playerSource, "~b~Position sauvegardée !")
	else
		MySQL.Async.execute("UPDATE coordinates SET `x`=@valx,`y`=@valy,`z`=@valz WHERE identifier = @identifier",
		{['@valx'] = user.coords.x, ['@valy'] = user.coords.y, ['@valz'] = user.coords.z, ['@identifier'] = player})

		TriggerClientEvent("itinerance:notif", playerSource, "~b~Position sauvegardée !")
	end
end)

AddRegisteredUserEventHandler("es:getVehPlate_s", function(playerSource, user)
	if (user) then
		local plate = user.vehicle
		TriggerClientEvent("es:f_getVehPlate", playerSource, plate)
	else
		TriggerEvent("es:desyncMsg", "es:getVehPlate_s")
	end
end)

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

AddRegisteredUserEventHandler("vmenu:cleanCash_s", function(playerSource, user)
	if (user) then
		local dcash = tonumber(user.dirtymoney)
		local cash = tonumber(user.money)
		local washedcash = dcash * 0.55
        local total = cash + round(washedcash)

        LaLife.Player.Manager.SetPlayerDirtyMoney(user, 0)
        LaLife.Player.Manager.SetPlayerMoney(user, total)
	else
		TriggerEvent("es:desyncMsg", "vmenu:cleanCash_s")
	end
end)

RegisterServerEvent("vmenu:giveCash_s")
AddEventHandler("vmenu:giveCash_s", function(netID, cash)
    local playerSource = source
    local total = tonumber(cash)
	local name = ""
	local surname = ""
	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
			name =  user.nom
			surname = user.prenom
            LaLife.Player.Manager.RemovePlayerMoney(user, total)
			TriggerClientEvent("itinerance:notif", playerSource, "Vous avez donné ~g~" .. total .. "$")
		else
			TriggerEvent("es:desyncMsg", "vmenu:giveCash_s 1")
		end
	end)
	TriggerEvent('es:getPlayerFromId', netID, function(user)
		if (user) then
            LaLife.Player.Manager.AddPlayerMoney(user, total)
			TriggerClientEvent("itinerance:notif", netID, surname .. " " .. name .. " vous a donné ~g~" .. total .. "$")
		else
			TriggerEvent("es:desyncMsg", "vmenu:giveCash_s 2")
		end
	end)
end)

RegisterServerEvent("vmenu:giveDCash_s")
AddEventHandler("vmenu:giveDCash_s", function(netID, cash)
    local playerSource = source
	local total = tonumber(cash)
	local name = ""
	local surname = ""
	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
			name =  user.nom
			surname = user.prenom
            LaLife.Player.Manager.RemovePlayerDirtyMoney(user, total)
			TriggerClientEvent("itinerance:notif", playerSource, "Vous avez donné ~r~" .. total .. "$")
		else
			TriggerEvent("es:desyncMsg", "vmenu:giveDCash_s 1")
		end
	end)
	TriggerEvent('es:getPlayerFromId', netID, function(user)
		if (user) then
            LaLife.Player.Manager.AddPlayerDirtyMoney(user, total)
			TriggerClientEvent("itinerance:notif", netID, surname .. " " .. name .. " vous a donné ~r~" .. total .. "$")
		else
			TriggerEvent("es:desyncMsg", "vmenu:giveDCash_s 2")
		end
	end)
end)

RegisterServerEvent("vmenu:takevote_s")
AddEventHandler("vmenu:takevote_s", function(cand)
  local ouvert = 1
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
  local player = user.identifier
  MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = player}, function (result)
  MySQL.Async.fetchAll("SELECT * FROM votes WHERE candidat = @name", {['@name'] = tostring(cand)}, function (resultn)
  if tonumber(result[1].aVote) == 0 then
    if tonumber(ouvert) == 1 then
      MySQL.Async.execute("UPDATE users SET `aVote`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] = player})
      MySQL.Async.execute("UPDATE votes SET `votes`=@value WHERE candidat = @identifier", {['@value'] = tonumber(resultn[1].votes)+1, ['@identifier'] = tostring(cand)})
      TriggerClientEvent("itinerance:notif", playerSource, "~g~Votre vote a été pris en compte !")
    else
      TriggerClientEvent("itinerance:notif", playerSource, "~r~Il n'y a pas d'éléctions pour l'instant !")
    end
  else
    TriggerClientEvent("itinerance:notif", playerSource, "~r~Tu a déjà voté !")
  end
end)
end)
end)
end)
