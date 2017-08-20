-------------------------------------------------
--  SCRIPT MADE BY MADRIAX FOR GTARPFRANCE     --
--		  https://discord.gg/fyytmPQ		   --
-------------------------------------------------

---------------------------
------CHOSE SQL MODE-------
---------------------------
--Async   -----------------
--MySQL   -----------------
--Couchdb ----------------- (soon)
---------------------------
local mode = "Async"

if (mode == "Async") then
  --require "resources/mysql-async/lib/MySQL"
elseif mode == "MySQL" then
  --require "resources/[essential]/essentialmode/lib/MySQL" IF YOU'RE USING LALIFE SCRIPT !
  --require "resources/essentialmode/lib/MySQL"

  --DO NOT FORGET TO CHANGE THE LINE BELLOW !!!
  MySQL:open("localhost", "gta5_gamemode_essential", "root", "Police911")
end


local lang = 'fr'
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


local isBuy = 0
local money = 0
local dirtymoney = 0

local items = {
  --[[
	[1] = {["libelle"] = "Bouteille d'eau" ,["valeur"] = 0, ["item_id"] = 1},
	[2] = {["libelle"] = "Sandwich" ,["valeur"] = 0, ["item_id"] = 2},
	[3] = {["libelle"] = "Filet Mignon" ,["valeur"] = 0, ["item_id"] = 3},
	[4] = {["libelle"] = "Cannabis" ,["valeur"] = 0, ["item_id"] = 4},
	[5] = {["libelle"] = "Cannabis roulé" ,["valeur"] = 0, ["item_id"] = 5},
	[6] = {["libelle"] = "Feuille de cocaïne" ,["valeur"] = 0, ["item_id"] = 6},
	[7] = {["libelle"] = "Feuille de cocaïne 50" ,["valeur"] = 0, ["item_id"] = 7},
	[8] = {["libelle"] = "Cocaïne" ,["valeur"] = 0, ["item_id"] = 8},
	[9] = {["libelle"] = "Éphédrine" ,["valeur"] = 0, ["item_id"] = 9},
	[10] = {["libelle"] = "Éphédrine 33" ,["valeur"] = 0, ["item_id"] = 10},
	[11] = {["libelle"] = "Éphédrine 66" ,["valeur"] = 0, ["item_id"] = 11},
	[12] = {["libelle"] = "Meth" ,["valeur"] = 0, ["item_id"] = 12},
	[13] = {["libelle"] = "Organe" ,["valeur"] = 0, ["item_id"] = 13},
	[14] = {["libelle"] = "Organe emballé" ,["valeur"] = 0, ["item_id"] = 14},
	[15] = {["libelle"] = "Organe analysé" ,["valeur"] = 0, ["item_id"] = 15},
	[16] = {["libelle"] = "Organe livrable" ,["valeur"] = 0, ["item_id"] = 16},
	[17] = {["libelle"] = "Cuivre" ,["valeur"] = 0, ["item_id"] = 17},
	[18] = {["libelle"] = "Fer" ,["valeur"] = 0, ["item_id"] = 18},
	[19] = {["libelle"] = "Diamant" ,["valeur"] = 0, ["item_id"] = 19},
	[20] = {["libelle"] = "Cuivre traité" ,["valeur"] = 0, ["item_id"] = 20},
	[21] = {["libelle"] = "Fer traité" ,["valeur"] = 0, ["item_id"] = 21},
	[22] = {["libelle"] = "Diamant traité" ,["valeur"] = 0, ["item_id"] = 22},
	[23] = {["libelle"] = "Roche" ,["valeur"] = 0, ["item_id"] = 23},
	[24] = {["libelle"] = "Roche traité" ,["valeur"] = 0, ["item_id"] = 24},
	[25] = {["libelle"] = "Poisson" ,["valeur"] = 0, ["item_id"] = 25},
	[26] = {["libelle"] = "Corps" ,["valeur"] = 0, ["item_id"] = 26},
	[27] = {["libelle"] = "Corps traité" ,["valeur"] = 0, ["item_id"] = 27},
  [28] = {["libelle"] = "Corps traité" ,["valeur"] = 0, ["item_id"] = 28}
  ]]--
}
RegisterServerEvent("apart:getAppart")
AddEventHandler('apart:getAppart', function(name)
print(name)
local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
        if (result) then
          count = 0
          for _ in pairs(result) do
            count = count + 1
          end
          if count > 0 then
		  local iden = result[1].identifier
          	if (iden == player) then
          		TriggerClientEvent('apart:isMine', playersource)
          	else
              	TriggerClientEvent('apart:isBuy', playersource)
          	end
          else
          	TriggerClientEvent('apart:isNotBuy', playersource)
          end
        end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)})
      local result = MySQL:getResults(executed_query, {'identifier'})
      if (result) then
        count = 0
        for _ in pairs(result) do
          count = count +1
        end
        if count > 0 then
          if (result[1].identifier == player) then
            TriggerClientEvent('apart:isMine', source)
          else
            TriggerClientEvent('apart:isBuy', source)
          end
        else
          TriggerClientEvent('apart:isNotBuy', source)
        end
      end
    end
  end)
