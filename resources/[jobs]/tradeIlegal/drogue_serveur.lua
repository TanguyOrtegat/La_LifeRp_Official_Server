local weed = 60
local meth = 60
local coke = 60
local police = 0
local propsweed = {
    "weed_upgrade_equip",
    "light_growtha_stage23_upgrade",
    "light_growthb_stage23_upgrade",
    "light_growthc_stage23_upgrade",
    "light_growthd_stage23_upgrade",
    "light_growthe_stage23_upgrade",
    "light_growthf_stage23_upgrade",
    "light_growthg_stage23_upgrade",
    "light_growthh_stage23_upgrade",
    "light_growthi_stage23_upgrade",
    "weed_security_upgrade",
    "weed_chairs",
    "weed_hosea",
    "weed_hoseb",
    "weed_hosec",
    "weed_hosed",
    "weed_hosee",
    "weed_hosef",
    "weed_hoseg",
    "weed_hoseh",
    "weed_hosei",
    "weed_growtha_stage3",
    "weed_growthb_stage3",
    "weed_growthc_stage3",
    "weed_growthd_stage3",
    "weed_growthe_stage3",
    "weed_growthf_stage3",
    "weed_growthg_stage3",
    "weed_growthh_stage3",
    "weed_growthi_stage3",
    "weed_set_up",
    "weed_drying",
    "weed_production",
    "interior_upgrade",
    "security_high",
    "equipment_upgrade",
    "set_up",
    "production",
    "clutter",
    "counterfeit_cashpile20d",
}
local propscoke = {
    "coke_press_upgrade",
    "coke_cut_05",
    "coke_cut_04",
    "coke_cut_03",
    "coke_cut_02",
    "coke_cut_01",
    "basic",
    "table_equipment",
    "table_equipment_upgrade",
    "production_basic",
    "production_upgrade",
    "coke_cut_coccutter",
    "coke_cut_powderedmilk",
    "coke_cut_creditcard",
    "coke_cut_scoop",
    "equipment_upgrade",
    "security_high",
    "special_chairs",
}
local propsmeth = {
    "meth_lab_upgrade",
    "meth_lab_setup",
    "meth_lab_production",
    "meth_lab_security_high",
}

RegisterServerEvent('drugs:getBoursePrice')
AddEventHandler('drugs:getBoursePrice', function(libelle)
local playerSource = source
  MySQL.Async.fetchAll("SELECT prix FROM bourse WHERE item = @item", {['@item'] = tonumber(libelle)}, function (result)
    TriggerClientEvent("drugs:getBoursePrice_c", playerSource, result[1].prix)
  end)
end)

RegisterServerEvent('drugs:changeBoursePrice')
AddEventHandler('drugs:changeBoursePrice', function(libelle)
local playerSource = source
   local randomChange = math.random(4, 8)
   randomChange = randomChange/100
   MySQL.Async.fetchAll("SELECT * FROM bourse", {}, function (result)
   for i, v in ipairs(result) do
     if tonumber(v.item) ~= tonumber(libelle) then
        if v.prix <= v.base*2 then
          MySQL.Async.execute("UPDATE bourse SET prix = @prix WHERE item = @item", {['@item'] = tonumber(v.item), ['@prix'] = v.prix+randomChange})
          MySQL.Async.execute("UPDATE bourse SET changement = @changement WHERE item = @item", {['@item'] = tonumber(v.item), ['@changement'] = v.changement+randomChange})
        end
     elseif tonumber(v.item) == tonumber(libelle) then
      if v.prix >= v.base/4 then
        MySQL.Async.execute("UPDATE bourse SET prix = @prix WHERE item = @item", {['@item'] = tonumber(v.item), ['@prix'] = v.prix-(2/10)})
          MySQL.Async.execute("UPDATE bourse SET changement = @changement WHERE item = @item", {['@item'] = tonumber(v.item), ['@changement'] = v.changement-(2/10)})
      end
     end
   end
   end)
end)

RegisterServerEvent('drogue:getcoke')
AddEventHandler('drogue:getcoke', function()
    TriggerClientEvent('f_drogue:getcoke',source,coke)
end)

RegisterServerEvent('drogue:getmeth')
AddEventHandler('drogue:getmeth', function()
    TriggerClientEvent('f_drogue:getmeth',source,meth)
end)

RegisterServerEvent('drogue:getweed')
AddEventHandler('drogue:getweed', function()
    TriggerClientEvent('f_drogue:getweed',source,weed)
end)

RegisterServerEvent('drogue:remcoke')
AddEventHandler('drogue:remcoke', function()
    coke = coke - 1
end)

RegisterServerEvent('drogue:remmeth')
AddEventHandler('drogue:remmeth', function()
    meth = meth - 1
end)

RegisterServerEvent('drogue:remweed')
AddEventHandler('drogue:remweed', function()
    weed = weed - 1
end)

local function AddDrogue()
    if police == 0 then
        if weed < 60 then
            weed = weed + 1
        end
        if meth < 60 then
            meth = meth + 1
        end
        if coke < 60 then
            coke = coke + 1
        end
    else
        if weed < 60 then
            weed = weed + tonumber(police)
        end
        if meth < 60 then
            meth = meth + tonumber(police)
        end
        if coke < 60 then
            coke = coke + tonumber(police)
        end
    end
end

local function GetPolice()
    SetTimeout(120000, function()
        police = 0
        TriggerEvent("LaLife.Player.Manager.GetConnectedPlayers", function(users)
            if(users ~= nil) then
                for k,v in pairs(users)do
                    if v.enService == 1 then
                        police = police + 1
                    end
                end

                AddDrogue()
            end
        end)

        GetPolice()
    end)
end

GetPolice()

RegisterServerEvent('trade:requestweed')
AddEventHandler('trade:requestweed', function()
    TriggerClientEvent('trade:f_requestweed',source,propsweed)
end)

RegisterServerEvent('trade:requestcoke')
AddEventHandler('trade:requestcoke', function()
    TriggerClientEvent('trade:f_requestcoke',source,propscoke)
end)

RegisterServerEvent('trade:requestmeth')
AddEventHandler('trade:requestmeth', function()
    TriggerClientEvent('trade:f_requestmeth',source,propsmeth)
end)
