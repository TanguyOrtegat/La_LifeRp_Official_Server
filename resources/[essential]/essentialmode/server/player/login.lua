telist = {}

local hopital = { x = 306.72396850586, y = -1434.4223632813, z = 29.804103851318  }
local countItems = 0

AddEventHandler('onMySQLReady', function()
    countItems = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM items")
end)

RegisterServerEvent("es:deleteTelist")
AddEventHandler("es:deleteTelist", function(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (user) then
			local tel = user.telephone
			telist[tel].IDsource = nil
		else
			TriggerEvent("es:desyncMsg", "es:deleteTelist")
		end
	end)
end)

-- Get the status of the player, Dead or Alive
RegisterServerEvent("es:updateAlivePlayer")
AddEventHandler("es:updateAlivePlayer", function(alive_status)
	TriggerEvent('es:getPlayerFromId', source, function(user)
        TriggerEvent('LaLife:Player:Save', {
            identifier = user.identifier,
            status = alive_status,
        })
	end)
end)

-- When the client dropped. It's here
AddEventHandler('playerDropped', function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (user) then
			user.status  = nil

			local tel = user.telephone
			telist[tel].IDsource = nil

			MySQL.Async.execute("UPDATE users SET `money`=@value WHERE identifier = @identifier",
			{['@value'] = user.money, ['@identifier'] = user.identifier})

			MySQL.Async.execute("UPDATE users SET `dirtymoney`=@value WHERE identifier = @identifier",
			{['@value'] = user.dirtymoney, ['@identifier'] = user.identifier})

			MySQL.Async.execute("UPDATE coordinates SET `x`=@valx,`y`=@valy,`z`=@valz WHERE identifier = @identifier",
			{['@valx'] = user.coords.x, ['@valy'] = user.coords.y, ['@valz'] = user.coords.z, ['@identifier'] = user.identifier})
		else
			TriggerEvent("es:desyncMsg", 'playerDropped')
		end
	end)
end)

-- GET THE PHONEBOOK
RegisterServerEvent("es:getPhonebook")
AddEventHandler("es:getPhonebook", function(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (user) then
			LoadPhonebook(user.identifier, source)
		else
			TriggerEvent("es:desyncMsg", "es:getPhonebook")
		end
	end)
end)

-- AND SEND IT TO THE CLIENT! BOIS IN THE PHONEBOOK!
function LoadPhonebook(identifier, source)
	local phonebook = {}
	MySQL.Async.fetchAll("SELECT * FROM phonebook JOIN users ON `phonebook`.`phonenumber` = `users`.`telephone` WHERE pidentifier = @username", { ['@username'] = identifier }, function (result)
		if (result) then
			for a, v in pairs(result) do
                phonebook[v.phonenumber] = { ["nom"] = v.nom, ["prenom"] = v.prenom, ["identifier"] = a}
			end
		end

		TriggerClientEvent("tel:getPhonebook", source, phonebook)
	end)
end

-- THIS IS WHERE WE LOAD THE INFO FROM THE DATABASE. IF YOU NEED IT IN THE MENU -> fivemenu
-- DON'T FORGET THE PLAYER CLASS! CREATE YOUR GETTER AND SETTER BOI!
function LoadUser(identifier, source)
    TriggerEvent('LaLife:Player:SetSource', identifier, source, function ()
        TriggerEvent("LaLife:Player:GetBySource", source, function (user)
            local playerCountItems = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM user_inventory WHERE user_id = @username", { ['@username'] = identifier })

            if playerCountItems ~= countItems then
                for i=playerCountItems+1,countItems do
                    MySQL.Async.execute("INSERT INTO user_inventory (`user_id`, `item_id`, `quantity`) VALUES (@username, @item_id, '0')", {['@username'] = identifier, ['@item_id'] = i})
                end
            end

            -- THE ARRAY THAT WE WILL USE TO COMMUNICATE WITH CELLPHONE, OMAGGAD TECHNOLOGY
            telist[user.telephone] = { IDsource = source }

            -- LOADING THE PHONEBOOK OF THE PLAYER
            LoadPhonebook(identifier, source)

            -- LOADING STUFF AFTER LOADING PLAYER
            TriggerEvent('es:playerLoaded', source, user)

            TriggerClientEvent('es:finishedLoading', source)
            TriggerClientEvent('LaLife.Player.UserLoaded', source, user)
            TriggerClientEvent('es:setPlayerDecorator', source, 'rank', user.permission_level)
        end)
    end)
