local coke = {
  [1] = {["name"] = "Champs de coke",["x"] = 1990.6990966797, ["y"] = 4831.1215820313, ["z"] = 43.735900878906, ["cost"] = 30000},
  [2] = {["name"] = "Traitement de coke #1",["x"] = 1268.0032958984 , ["y"] = -1710.7111816406 , ["z"] = 54.771495819092 , ["cost"] = 50000},
  [3] = {["name"] = "Traitement de coke #2",["x"] = 92.365592956543 , ["y"] = 3755.4782714844 , ["z"] = 40.774532318115 , ["cost"] = 50000},
  [4] = {["name"] = "Vente de coke #1",["x"] = -760.41857910156 , ["y"] = -1333.1286621094 , ["z"] = 9.5999927520752 , ["cost"] = 30000},
 -- [5] = {["name"] = "Vente de coke #2",["x"] = 448.2629699707 , ["y"] = -176.4065246582 , ["z"] = 71.254043579102 , ["cost"] = 30000}
}

local meth = {
  [1] = {["name"] = "Champs de meth",["x"] = 3642.4509277344 , ["y"] = 3744.5773925781 , ["z"] = 28.515714645386 , ["cost"] = 50000},
  [2] = {["name"] = "Traitement de meth #1",["x"] = 1390.51037597656 , ["y"] = 3609.09399414063 , ["z"] = 38.9419288635254 , ["cost"] = 25000},
  [3] = {["name"] = "Traitement de meth #2",["x"] = 1389.52404785156 , ["y"] = 3604.15209960938 , ["z"] = 38.9419288635254 , ["cost"] = 25000},
  [4] = {["name"] = "Traitement de meth #3",["x"] = 1394.45300292969 , ["y"] = 3601.97973632813 , ["z"] = 38.94189453125 , ["cost"] = 25000},
  [5] = {["name"] = "Vente de meth",["x"] = -2638.1674804688 , ["y"] = 1868.6248779297 , ["z"] = 160.13459777832 , ["cost"] = 50000}
}

local organe = {
    [1] = {["name"] = "Récolte d'organes",["x"] = 259.013244628906 , ["y"] = -1345.41711425781 , ["z"] = 24.537805557251 , ["cost"] = 10000},
    [2] = {["name"] = "Emballage d'organe",["x"] = 241.13232421875 , ["y"] = -1378.66235351563 , ["z"] = 40.5606536865234 , ["cost"] = 10000},
    [3] = {["name"] = "Identification d'organes",["x"] = 230.997146606445 , ["y"] = -1368.26647949219 , ["z"] = 39.7044486999512 , ["cost"] = 10000},
    [4] = {["name"] = "Vente d'organes",['x'] = 1220.4549560547, ['y'] = -1270.5201416016, ['z'] = 35.359477996826 , ["cost"] = 50000},
}

local weed = {
  [1] = {["name"] = "Champs de weed",["x"] = 1875.8841552734 , ["y"] = 5056.6772460938 , ["z"] = 51.513126373291 , ["cost"] = 10000},
  [2] = {["name"] = "Traitement de weed",["x"] = 83.502479553223 , ["y"] = 6650.2631835938 , ["z"] = 32.19792175293 , ["cost"] = 10000},
  [3] = {["name"] = "Vente de weed",["x"] = 2477.1474609375 , ["y"] = 3763.0439453125 , ["z"] = 41.8897171020508 , ["cost"] = 10000},
}
--asd
RegisterServerEvent("menudrogue:sendData_s")
AddEventHandler("menudrogue:sendData_s", function()
    TriggerClientEvent("menudrogue:f_sendData", source, coke, meth, organe, weed)
end)

RegisterServerEvent("menudrogue:getCash_s")
AddEventHandler("menudrogue:getCash_s", function()
  local playersource = source
  TriggerEvent('es:getPlayerFromId', playersource, function(user)
    if (user) then
      local lecashy = user.money
      TriggerClientEvent("menudrogue:f_getCash", playersource, lecashy)
    else
      TriggerEvent("es:desyncMsg", "menudrogue:getCash_s")
    end
  end)
end)

RegisterServerEvent("menudrogue:setCash")
AddEventHandler("menudrogue:setCash", function(amount)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    if (user) then
        LaLife.Player.Manager.RemovePlayerMoney(user, amount)
    else
      TriggerEvent("es:desyncMsg", "menudrogue:setCash")
    end
  end)
end)
