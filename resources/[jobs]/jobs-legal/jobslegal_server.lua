local mode = "Async"

local lang = 'en'
local txt = {
  	['fr'] = {
        ['welcome'] = 'Bienvenue dans votre appartement!\n',
        ['nocash'] = 'Vous n\'avez pas assez d\'argent!\n',
        ['estVendu'] = 'Appartement vendus!\n'
  },

    ['en'] = {
        ['welcome'] = 'Welcome to home!\n',
        ['nocash'] = 'You d\'ont have enough cash!\n',
        ['estVendu'] = 'Apartment sold!\n'
    }
}

local money = 0
local dirtymoney = 0

local items = {
  --[[
	[1] = {["libelle"] = "Bouteille d'eau" ,["valeur"] = 0},
	[2] = {["libelle"] = "Sandwich" ,["valeur"] = 0},
	[3] = {["libelle"] = "Filet Mignon" ,["valeur"] = 0},
	[4] = {["libelle"] = "Cannabis" ,["valeur"] = 0},
	[5] = {["libelle"] = "Cannabis roulé" ,["valeur"] = 0},
	[6] = {["libelle"] = "Feuille de cocaïne" ,["valeur"] = 0},
	[7] = {["libelle"] = "Feuille de cocaïne 50" ,["valeur"] = 0},
	[8] = {["libelle"] = "Cocaïne" ,["valeur"] = 0},
	[9] = {["libelle"] = "Éphédrine" ,["valeur"] = 0},
	[10] = {["libelle"] = "Éphédrine 33" ,["valeur"] = 0},
	[11] = {["libelle"] = "Éphédrine 66" ,["valeur"] = 0},
	[12] = {["libelle"] = "Meth" ,["valeur"] = 0},
	[13] = {["libelle"] = "Organe" ,["valeur"] = 0},
	[14] = {["libelle"] = "Organe emballé" ,["valeur"] = 0},
	[15] = {["libelle"] = "Organe analysé" ,["valeur"] = 0},
	[16] = {["libelle"] = "Organe livrable" ,["valeur"] = 0},
	[17] = {["libelle"] = "Cuivre" ,["valeur"] = 0},
	[18] = {["libelle"] = "Fer" ,["valeur"] = 0},
	[19] = {["libelle"] = "Diamant" ,["valeur"] = 0},
	[20] = {["libelle"] = "Cuivre traité" ,["valeur"] = 0},
	[21] = {["libelle"] = "Fer traité" ,["valeur"] = 0},
	[22] = {["libelle"] = "Diamant traité" ,["valeur"] = 0},
	[23] = {["libelle"] = "Roche" ,["valeur"] = 0},
	[24] = {["libelle"] = "Roche traité" ,["valeur"] = 0},
	[25] = {["libelle"] = "Poisson" ,["valeur"] = 0},
	[26] = {["libelle"] = "Corps" ,["valeur"] = 0},
	[27] = {["libelle"] = "Corps traité" ,["valeur"] = 0}
  ]]--
}

RegisterServerEvent('jobs:getBoursePrice')
AddEventHandler('jobs:getBoursePrice', function(libelle)
local playerSource = source
print(libelle)
  MySQL.Async.fetchAll("SELECT prix FROM bourse WHERE item = @item", {['@item'] = tostring(libelle)}, function (result)
    TriggerClientEvent("jobs:getBoursePrice_c", playerSource, result[1].prix)
  end)
end)

RegisterServerEvent('jobs:changeBoursePrice')
AddEventHandler('jobs:changeBoursePrice', function(libelle)
local playerSource = source
print(libelle)
   local randomChange = 0
   MySQL.Async.fetchAll("SELECT * FROM bourse", {}, function (result)
   for i, v in ipairs(result) do
	randomChange = math.random(1, 4)
	randomChange = randomChange/100
     if tostring(v.item) ~= tostring(libelle) then
        if v.prix <= v.base*2 then
          MySQL.Async.execute("UPDATE bourse SET `prix` = @prix WHERE item = @item", {['@item'] = tostring(v.item), ['@prix'] = v.prix+randomChange})
          MySQL.Async.execute("UPDATE bourse SET changement = @changement WHERE item = @item", {['@item'] = tostring(v.item), ['@changement'] = v.changement+randomChange})
        end
     elseif tostring(v.item) == tostring(libelle) then
      if v.prix >= v.base/4 then
        MySQL.Async.execute("UPDATE bourse SET `prix` = @prix WHERE item = @item", {['@item'] = tostring(v.item), ['@prix'] = v.prix-0.07})
          MySQL.Async.execute("UPDATE bourse SET changement = @changement WHERE item = @item", {['@item'] = tostring(v.item), ['@changement'] = v.changement-0.07})
      end
     end
   end
   end)
end)

RegisterServerEvent('job:success')
AddEventHandler('job:success', function(amount)
    local playerSource = source

    -- Get the players money amount
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local total = math.random(25, 80);
            -- update player money amount
            LaLife.Player.Manager.AddPlayerMoney(user, total + tonumber(math.floor(amount/5)) + 0.0)
        else
            TriggerEvent("es:desyncMsg", 'job:success')
        end
    end)
end)

