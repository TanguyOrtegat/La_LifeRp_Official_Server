

local CARS = {}
local maxCapacity = {
    [0] = { ["size"] = 20}, --Compact
    [1] = { ["size"] = 20}, --Sedan
    [2] = { ["size"] = 20}, --SUV
    [3] = { ["size"] = 20}, --Coupes
    [4] = { ["size"] = 20}, --Muscle
    [5] = { ["size"] = 20}, --Sports Classics
    [6] = { ["size"] = 20}, --Sports
    [7] = { ["size"] = 20}, --Super
    [8] = { ["size"] = 5}, --Motorcycles
    [9] = { ["size"] = 30}, --Off-road
    [10] = { ["size"] = 30}, --Industrial
    [11] = { ["size"] = 30}, --Utility
    [12] = { ["size"] = 30}, --Vans
    [13] = { ["size"] = 0}, --Cycles
    [14] = { ["size"] = 0}, --Boats
    [15] = { ["size"] = 0}, --Helicopters
    [16] = { ["size"] = 0}, --Planes
    [17] = { ["size"] = 0}, --Service
    [18] = { ["size"] = 0}, --Emergency
    [19] = { ["size"] = 0}, --Military
    [20] = { ["size"] = 60}, --Commercial
    [21] = { ["size"] = 0}, --Trains
}

--[[AddEventHandler('onMySQLReady', function ()
MySQL.Async.fetchAll("SELECT vehicle_plate AS plate, items.id AS id, items.libelle AS libelle, quantity FROM user_vehicle LEFT JOIN vehicle_inventory ON `user_vehicle`.`vehicle_plate` = `vehicle_inventory`.`plate` LEFT JOIN items ON `vehicle_inventory`.`item` = `items`.`id`", {},
    function (result)
    if (result) then
        for _, v in ipairs(result) do
            if (not IndexSearch(v.plate)) then
                CARS[v.plate] = {}
            end
            if (v.id and v.libelle and v.quantity) then
                table.insert(CARS[v.plate], v.id, {libelle = v.libelle, quantity = v.quantity})
            end
        end
    end
    end)
end)]]


RegisterServerEvent("playercar:getItems_s")
AddEventHandler("playercar:getItems_s", function()
	local source = source
    items = {}
    local player = getPlayerID(source)

    MySQL.Async.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = @username", {
      ['@username'] = player
    }, function (result)
      if (result) then
        for _, v in ipairs(result) do
        -- table.insert(items, tonumber(v.item_id), {libelle = v.libelle, quantity = v.quantity})
         t = {['libelle'] = v.libelle, ['quantity'] = v.quantity}
         	items[v.item_id] = t
        end
      end
      TriggerClientEvent("playercar:hoodContent", source, items)

  end)
end)

RegisterServerEvent("car:getItems")
AddEventHandler("car:getItems", function(plate)
    local res = nil
    if CARS[plate] then
        res = CARS[plate]
    end
    TriggerClientEvent("car:hoodContent", source, res)
end)

RegisterServerEvent("car:receiveItem")
AddEventHandler("car:receiveItem", function(vehclass, plate, item, lib, quantity)
    local ActualSlotUsed = getSlots(plate)
    local limitslots = ActualSlotUsed + quantity
    if (limitslots <= maxCapacity[vehclass].size) then
        if not IndexSearch(plate) then
            CARS[plate] = {}
        end
        add({ item, quantity, plate, lib })
        TriggerClientEvent("player:looseItem", source, item, quantity)
    else
        if quantity > maxCapacity[vehclass].size then
            TriggerClientEvent("car:systemMessage", source, "Ce véhicule ne peut contenir que " .. maxCapacity[vehclass].size .. " objets")
        elseif ActualSlotUsed >= maxCapacity[vehclass].size then
            TriggerClientEvent("car:systemMessage", source, "La voiture est pleine")
        elseif limitslots > maxCapacity[vehclass].size then
            TriggerClientEvent("car:systemMessage", source, "Il y a assez d'espace!")
        end
    end
end)

RegisterServerEvent("car:looseItem")
AddEventHandler("car:looseItem", function(plate, item, quantity)
    local cItem = CARS[plate][item]
    if (cItem.quantity >= quantity) then
        delete({ item, quantity, plate })
        TriggerClientEvent("player:receiveItem", source, item, quantity)
    end
end)
RegisterServerEvent('BuyForVeh')
AddEventHandler('BuyForVeh', function(name, vehicle, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
    CARS[plate] = {}
end)

function add(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local plate = arg[3]
    local lib = arg[4]
    local query
    local item
    if CARS[plate][itemId] then
        item = CARS[plate][itemId]
        --MySQL.Async.execute("UPDATE vehicle_inventory SET `quantity`=@qty WHERE plate = @plate",{['@qty'] = qty, ['@plate'] = plate}, function(data)
        --end)
        item.quantity = item.quantity + qty
    else
        print("met items")
        CARS[plate][itemId] = {quantity = qty, libelle = lib}
        item = CARS[plate][itemId]
        print(CARS[plate][itemId].libelle)
        print(qty)
        print(plate)
        print(itemId)
        --MySQL.Async.execute("INSERT INTO vehicle_inventory (`quantity`,`plate`,`item`) VALUES (@qty, @plate, @item)", {['@qty'] = qty, ['@plate'] = plate, ['@item'] = itemId})
    end
end

function delete(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local plate = arg[3]
    local item = CARS[plate][itemId]
    item.quantity = item.quantity - qty
    --MySQL.Async.execute("UPDATE vehicle_inventory SET `quantity`=@qty WHERE plate = @plate",{['@qty'] = item.quantity, ['@plate'] = plate}, function(data)
    --end)
end

function getSlots(plate)
    local pods = 0
    if (IndexSearch(plate)) then
        for _, v in pairs(CARS[plate]) do
            pods = pods + v.quantity
        end
    end
    return pods
end

-- get's the player id without having to use bugged essentials
function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function stringSplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end

function IndexSearch(plate)
    for key, value in pairs(CARS) do
        if (key == plate) then
            return true
        end
    end
    --print("vehicule immatriculé " .. plate .. " chargé")
    return false
end

-- get's the player id without having to use bugged essentials
function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end