end

function stringsplit(self, delimiter)
	local a = self:Split(delimiter)
	local t = {}

	for i = 0, #a - 1 do
		table.insert(t, a[i])
	end

	return t
end

-- PLEASE I HOPE WE CODED THIS FOR NOTHING.
function isIdentifierBanned(id)
	local result = MySQL.Sync.fetchAll("SELECT * FROM bans WHERE banned = @name", {['@name'] = id})
	if(#result > 0)then
		return true
	end

	return false
end

-- GET ONE
function hasAccount(identifier, callback)
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = identifier}, function (result)
		if(result[1] ~= nil) then
			callback(true)
		else
			callback(false)
		end
	end)
end

-- REGISTER FOR LE DB
function registerUser(identifier, source)
	hasAccount(identifier, function (result)
		if not result then
			--Telephone number
			local telephone = tostring(generateTel(identifier))

			-- Inserting Default User Account Stats
			MySQL.Async.execute("INSERT INTO users (`identifier`, `permission_level`, `money`, `group`, `nom`, `prenom`, `telephone`) VALUES (@username, '0', @money, 'user', 'Citizen', 'Citizen', @telephone)",
			{['@username'] = identifier, ['@telephone'] = telephone, ['@money'] = settings.defaultSettings.startingCash})

			MySQL.Async.execute("INSERT INTO coordinates (`identifier`,`x`,`y`,`z`) VALUES (@identifier, @valx, @valy, @valz)",
			{['@valx'] = settings.defaultSettings.spawnx, ['@valy'] = settings.defaultSettings.spawny, ['@valz'] = settings.defaultSettings.spawnz, ['@identifier'] = identifier})

			-- SKIN PAR DÉFAUT
			-- USELESS BUT NEEDED
			MySQL.Async.execute("INSERT INTO outfits (`identifier`, `skin`, `face`, `face_text`, `hair`, `hair_text`, `pants`, `pants_text`, `shoes`, `shoes_text`, `torso`, `torso_text`, `shirt`, `shirt_text`, `three`, `three_text`, `seven`, `seven_text`) VALUES (@username, 'mp_m_freemode_01', '0', '0', '-1', '-1', '24', '5', '18', '0', '29', '5', '31', '0', '12', '0', '29', '2')",
			{['@username'] = identifier, ['@money'] = settings.defaultSettings.startingCash})

			-- INVENTAIRE VIDE
			-- BUILDING AN EMPTY INVENTORY, NEED REWORK UGLY, IM DYING
			for i=1,countItems do
				MySQL.Async.execute("INSERT INTO user_inventory (`user_id`, `item_id`, `quantity`) VALUES (@username, @item_id, '0')",
				{['@username'] = identifier, ['@item_id'] = i})
			end

			local randColor = math.random(1, 100)
			-- VOITURE PAR DÉFAUT
			-- PLATE SYSTEM WITH SOCIAL CLUB ID TASTY AF
			local plateveh = "CTZN" .. string.sub(identifier, -4)
			MySQL.Async.execute("INSERT INTO user_vehicle (`identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES (@username, 'Panto', 'panto', '4000',@plate, 'Rentré', @color, '0', '111', '156')",
			{['@username'] = identifier, ['@color'] = randColor, ['@plate'] = string.upper(plateveh)})

			TriggerClientEvent("ccreation:menu", source)

			LoadUser(identifier, source, true)
		else
			LoadUser(identifier, source)
			TriggerClientEvent("disclaimer:called", source)
		end
	end)
end

local function setPlayerData(identifier, k, v, cb)
    if(k ~= "money") then
        TriggerEvent('LaLife:Player:Save', {
            identifier = identifier,
            [k] = v
        })
        MySQL.Async.execute("UPDATE users SET @key=@value WHERE identifier = @identifier",
            {['@key'] = k, ['@value'] = v, ['@identifier'] = identifier})
    end

    cb("Player data edited.", true)
end

AddEventHandler("es:setPlayerData", function(user, k, v, cb)
    TriggerEvent('LaLife:Player:GetSource', user, function (identifier)
        if identifier == nil then
            cb("User could not be found!", false)

            return
        end

        setPlayerData(identifier, k, v, cb)
    end)
end)

AddEventHandler("es:setPlayerDataId", function(user, k, v, cb)
    setPlayerData(user, k, v, cb)
end)

