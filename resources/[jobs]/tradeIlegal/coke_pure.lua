local DrawMarkerShow = true
local DrawBlipTradeShow = true

local isMine = false
local isProc = false
local isProc2 = false
local isProc3 = false
local isProc4 = false
local isProc5 = false
local isProc6 = false
local isSell = false
local inv_qty = 0
local methserver = 0
local props = {
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

User = {
    Spawned = false,
    Loaded = false,
    group = "0",
    permission_level = 0,
    money = 0,
    dirtymoney = 0,
    job = 0,
    police = 0,
    enService = 0,
    nom = "",
    prenom = "",
    vehicle = "",
    identifier = nil,
    telephone = "",
    gender = ""
}

local Positions = {
    -- VOS POINTS ICI
    Entrer={ ['x'] = 1443.9876708984, ['y'] = 1132.4537353516, ['z'] = 114.33401489258,["distance"] = 3 },
    traitement={ ['x'] = 1090.2218017578, ['y'] = -3196.5671386719, ['z'] = -38.993465423584,["distance"] = 1 },
    traitement2={ ['x'] = 1092.8162841797, ['y'] = -3196.5891113281, ['z'] = -38.993465423584,["distance"] = 1 },
    traitement3={ ['x'] = 1095.4284667969, ['y'] = -3196.6389160156, ['z'] = -38.993465423584,["distance"] = 1 },
    traitement4={ ['x'] = 1099.6447753906, ['y'] = -3194.5385742188, ['z'] = -38.993465423584,["distance"] = 1 },
    traitement5={ ['x'] = 1101.5905761719, ['y'] = -3193.7861328125, ['z'] = -38.993465423584,["distance"] = 1 },
    traitement6={ ['x'] = 1100.5286865234, ['y'] = -3198.830078125, ['z'] = -38.993465423584,["distance"] = 1 },
    Sorti={ ['x'] = 1088.7034912109, ['y'] = -3187.6997070313, ['z'] = -38.993461608887,["distance"] = 1},
    vente={ ['x'] = -2170.203125, ['y'] = 5196.6694335938, ['z'] = 17.069763183594,["distance"] = 1},
}

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x, y)
end

function ShowInfo(text, state)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

local ShowMsgtime = { msg = "", time = 0 }

local methserver = 0

RegisterNetEvent("f_drogue:getmeth")
AddEventHandler("f_drogue:getmeth", function(itemQty)
  methserver = itemQty
end)