end)

RegisterServerEvent("apart:getCash")
AddEventHandler('apart:getCash', function(name)
local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
        if (result[1]) then
          money = result[1].money
          dirtymoney = result[1].dirtymoney
          TriggerClientEvent('apart:getCash', playersource, money, dirtymoney)
        end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)})
      local result = MySQL:getResults(executed_query, {'identifier'})
      if (result) then
        money = result[1].money
        dirtymoney = result[1].dirtymoney
        TriggerClientEvent('apart:getCash', playersource, money, dirtymoney)
      end
    end
  end)
end)

RegisterServerEvent("apart:depositcash")
AddEventHandler('apart:depositcash', function(cash, apart)
local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local money = 0
    if (tonumber(user.money) >= tonumber(cash) and tonumber(cash) > 0) then
      if mode == "Async" then
        MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
            if (result) then
              money = result[1].money
			  LaLife.Player.Manager.RemovePlayerMoney(user, cash)
              local newmoney = money + cash
              MySQL.Async.execute("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
            end
        end)
      elseif mode == "MySQL" then
        local executed_query = MySQL:executeQuery("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
        local result = MySQL:getResults(executed_query, {'money'})
        if (result) then
          money = result[1].money
          LaLife.Player.Manager.RemovePlayerMoney(user, cash)
          local newmoney = money + cash
          MySQL:executeQuery("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
        end
      end

      TriggerClientEvent('apart:getCash', playersource, money, dirtymoney)
    else
      -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --(FOR FREEROAM)
      TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --WITH LALIFE SCRIPTS
    end
  end)
end)

RegisterServerEvent("apart:depositdirtycash")
AddEventHandler('apart:depositdirtycash', function(cash, apart)
local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local money = 0
    if (tonumber(user.dirtymoney) >= tonumber(cash) and tonumber(cash) > 0) then
      if mode == "Async" then
        MySQL.Async.fetchAll("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
            if (result) then
              money = result[1].dirtymoney
              LaLife.Player.Manager.RemovePlayerDirtyMoney(user, cash)
              local newmoney = money + cash
              MySQL.Async.execute("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
            end
        end)
      elseif mode == "MySQL" then
        local executed_query = MySQL:executeQuery("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
        local result = MySQL:getResults(executed_query, {'dirtymoney'})
        if (result) then
          money = result[1].dirtymoney
          LaLife.Player.Manager.RemovePlayerDirtyMoney(user, cash)
          local newmoney = money + cash
          MySQL:executeQuery("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
        end
      end

      TriggerClientEvent('apart:getCash', playersource, money, dirtymoney)
    else
      -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --(FOR FREEROAM)
      TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --WITH LALIFE SCRIPTS
    end
  end)
end)

RegisterServerEvent("apart:takecash")
AddEventHandler('apart:takecash', function(cash, apart)
local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local money = 0
    if mode == "Async" then
      MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
          if (result) then
            money = result[1].money
            if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
              LaLife.Player.Manager.AddPlayerMoney(user, cash)
              local newmoney = money - cash
              MySQL.Async.execute("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
            else
              -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --(FOR FREEROAM)
              TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --WITH LALIFE SCRIPTS
            end
          end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT money FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
      local result = MySQL:getResults(executed_query, {'money'})
      if (result) then
        money = result[1].money
        if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
          LaLife.Player.Manager.AddPlayerMoney(user, cash)
          local newmoney = money - cash
          MySQL:executeQuery("UPDATE user_appartement SET `money`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
        else
          -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --(FOR FREEROAM)
          TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --WITH LALIFE SCRIPTS
        end
      end
    end

    TriggerClientEvent('apart:getCash', source, money, dirtymoney)
  end)
end)

RegisterServerEvent("apart:takedirtycash")
AddEventHandler('apart:takedirtycash', function(cash, apart)
local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local money = 0
    if mode == "Async" then
      MySQL.Async.fetchAll("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart}, function (result)
          if (result) then
            money = result[1].dirtymoney
            if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
              LaLife.Player.Manager.AddPlayerDirtyMoney(user, cash)
              local newmoney = money - cash
              MySQL.Async.execute("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart}, function(data)
              end)
            else
              -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --(FOR FREEROAM)
              TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --WITH LALIFE SCRIPTS
            end
          end
      end)
    elseif mode == "MySQL" then
      local executed_query = MySQL:executeQuery("SELECT dirtymoney FROM user_appartement WHERE name = @nom", {['@nom'] = apart})
      local result = MySQL:getResults(executed_query, {'dirtymoney'})
      if (result) then
        money = result[1].money
        if (tonumber(cash) <= tonumber(money) and tonumber(cash) > 0) then
          LaLife.Player.Manager.AddPlayerDirtyMoney(user, cash)
          local newmoney = money - cash
          MySQL:executeQuery("UPDATE user_appartement SET `dirtymoney`=@cash WHERE name = @nom",{['@cash'] = newmoney, ['@nom'] = apart})
        else
          -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --(FOR FREEROAM)
          TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --WITH LALIFE SCRIPTS
        end
      end
    end

    TriggerClientEvent('apart:getCash', source, money, dirtymoney)
  end)
end)

RegisterServerEvent("apart:buyAppart")
AddEventHandler('apart:buyAppart', function(name, price)
	local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    local price = price
    if (tonumber(user.money) >= tonumber(price)) then
        LaLife.Player.Manager.RemovePlayerMoney(user, price)
		print('lolilol avant sql apart')
      if (mode == "Async") then
    	  MySQL.Async.execute("INSERT INTO user_appartement (`identifier`, `name`, `price`) VALUES (@username, @name, @price)", {['@username'] = player, ['@name'] = name, ['@price'] = price})
		  for _, item in pairs(items) do
			MySQL.Async.execute("INSERT INTO appartement_item (`identifier`, `name`,item_id,qty) VALUES (@username, @name,@item_id,@qty)", {['@username'] = player, ['@name'] = name, ['@item_id'] = item.item_id, ['@qty'] = 0})
		  end
      elseif mode == "MySQL" then
        local executed_query2 = MySQL:executeQuery("INSERT INTO user_appartement (`identifier`, `name`, `price`) VALUES (@username, @name, @price)", {['@username'] = player, ['@name'] = name, ['@price'] = price})
      end
      -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['welcome']) --(FOR FREEROAM)
	    TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['welcome']) --WITH LALIFE SCRIPTS
    	TriggerClientEvent('apart:isMine', playersource)
		print('lolilol apart acheter')
    else
    	-- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --(FOR FREEROAM)
    	TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash']) --WITH LALIFE SCRIPTS
    end
  end)
end)

