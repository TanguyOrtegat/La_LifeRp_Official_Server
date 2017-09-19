RegisterServerEvent("customs:check")
AddEventHandler("customs:check",function(title, data, cost, value)
	local source = tonumber(source)
    TriggerEvent('es:getPlayerFromId', source, function(user)
	    if (tonumber(user.money) >= tonumber(cost)) then
	    	LaLife.Player.Manager.RemovePlayerMoney(user,cost)
	    	TriggerClientEvent("customs:receive", source, title, data, value)
	    else
	    	TriggerClientEvent("pNotify:SendNotification", source, {text = "Insufficient funds!",type = "error",queue = "left",timeout = 2500,layout = "centerRight"})
	    end
	end)
end)

RegisterServerEvent("customs:check2")
AddEventHandler("customs:check2",function(title, data, cost, value, back)
	local source = tonumber(source)
    TriggerEvent('es:getPlayerFromId', source, function(user)
	    if (tonumber(user.money) >= tonumber(cost)) then
	    	LaLife.Player.Manager.RemovePlayerMoney(user,cost)
	    	TriggerClientEvent("customs:receive2", source, title, data, value, back)
	    else
	    	TriggerClientEvent("pNotify:SendNotification", source, {text = "Insufficient funds!",type = "error",queue = "left",timeout = 2500,layout = "centerRight"})
	    end
	end)
end)

RegisterServerEvent("customs:check3")
AddEventHandler("customs:check3",function(title, data, cost, mod, back, name, wtype)
	local source = tonumber(source)
    TriggerEvent('es:getPlayerFromId', source, function(user)
	    if (tonumber(user.money) >= tonumber(cost)) then
	    	LaLife.Player.Manager.RemovePlayerMoney(user,cost)
	    	TriggerClientEvent("customs:receive3", source, title, data, mod, back, name, wtype)
	    else
	    	TriggerClientEvent("pNotify:SendNotification", source, {text = "Insufficient funds!",type = "error",queue = "left",timeout = 2500,layout = "centerRight"})
	    end
	end)
end)

local tbl = {
[1] = {locked = false},
[2] = {locked = false},
[3] = {locked = false},
[4] = {locked = false},
[5] = {locked = false},
}

local ingarage = false
local currentgarage = nil
RegisterServerEvent('customs:lock')
AddEventHandler('customs:lock', function(b,garage)
	ingarage = b
	currentgarage = garage
	tbl[tonumber(garage)].locked = b
	TriggerClientEvent('customs:lock',-1,tbl)
	--print("LS Customs status: "..json.encode(tbl))
end)
RegisterServerEvent('customs:getgarageinfos')
AddEventHandler('customs:getgarageinfos', function()
TriggerClientEvent('customs:lock',-1,tbl)
--print("LS Customs status: "..json.encode(tbl))
end)

AddEventHandler('playerDropped', function()
	if ingarage == true then
		tbl[tonumber(currentgarage)].locked = false
		TriggerClientEvent('customs:lock',-1,tbl)
		--print("LS Customs status: "..json.encode(tbl))
	end
end)
