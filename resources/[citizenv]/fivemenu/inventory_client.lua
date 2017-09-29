ITEMS = {}

local MoneyOk = false
local giveItemConfirmed = false

function DrawNotif(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function delete(arg)
	local itemId = tonumber(arg[1])
	local qty = arg[2]
	local item = ITEMS[itemId]
	if item.quantity - qty < 0 then
		item.quantity = 0
	else
		item.quantity = item.quantity - qty
	end
	TriggerServerEvent("inventory:updateQuantity_sf", item.quantity, itemId)
	--TriggerServerEvent("inventory:getItems_s")
end

function add(arg)
	if #arg == 4 then
		local itemId = tonumber(arg[1])
		local qty = arg[2]
		local price = arg[3]
		local name = arg[4]
		local item = ITEMS[itemId]
		item.quantity = item.quantity + qty
		TriggerServerEvent("inventory:updateQuantity_s", item.quantity, itemId, price, name)
	else
		local itemId = tonumber(arg[1])
		local qty = arg[2]
		local item = ITEMS[itemId]
		item.quantity = item.quantity + qty
		TriggerServerEvent("inventory:updateQuantity_sf", item.quantity, itemId)
	end
end

----------- EVENT FROM MENU TARGET TARGET!!!

AddEventHandler("inventory:buy", function(target, qty, id, price, name) -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
	local price = price * qty
	TriggerServerEvent("inventory:checkMoney", price)
	Wait(200)
	if MoneyOk then
		add({id, qty, price, name })
		MoneyOk = false
	end
end)

AddEventHandler("inventory:sell", function(target, qty, id, price, name) -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
	delete({id, qty})
	TriggerServerEvent("inventory:addMoney", price, 1)
end)

AddEventHandler("inventory:menuItem", function(target, id, name, quantity)
	if handCuffed == false then
	  VMenu.item_menu = true
	  menuitem.id = id
	  menuitem.name = tostring(name)
	  menuitem.quantity = tonumber(quantity)
	  VMenu.ResetMenu(98, "", "default")
	  Wait(100)
	  VMenu.AddFunc(98, "Retour", "vmenu:MainMenuOG", {}, "Retour")
	  VMenu.AddNum(98, "Quantité", "itemQty", 1, tonumber(menuitem.quantity), "Quantité à donner/jeter")
	  VMenu.AddFunc(98, "Utiliser", "inventory:useItem", {menuitem.id}, lang.common.access)
	  VMenu.AddFunc(98, "Donner", "inventory:giveItem", {menuitem.id, tostring(menuitem.name), getOpt("itemQty"), tonumber(ITEMS[menuitem.id].quantity)}, lang.common.access)
	  VMenu.AddFunc(98, "~r~Jeter", "inventory:dropItem", {menuitem.id, tostring(menuitem.name), getOpt("itemQty"), tonumber(ITEMS[menuitem.id].quantity)}, lang.common.access)
	 else
	  TriggerEvent("itinerance:notif", "~r~Vous ne pouvez pas utiliser d'objets en étant menotté.")
	 end
end)

AddEventHandler("inventory:useItem", function(target, id) -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
	local useItem = {}
	local value = 0
	for _, val in ipairs(inv_array) do
		if id == val.id then
			value = val.value
			useItem = val
		end
	end
	delete({id, 1})
	if id == 1 or id == 37 then
		if IsInVehicle() then
			TriggerEvent("food:vdrink", value)
		else
			TriggerEvent("food:drink", useItem)
		end
	elseif id == 2 or id == 3 or id == 36 or id == 42 or id == 43 then
		if IsInVehicle() then
			TriggerEvent("food:veat", value)
		else
			TriggerEvent("food:eat", useItem)
		end
	else
	 TriggerEvent("itinerance:notif", "~r~Vous ne pouvez pas utiliser cet objet.")
	end
	TriggerEvent("vmenu:MainMenuOG", source)
end)

--------    EVENT POUR LE GATHER DES RESSOURCES ILLÉGALES SANS PRICE

RegisterNetEvent("inventory:getQuantityJob")
AddEventHandler("inventory:getQuantityJob", function()
	TriggerEvent("poleemploi:getQuantityJob", ITEMS)
end)


RegisterNetEvent("inventory:getQuantityDrugs")
AddEventHandler("inventory:getQuantityDrugs", function()
	TriggerEvent("poleemploi:getQuantityDrugs", ITEMS)
end)

function getQuantity(itemId)
	return ITEMS[tonumber(itemId)].quantity
end

AddEventHandler("player:receiveItem", function(item, quantity)
  item = tonumber(item)
  local qty = ITEMS[tonumber(item)].quantity + quantity
  	if (ITEMS[tonumber(item)].quantity <= 60) then
	add({item, quantity})
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas assez d'espace" )
	end
end)

RegisterNetEvent("inventory:refresh")
AddEventHandler("inventory:refresh", function()
	Citizen.Wait(100)
	TriggerEvent("vmenu:MainMenuOG", source)
	getMainMenu()
end)

AddEventHandler("inventory:dropItem", function(target, id, name, quantity, quantity_check)
  if quantity_check >= quantity then
  	TriggerEvent("player:looseItem", id, quantity)
  	TriggerEvent("itinerance:notif", "Vous avez jeté~r~ " ..quantity.. " " ..name.. "~w~.")
	Citizen.Wait(100)
	TriggerEvent("vmenu:MainMenuOG", source)
	getMainMenu()

  else
    TriggerEvent("itinerance:notif", "~r~Une erreur s'est produite.")
  end
end)

RegisterNetEvent("player:looseItem")
AddEventHandler("player:looseItem", function(item, quantity)
  item = tonumber(item)
	delete({ item, quantity})
end)

AddEventHandler("player:sellItem", function(item, price)
	item = tonumber(item)
	delete({item, 1})
	TriggerServerEvent("inventory:addMoney", price, 2)
end)

AddEventHandler("item:reset", function()
	ITEMS = {}
	TriggerServerEvent("inventory:reset_s")
end)

RegisterNetEvent("inventory:giveItem_f")
AddEventHandler("inventory:giveItem_f", function(item, quantity)
	TriggerEvent("player:receiveItem", item, quantity)
end)

--------- EVENT FROM SERVER NO TARGET

AddEventHandler("playerSpawned", function()
	Citizen.CreateThread(function()
		Wait(500)
		TriggerServerEvent('vmenu:lastChar')
		TriggerServerEvent("inventory:getItems_s")
		TriggerServerEvent('vmenu:updateUser', 98)
		TriggerServerEvent("poleemploi:getjobs")
		Wait(2500)
	end)
end)

RegisterNetEvent("inventory:getItems")
AddEventHandler("inventory:getItems", function(p_items) -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
	ITEMS = {}
	ITEMS = p_items
end)

RegisterNetEvent("inventory:MoneyOk")
AddEventHandler("inventory:MoneyOk", function(param) -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
	MoneyOk = param
end)

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end