RegisterServerEvent("apart:sellAppart")
AddEventHandler('apart:sellAppart', function(name, price)
local playersource = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    local price = price/2
    LaLife.Player.Manager.AddPlayerMoney(user, price)
      if (mode == "Async") then
        MySQL.Async.execute("DELETE from user_appartement WHERE identifier = @username AND name = @name",
		{['@username'] = player, ['@name'] = name})
		MySQL.Async.execute("DELETE from appartement_item WHERE identifier = @username AND name = @name",
        {['@username'] = player, ['@name'] = name})
      elseif mode == "MySQL" then
        local executed_query3 = MySQL:executeQuery("DELETE from user_appartement WHERE identifier = @username AND name = @name",
        {['@username'] = player, ['@name'] = name})
      end
      -- TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['estVendu']) --(FOR FREEROAM)
      TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['estVendu']) --WITH LALIFE SCRIPTS
      TriggerClientEvent('apart:isNotBuy', playersource)
  end)
end)

RegisterServerEvent("apart:sonner")
AddEventHandler('apart:sonner', function(target)
	local playersource = source
	MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
	TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, "vous attendez une réponse") --WITH LALIFE SCRIPTS
	TriggerEvent('es:getPlayerFromIdentifier', result[1].identifier, function(user)
		TriggerClientEvent("citizenv:notify", user, "CHAR_SIMEON", 1, "Stephane", false, "Quelqu'un vient de sonner") --WITH LALIFE SCRIPTS
	end)
	end)
end)

RegisterServerEvent("apart:getlock")
AddEventHandler('apart:getlock', function(name)
	local playersource = source
	local lock = 0
	MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
		if(result[1]) then
			lock = result[1].lock
			TriggerClientEvent("apart:islock", playersource, lock)
		end
	end)
end)

