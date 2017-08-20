local weed = 60
local meth = 60
local coke = 60
local police = 0

RegisterServerEvent('drugs:getBoursePrice')
AddEventHandler('drugs:getBoursePrice', function(libelle)
local playerSource = source
  MySQL.Async.fetchAll("SELECT prix FROM bourse WHERE item = @item", {['@item'] = tostring(libelle)}, function (result)
    TriggerClientEvent("drugs:getBoursePrice_c", playerSource, result[1].prix)
  end)
end)

RegisterServerEvent('drugs:changeBoursePrice')
AddEventHandler('drugs:changeBoursePrice', function(libelle)
local playerSource = source
   local randomChange = math.random(1, 4)
   randomChange = randomChange/100
   MySQL.Async.fetchAll("SELECT * FROM bourse", {}, function (result) 
   for i, v in ipairs(result) do
     if tostring(v.item) ~= tostring(libelle) then
        if v.prix <= v.base*2 then
          MySQL.Async.execute("UPDATE bourse SET prix = @prix WHERE item = @item", {['@item'] = tostring(v.item), ['@prix'] = v.prix+randomChange})
          MySQL.Async.execute("UPDATE bourse SET changement = @changement WHERE item = @item", {['@item'] = tostring(v.item), ['@changement'] = v.changement+randomChange})
        end
     elseif tostring(v.item) == tostring(libelle) then
      if v.prix >= v.base/4 then
        MySQL.Async.execute("UPDATE bourse SET prix = @prix WHERE item = @item", {['@item'] = tostring(v.item), ['@prix'] = v.prix-0.07})
          MySQL.Async.execute("UPDATE bourse SET changement = @changement WHERE item = @item", {['@item'] = tostring(v.item), ['@changement'] = v.changement-0.07})
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
    SetTimeout(60000, function()
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