Citizen.CreateThread(function()
    while true do
                    Citizen.Wait(0)
      if ShowMsgtime.time > 0 then
        drawTxt(ShowMsgtime.msg, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
        ShowMsgtime.time = ShowMsgtime.time - 1
      end
    end
end)

Citizen.CreateThread(function()

    if DrawBlipTradeShow then
        --SetBlipTrade(140, "~g~ Voler ~b~Matière première illégale", 2, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z)
        --SetBlipTrade(50, "~g~ Traitement ~b~Matière illégale", 1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)
        --SetBlipTrade(50, "~g~ Traitement ~b~Matière illégale", 1, Positions.traitement2.x, Positions.traitement2.y, Positions.traitement2.z)
        --SetBlipTrade(50, "~g~ Traitement ~b~Matière illégale", 1, Positions.traitement3.x, Positions.traitement3.y, Positions.traitement3.z)
        --SetBlipTrade(277, "~g~ Vendre ~b~Meth", 1, Positions.vente.x, Positions.vente.y, Positions.vente.z)
    end

    while true do
      Citizen.Wait(0)
       if DrawMarkerShow then
          --DrawMarker(1, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 25, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.traitement2.x, Positions.traitement2.y, Positions.traitement2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 25, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.traitement3.x, Positions.traitement3.y, Positions.traitement3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 25, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.vente.x, Positions.vente.y, Positions.vente.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
       end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------TRAITEMENT 1-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement.distance then
            if isProc == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à traiter~w~.", 0)
            end
            if isProc == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de traiter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc == false then
                Citizen.Trace(User.job)
                if (User.job == 46 or User.job == 47) then
                    Citizen.Wait(1)
                    isProc = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
                end
            end
            if IsControlJustPressed(1, 38) and isProc == true then
              Citizen.Wait(1)
              isProc = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, true)
    if distance < Positions.traitement.distance then
      if isProc == true then
          TriggerEvent("vmenu:closeMenu")
          TriggerEvent("vmenu:MainMenuOG")
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[8].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[8].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de purifier...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 purifier 10%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 6, 1)
				TriggerEvent("player:receiveItem", 51, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Cocaïne pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Cocaïne !")
            isProc = false
          end
      end
      else
        isProc = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------TRAITEMENT 2-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement2.x, Positions.traitement2.y, Positions.traitement2.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement2.distance then
            if isProc2 == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à traiter~w~.", 0)
            end
            if isProc2 == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de traiter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc2 == false then
                if (User.job == 46 or User.job == 47) then
                    Citizen.Wait(1)
                    isProc2 = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
                end
            end
            if IsControlJustPressed(1, 38) and isProc2 == true then
              Citizen.Wait(1)
              isProc2 = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement2.x, Positions.traitement2.y, Positions.traitement2.z, true)
    if distance < Positions.traitement2.distance then
      if isProc2 == true then
          TriggerEvent("vmenu:closeMenu")
          TriggerEvent("vmenu:MainMenuOG")
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[51].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[51].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de purifier...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Coke purifier 30%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 51, 1)
				TriggerEvent("player:receiveItem", 52, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Coke purifier 10% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Coke purifier 10% !")
            isProc2 = false
          end
      end
      else
        isProc2 = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------TRAITEMENT 3-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement3.x, Positions.traitement3.y, Positions.traitement3.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement3.distance then
            if isProc3 == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à traiter~w~.", 0)
            end
            if isProc3 == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de traiter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc3 == false then
                if (User.job == 46 or User.job == 47) then
                    Citizen.Wait(1)
                    isProc3 = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
                end
            end
            if IsControlJustPressed(1, 38) and isProc3 == true then
              Citizen.Wait(1)
              isProc3 = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement3.x, Positions.traitement3.y, Positions.traitement3.z, true)
    if distance < Positions.traitement3.distance then
      if isProc3 == true then
          TriggerEvent("vmenu:closeMenu")
          TriggerEvent("vmenu:MainMenuOG")
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[52].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[52].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de purifier...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Coke purifier 50%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 52, 1)
				TriggerEvent("player:receiveItem", 53, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Coke purifier 30% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Coke purifier 30% !")
            isProc3 = false
          end
      end
      else
        isProc3 = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------TRAITEMENT 4-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement4.x, Positions.traitement4.y, Positions.traitement4.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement4.distance then
            if isProc4 == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à traiter~w~.", 0)
            end
            if isProc4 == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de traiter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc4 == false then
                if (User.job == 46 or User.job == 47) then
                    Citizen.Wait(1)
                    isProc4 = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
                end
            end
            if IsControlJustPressed(1, 38) and isProc4 == true then
              Citizen.Wait(1)
              isProc4 = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement4.x, Positions.traitement4.y, Positions.traitement4.z, true)
    if distance < Positions.traitement4.distance then
      if isProc4 == true then
          TriggerEvent("vmenu:closeMenu")
          TriggerEvent("vmenu:MainMenuOG")
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[53].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[53].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de purifier...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Coke purifier 70%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 53, 1)
				TriggerEvent("player:receiveItem", 54, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Coke purifier 50% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Coke purifier 50% !")
            isProc4 = false
          end
      end
      else
        isProc4 = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------TRAITEMENT 5-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement5.x, Positions.traitement5.y, Positions.traitement5.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement5.distance then
            if isProc5 == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à traiter~w~.", 0)
            end
            if isProc5 == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de traiter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc5 == false then
                if (User.job == 46 or User.job == 47) then
                    Citizen.Wait(1)
                    isProc5 = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
                end
            end
            if IsControlJustPressed(1, 38) and isProc5 == true then
              Citizen.Wait(1)
              isProc5 = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement5.x, Positions.traitement5.y, Positions.traitement5.z, true)
    if distance < Positions.traitement5.distance then
      if isProc5 == true then
          TriggerEvent("vmenu:closeMenu")
          TriggerEvent("vmenu:MainMenuOG")
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[54].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[54].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de purifier...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Coke purifier 90%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 54, 1)
				TriggerEvent("player:receiveItem", 55, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Coke purifier 70% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Coke purifier 70% !")
            isProc5 = false
          end
      end
      else
        isProc5 = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------TRAITEMENT 6-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement6.x, Positions.traitement6.y, Positions.traitement6.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement6.distance then
            if isProc6 == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à traiter~w~.", 0)
            end
            if isProc6 == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de traiter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc6 == false then
                if (User.job == 46 or User.job == 47) then
                    Citizen.Wait(1)
                    isProc6 = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
                end
            end
            if IsControlJustPressed(1, 38) and isProc6 == true then
              Citizen.Wait(1)
              isProc6 = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement6.x, Positions.traitement6.y, Positions.traitement6.z, true)
    if distance < Positions.traitement6.distance then
      if isProc6 == true then
          TriggerEvent("vmenu:closeMenu")
          TriggerEvent("vmenu:MainMenuOG")
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[55].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[55].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de purifier...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Coke purifier 100%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 55, 1)
				TriggerEvent("player:receiveItem", 56, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Coke purifier 90% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Coke purifier 90%")
            isProc6 = false
          end
      end
      else
        isProc6 = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------VENTE 1-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.vente.x, Positions.vente.y, Positions.vente.z, true)
      if not IsInVehicle() then
        if distance < Positions.vente.distance then
            if isSell == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à vendre~w~.", 0)
            end
            if isSell == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de vendre~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isSell == false then
                if (User.job ~= 45 or User.job ~=46 or User.job ~= 47) then
                    Citizen.Wait(1)
                    isSell = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous devez pas faire parti des TheLost pour vendre !")
                end
            end
            if IsControlJustPressed(1, 38) and isSell == true then
              Citizen.Wait(1)
              isSell = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.vente.x, Positions.vente.y, Positions.vente.z, true)
    if distance < Positions.vente.distance then
      if isSell == true then
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[56].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[56].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				--TriggerServerEvent("drugs:getBoursePrice", 12)
                --TriggerServerEvent("drugs:changeBoursePrice", 12)
				ShowMsgtime.msg = 'En train de vendre...'
				ShowMsgtime.time = 250
				Wait(2500)
                --local price = math.ceil(PriceBourse)
				ShowMsgtime.msg = '~r~-1 Coke purifier 100% ~w~/ ~r~+'.. 1500 ..'$'
				ShowMsgtime.time = 150
				TriggerEvent("player:sellItem", 56, 1500)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Coke purifier 100% pour vendre !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Coke purifier 100% !")
            isSell = false
          end
      end
      else
        isSell = false
      end
    end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.Sorti.x, Positions.Sorti.y, Positions.Sorti.z, true)
    if not IsInVehicle() then
      if distance < 1.5 then