RegisterServerEvent("apart:lock_s")
AddEventHandler('apart:lock_s', function(name)
	local playersource = source
	local islock = 0
	MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
		islock = tonumber(result[1].lock)
			if islock == 0 then
		MySQL.Async.execute("UPDATE user_appartement SET `lock`=@lock WHERE name = @nom",{['@lock'] = 1, ['@nom'] = name}, function(data)
        end)
		TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, "Vérouiller") --WITH LALIFE SCRIPTS
	else
		MySQL.Async.execute("UPDATE user_appartement SET `lock`=@lock WHERE name = @nom",{['@lock'] = 0, ['@nom'] = name}, function(data)
        end)
		TriggerClientEvent("citizenv:notify", playersource, "CHAR_SIMEON", 1, "Stephane", false, "Dévérouiller") --WITH LALIFE SCRIPTS
	end
	end)
end)

RegisterServerEvent("apart:getown")
AddEventHandler('apart:getown', function()
	local playersource = source
	  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE identifier = @nom", {['@nom'] = tostring(player)}, function (result)
        if (result) then
          TriggerClientEvent("apart:getown_f", playersource, result)
        end
      end)
    end
  end)
end)

RegisterServerEvent("apart:getowned")
AddEventHandler('apart:getowned', function()
	local playersource = source
	  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM user_appartement", {}, function (result)
        --if (result) then
		--	print(result[1].name)
          TriggerClientEvent("apart:getowned_f", playersource, result)
        --end
      end)
    end
  end)
end)

RegisterServerEvent("apart:getitem")
AddEventHandler('apart:getitem', function(name)
	local playersource = source
	  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM appartement_item WHERE name = @nom ", {['@nom'] = tostring(name)}, function (result)
        --if (result) then
		--	print(result[1].name)
    for _, res in pairs(result) do
      items[res.item_id].valeur = res.qty
    end
          TriggerClientEvent("apart:getitem_f", playersource, items)
        --end
      end)
    end
  end)
end)

RegisterServerEvent("apart:user_getitem")
AddEventHandler('apart:user_getitem', function(name)
	local playersource = source
	  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM user_inventory WHERE user_id =@iden", {['@iden'] = tostring(player)}, function (result)
        --if (result) then
		--	print(result[1].name)
			--print(result[1].item_id)
        for _, res in pairs(result) do
          print(res.item_id)
          items[res.item_id].valeur = res.quantity
        end
          TriggerClientEvent("apart:user_getitem_f", playersource, items)
        --end
      end)
    end
  end)
end)

RegisterServerEvent("apart:remitem_s")
AddEventHandler('apart:remitem_s', function(id,name)
	local playersource = source
	  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM appartement_item WHERE name = @nom and item_id = @id ", {['@nom'] = tostring(name),['@id'] = tostring(id)}, function (result)
        --if (result) then)
          MySQL.Async.execute("UPDATE appartement_item SET `qty`= @qty WHERE name = @nom and item_id = @id",{['@qty'] = tostring(result[1].qty-1), ['@nom'] = tostring(result[1].name),['@id'] = result[1].item_id}, function(data)
          end)
        --end
      end)
    end
  end)
end)

RegisterServerEvent("apart:additem_s")
AddEventHandler('apart:additem_s', function(id,name)
	local playersource = source
	  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    print("addItem_s")
    if (mode == "Async") then
      MySQL.Async.fetchAll("SELECT * FROM appartement_item WHERE name = @nom and item_id = @id ", {['@nom'] = tostring(name),['@id'] = tostring(id)}, function (result)
        if (result[1]) then
          MySQL.Async.execute("UPDATE appartement_item SET `qty`= @qty WHERE name = @nom and item_id = @id",{['@qty'] = tostring(result[1].qty+1), ['@nom'] = tostring(result[1].name) ,['@id'] = result[1].item_id}, function(data)
          end)
        else
            MySQL.Async.execute("INSERT INTO appartement_item (`identifier`, `name`, `item_id`,`qty`) VALUES (@username, @name, @id,@qty)", {['@username'] = player, ['@name'] = name, ['@item_id'] = id,["@qty"] = 1})
        end
      end)
    end
  end)
end)

RegisterServerEvent("apart:getinvitem")
AddEventHandler("apart:getinvitem", function()
  MySQL.Async.fetchAll("SELECT * FROM items", {}, function (result)
    --if (result) then
--	print(result[1].name)
  --print(result[1].item_id)
    for _, res in pairs(result) do
      t = {["libelle"] = res.libelle, ["valeur"] = 0, ["item_id"] = res.id}
      table.insert(items, tonumber(res.id),t)
    end
  end)
end)