AddEventHandler("es:getPlayerFromId", function(user, cb)
    TriggerEvent("LaLife:Player:GetBySource", user, cb)
end)

-- USELESS DOPE STUFF
AddEventHandler("es:getPlayerFromIdentifier", function(identifier, cb)
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = identifier}, function (result)
		if(result[1])then
			cb(result[1])
		else
			cb(nil)
		end
	end)
end)

-- IF YOU NEED ALL THE PLAYERS
AddEventHandler("es:getAllPlayers", function(cb)
	MySQL.Async.fetchAll("SELECT * FROM users", {}, function (result)
		if(result)then
			cb(result)
		else
			cb(nil)
		end
	end)
end)

-- GENERATING A CELLPHONE NUMBER, WITH... SOCIAL CLUB ID OMGG AGAIN
function generateTel(identifier)
	local tel = ""
	for i = #identifier, 1, -1 do
		local c = string.sub(identifier, i, i)
		-- do something with c
		if (#tel) < 8 then
			c = tonumber(c)
			if c ~= nil then
				if string.len(tel) == 3 then
					tel = tel .. "-"
				end
				c = tostring(c)
				tel = tel .. c
			end
		end
	end
	return tel
end

-- GET PLATE NUMBER
RegisterServerEvent("es:getVehPlate")
AddEventHandler("es:getVehPlate", function()
    local playerSource = source

	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
			TriggerClientEvent("es:f_getVehPlate", playerSource, user.vehicle)
		else
			TriggerEvent("es:desyncMsg", "es:getVehPlate")
		end
	end)
end)


-- GET THE PLAYER X Y Z READY TO BE SPAWNED
RegisterServerEvent("es:requestingSpawnData")
AddEventHandler("es:requestingSpawnData", function()
    local playerSource = source

	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
			TriggerClientEvent("es:sendingSpawnData", playerSource, user.coords)
		else
			TriggerEvent("es:desyncMsg", "es:requestingSpawnData")
		end
	end)
end)


-- Function to update player money every 60 seconds.
local function savePlayerMoney()
	SetTimeout(60000, function()
		TriggerEvent("LaLife.Player.Manager.GetConnectedPlayers", function(users)
			for k,v in pairs(users) do
				MySQL.Async.execute("UPDATE users SET `money`=@value WHERE identifier = @identifier",
				{['@value'] = v.money, ['@identifier'] = v.identifier})

				MySQL.Async.execute("UPDATE users SET `dirtymoney`=@value WHERE identifier = @identifier",
				{['@value'] = v.dirtymoney, ['@identifier'] = v.identifier})

				MySQL.Async.execute("UPDATE coordinates SET `x`=@valx,`y`=@valy,`z`=@valz WHERE identifier = @identifier",
				{['@valx'] = v.coords.x, ['@valy'] = v.coords.y, ['@valz'] = v.coords.z, ['@identifier'] = v.identifier})
			end
		end)

		savePlayerMoney()
	end)
end

savePlayerMoney()

-- THE FUKED UP CODE THAT IS NOT SUPPOSE TO BE THERE BUT IT IS.

-- TELEPHONE -> TELIST
RegisterServerEvent("tel:sendingMsg")
AddEventHandler("tel:sendingMsg", function(msg, teldest)
	local name = nil
	local surname = nil
	local origin = nil
    local playerSource = source

	TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
			name = user.nom
			surname = user.prenom
			origin = user.telephone
		else
			TriggerEvent("es:desyncMsg", "tel:sendingMsg")
		end
	end)
	if name ~= nil then
		if telist[teldest] ~= nil then
			if telist[teldest].IDsource ~= nil then
				local player = telist[teldest].IDsource
				local player2 = telist[origin].IDsource
				TriggerClientEvent("tel:receivingMsg", player, msg, name, surname)
				TriggerClientEvent("itinerance:notif", player2, "~g~ Message envoyé")
			else
				TriggerClientEvent("itinerance:notif", player2, "~r~ Le joueur n'est pas connecté")
			end
		else
			TriggerClientEvent("itinerance:notif", player2, "~r~ Le joueur n'est pas connecté")
		end
	else
		TriggerEvent("es:desyncMsg", "tel:sendingMsg 2")
	end
end)

-- GET THE ID WITH THIS COOL FUNC
function getPlayerID(source)
	local identifiers = GetPlayerIdentifiers(source)
	local player = getIdentifiant(identifiers)
	return player
end

function getIdentifiant(id)
	for _, v in ipairs(id) do
		return v
	end
end