RegisterServerEvent('job:removeMoney')
AddEventHandler('job:removeMoney', function(amount)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local rounded = round(math.abs(tonumber(amount)), 0)
            LaLife.Player.Manager.RemovePlayerMoney(user, rounded)
        else
            TriggerEvent("es:desyncMsg", 'job:removeMoney')
        end
    end)
end)

RegisterServerEvent('job:addMoney')
AddEventHandler('job:addMoney', function(amount)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local rounded = round(math.abs(tonumber(amount)), 0)
            LaLife.Player.Manager.AddPlayerMoney(user, rounded)
        else
            TriggerEvent("es:desyncMsg", 'job:addMoney')
        end
    end)
end)

RegisterServerEvent("job:getCash_s")
AddEventHandler("job:getCash_s", function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local argent = user.money
            TriggerClientEvent("job:f_getCash", playerSource, argent)
        else
            TriggerEvent("es:desyncMsg", "job:getCash_s")
        end
    end)
end)

RegisterServerEvent('job:GetIdentifier')
AddEventHandler('job:GetIdentifier', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plate = string.upper("JOBS" .. string.sub(user.identifier, -4))

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                jobVehicle = plate,
            }, function ()
                TriggerClientEvent("job:f_GetIdentifier", playerSource, plate)
            end)
        else
            TriggerEvent("es:desyncMsg", 'job:GetIdentifier')
        end
    end)
end)

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.abs(math.floor(num * mult + 0.5) / mult)
end

RegisterServerEvent('jobsmayor:vehtoGarage')
AddEventHandler('jobsmayor:vehtoGarage', function()
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    if (user) then
      local player = user.identifier
      local L = #player - 4
      local L1 = #player - 3
      local L2 = #player - 2
      local L3 = #player - 1
      local plateveh = "GOUV" .. player[L] .. player[L1] .. player[L2] .. player[L3]
      plateveh = string.upper(plateveh)
      user:setVehicle(0)
      TriggerClientEvent("jobsmayor:DespawnVehicle", playerSource, plateveh)
      TriggerEvent('vmenu:updateUser', 98)
    else
      TriggerEvent("es:desyncMsg")
    end
  end)
end)

RegisterServerEvent('jobsmayor:vehGarage')
AddEventHandler('jobsmayor:vehGarage', function(vehicule)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("GOUV" .. string.sub(user.identifier, -4))

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plateveh,
            }, function ()

                TriggerClientEvent("jobsmayor:SpawnVehicle", playerSource, vehicule, plateveh, true)
                TriggerEvent('vmenu:updateUserFromId', playerSource, 98)
            end)
        else
            TriggerEvent("es:desyncMsg", 'jobsmayor:vehGarage')
        end
    end)
end)

RegisterServerEvent('jobsmayor:vehHelicoGarage')
AddEventHandler('jobsmayor:vehHelicoGarage', function(vehicule)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("GOUV" .. string.sub(user.identifier, -4))

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plateveh,
            }, function ()
              TriggerClientEvent("jobsmayor:SpawnVehicle", playerSource, vehicule, plateveh, false)
            end)
        else
            TriggerEvent("es:desyncMsg", 'jobsmayor:vehHelicoGarage')
        end
    end)
end)

local ParkingGouv = {
  [1] = false
}

RegisterServerEvent('jobsmayor:CheckParking')
AddEventHandler('jobsmayor:CheckParking', function()
local playerSource = source
  TriggerClientEvent("jobsmayor:f_CheckParking", playerSource, ParkingGouv)
end)

RegisterServerEvent('jobsmayor:SetParking')
AddEventHandler('jobsmayor:SetParking', function(param, bool)
  if param == 1 then
    ParkingGouv[1] = bool
  end
end)

RegisterServerEvent('jobsmayor:wepArmory')
AddEventHandler('jobsmayor:wepArmory', function(id)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    if (user) then
      local player = user.identifier
      TriggerClientEvent("itinerance:notif", playerSource, "~g~Voici votre arme.")
      TriggerClientEvent("jobsmayor:giveArmory", playerSource, id, nil)
    else
      TriggerEvent("es:desyncMsg")
    end
  end)
end)

RegisterServerEvent('taxi:pdg')
AddEventHandler('taxi:pdg', function(amount)
    local playerSource = source

    -- Get the players money amount
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
          print(user.identifier)
            if (user.identifier == "steam:110000104cb2ae5" ) then
              LaLife.Player.Manager.SetPlayerJob(user, 18)
              TriggerClientEvent("citizenv:notify", playerSource, "CHAR_SIMEON", 1, "Stephane", false, "Vous êtes maintenant le pdg")
            else
              TriggerClientEvent("citizenv:notify", playerSource, "CHAR_SIMEON", 1, "Stephane", false, "Vous n'êtes pas le pdg")
            end
        end
    end)
end)

RegisterServerEvent('tow:pdg')
AddEventHandler('tow:pdg', function(amount)
    local playerSource = source

    -- Get the players money amount
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
          print(user.identifier)
            if (user.identifier == "steam:110000104cb2ae" ) then
              LaLife.Player.Manager.SetPlayerJob(user, 16)
              TriggerClientEvent("citizenv:notify", playerSource, "CHAR_SIMEON", 1, "Stephane", false, "Vous êtes maintenant le pdg")
            else
              TriggerClientEvent("citizenv:notify", playerSource, "CHAR_SIMEON", 1, "Stephane", false, "Vous n'êtes pas le pdg")
            end
        end
    end)
end)
