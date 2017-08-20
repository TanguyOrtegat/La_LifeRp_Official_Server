function idPolice(user)
    return user.police
end

function namePolice(player, user)
    local idPolice = idPolice(user)

    return MySQL.Sync.fetchScalar("SELECT police_name FROM police WHERE police_id = @respolice", {['@respolice'] = idPolice})
end

function isService(user)
    return user.enService == 1
end

RegisterServerEvent('jobspolice:updateService')
AddEventHandler('jobspolice:updateService', function(id)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                enService = id,
            }, function ()
                TriggerServerEvent('vmenu:updateUserFromId', playerSource, 5)
            end)
        else
            TriggerEvent("es:desyncMsg", 'jobspolice:updateService')
        end
    end)
end)

RegisterServerEvent('jobspolice:jobs')
AddEventHandler('jobspolice:jobs', function(id, civil)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local namePolice = namePolice(player, user) --SELECT
            local id_police = idPolice(user) --Donne le ID de la police du joueur pour lui donne les armes et le skin aproprier
            if namePolice == "Rien" then
                TriggerClientEvent("citizenv:notify", playerSource, "CHAR_ANDREAS", 1, "Commissariat", false, "Vous devez être policier")
            else
                --updatejob(player, id) --UPDATE
                user.enService = id
                TriggerEvent('LaLife:Player:Save', {
                    identifier = user.identifier,
                    enService = id,
                }, function ()
                    if isService(user) then
                        TriggerClientEvent("citizenv:notify", playerSource, "CHAR_ANDREAS", 1, "Commissariat", false, "Vous êtes en service en tant que : ".. namePolice)
                        TriggerClientEvent("ShowBlipsPolice", playerSource)
                        if not civil then
                            ArmeSelonGrade(id_police, playerSource)
                        end
                    else
                        TriggerClientEvent("citizenv:notify", playerSource, "CHAR_ANDREAS", 1, "Commissariat", false, "Vous êtes maintenant hors service")
                        TriggerClientEvent("jobspolice:reloadSkin", playerSource)
                        TriggerClientEvent("RemoveBlipsPolice", playerSource)
                    end
                    TriggerEvent('vmenu:updateUserFromId', playerSource, 5)
                end)
            end
        else
            TriggerEvent("es:desyncMsg", 'jobspolice:jobs')
        end
    end)
end)

function ArmeSelonGrade(id_police, playerSource) --Donne certaine Arme en fonction du grade de la police PAS ENCORE TERMINER
    if id_police == 1 then
        TriggerClientEvent("jobspolice:giveWeapon", playerSource, "WEAPON_STUNGUN", nil)
        TriggerClientEvent("jobspolice:cadet", playerSource , nil)
    elseif id_police == 2 then
        TriggerClientEvent("jobspolice:giveWeapon", playerSource, "WEAPON_STUNGUN", nil)
        TriggerClientEvent("jobspolice:officier", playerSource, nil)
    elseif id_police == 3 then
        TriggerClientEvent("jobspolice:giveWeapon", playerSource, "WEAPON_STUNGUN", nil)
        TriggerClientEvent("jobspolice:sergent", playerSource , nil)
    elseif id_police == 4 then
        TriggerClientEvent("jobspolice:giveWeapon", playerSource, "WEAPON_STUNGUN", nil)
        --TriggerClientEvent("jobspolice:changeSkin", source, "S_M_Y_Cop_01", nil)
        TriggerClientEvent("jobspolice:lieutenant", playerSource , nil)
    elseif id_police == 5 then
        TriggerClientEvent("jobspolice:giveWeapon", playerSource, "WEAPON_STUNGUN", nil)
        TriggerClientEvent("jobspolice:capitaine", playerSource , nil)
    elseif id_police >= 6 then
        TriggerClientEvent("jobspolice:giveWeapon", playerSource, "WEAPON_STUNGUN", nil)
        --TriggerClientEvent("jobspolice:changeSkin", source, "mp_m_freemode_01", nil)
        TriggerClientEvent("jobspolice:commandant", playerSource , nil)
    end
end

function RetirerArme() --Retire toutes les arme du joueur PAS ENCORE TERMINER
end