--        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~Sortir~w~.', 0)
          if IsControlJustPressed(1,38) then
              TriggerServerEvent("vmenu:lastChar")
              SetEntityCoords(GetPlayerPed(-1), tonumber(Positions.Entrer.x),tonumber(Positions.Entrer.y),tonumber(Positions.Entrer.z-1))
          end
--      end
    end
end
end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.Entrer.x, Positions.Entrer.y, Positions.Entrer.z, true)
    if not IsInVehicle() then
      if distance < 1.5 then
--        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~Entrer~w~.', 0)
          if IsControlJustPressed(1,38) then
            if User.job == 45 or User.job == 46 or User.job == 47 then
                cokeOutfits()
              Wait(500)
              SetEntityCoords(GetPlayerPed(-1), tonumber(Positions.Sorti.x),tonumber(Positions.Sorti.y),tonumber(Positions.Sorti.z-1))
              Wait(1000)
              spawnpropscok()
            else
                TriggerEvent("itinerance:notif", "~r~Vous n'avez pas les clef !")
            end
          end
--      end
    end
end
end
end)

function spawnpropscok()
    for _,v in pairs(props) do
        TriggerEvent("es_admin:loadpropscoke",v)
    end
end

RegisterNetEvent("vmenu:setUser")
AddEventHandler("vmenu:setUser", function(infos)
    for k,v in pairs(infos) do
        User[k] = v
    end
end)

function cokeOutfits()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
      SetPedComponentVariation(GetPlayerPed(-1), 1, 36, 0, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
      SetPedComponentVariation(GetPlayerPed(-1), 1, 36, 0, 0)
  end
end