RegisterServerEvent('jobspolice:wepArmory')
AddEventHandler('jobspolice:wepArmory', function(id)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local namePolice = namePolice(player, user) --SELECT
            if namePolice == "Rien" then
                TriggerClientEvent("citizenv:notify", playerSource, "CHAR_ANDREAS", 1, "Commissariat", false, "Vous devez être policier")
            else
                if isService(user) then
                    TriggerClientEvent("jobspolice:notif", playerSource, "~g~Voici votre arme")
                    TriggerClientEvent("jobspolice:giveArmory", playerSource, id, nil)
                else
                    TriggerClientEvent("jobspolice:notif", playerSource, "~r~Vous n'êtes pas en service")
                end
            end
        else
            TriggerEvent("es:desyncMsg", 'jobspolice:wepArmory')
        end
    end)
end)

RegisterServerEvent('jobspolice:vehtoGarage')
AddEventHandler('jobspolice:vehtoGarage', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("LSPD" .. string.sub(user.identifier, -4))

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = 0,
            }, function ()
                TriggerClientEvent("jobspolice:DespawnVehicle", playerSource, plateveh)
                TriggerEvent('vmenu:updateUserFromId', playerSource, 98)
            end)
        else
            TriggerEvent("es:desyncMsg", 'jobspolice:vehtoGarage')
        end
    end)
end)

RegisterServerEvent('jobspolice:vehGarage')
AddEventHandler('jobspolice:vehGarage', function(vehicule)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("LSPD" .. string.sub(user.identifier, -4))

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plateveh,
            }, function ()
                local name_police = namePolice(player, user)
                if name_police ~= "Rien" then
                    if isService(user) then
                        TriggerClientEvent("jobspolice:SpawnVehicle", playerSource, vehicule, plateveh, true)
                    else
                        TriggerClientEvent("jobspolice:notif", playerSource, "~r~Vous n'êtes pas en service")
                    end
                else
                    TriggerClientEvent("citizenv:notify", playerSource, "CHAR_ANDREAS", 1, "Commissariat", false, "Vous devez être policier")
                end
                TriggerEvent('vmenu:updateUserFromId', playerSource, 98)
            end)
        else
            TriggerEvent("es:desyncMsg", 'jobspolice:vehGarage')
        end
    end)
end)

RegisterServerEvent('jobspolice:vehBateauGarage')
AddEventHandler('jobspolice:vehBateauGarage', function(vehicule)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', playerSource, function(user)
    if (user) then
      local plateveh = string.upper("LSPD" .. string.sub(user.identifier, -4))
      TriggerEvent('LaLife:Player:Save', {
        identifier = user.identifier,
        vehicle = plateveh,
      }, function ()
      if isService(user) then
        TriggerClientEvent("jobspolice:SpawnVehicle", playerSource, vehicule, plateveh, false)
      else
        TriggerClientEvent("jobspolice:notif", playerSource, "~r~Vous n'êtes pas en service !")
      end
      end)
    else
      TriggerEvent("es:desyncMsg")
    end
  end)
end)

RegisterServerEvent('jobspolice:vehHelicoGarage')
AddEventHandler('jobspolice:vehHelicoGarage', function(vehicule)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plateveh = string.upper("LSPD" .. string.sub(user.identifier, -4))

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plateveh,
            }, function ()
                if isService(user) then
                    TriggerClientEvent("jobspolice:SpawnVehicle", playerSource, vehicule, plateveh, false)
                else
                    TriggerClientEvent("jobspolice:notif", playerSource, "~r~Vous n'êtes pas en service")
                end
            end)
        else
            TriggerEvent("es:desyncMsg", 'jobspolice:vehHelicoGarage')
        end
    end)
end)

local ParkingPolice = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false
}

RegisterServerEvent('jobspolice:CheckParking')
AddEventHandler('jobspolice:CheckParking', function()
    TriggerClientEvent("jobspolice:f_CheckParking", source, ParkingPolice)
end)

RegisterServerEvent('jobspolice:SetParking')
AddEventHandler('jobspolice:SetParking', function(param, bool)
    if param == 1 then
        ParkingPolice[1] = bool
    elseif param == 2 then
        ParkingPolice[2] = bool
    elseif param == 3 then
        ParkingPolice[3] = bool
    elseif param == 4 then
        ParkingPolice[4] = bool
    end
end)

-- function stringsplit(self, delimiter)
--   local a = self:Split(delimiter)
--   local t = {}
--
--   for i = 0, #a - 1 do
--      table.insert(t, a[i])
--   end
--
--   return t
-- end
