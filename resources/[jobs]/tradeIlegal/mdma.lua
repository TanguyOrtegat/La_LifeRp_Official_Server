local DrawMarkerShow = true
local DrawBlipTradeShow = true
local tenu = true
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
    "meth_lab_upgrade",
    "meth_lab_setup",
    "meth_lab_production",
    "meth_lab_security_high",
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
    Entrer={ ['x'] = 1005.6166381836, ['y'] = -114.64562225342, ['z'] = 72.973709106445,["distance"] = 3 },
    traitement={ ['x'] = 1010.866394043, ['y'] = -3194.9821777344, ['z'] = -38.993144989014,["distance"] = 1 },
    traitement2={ ['x'] = 1011.0309448242, ['y'] = -3199.9638671875, ['z'] = -38.993156433105,["distance"] = 1 },
    traitement3={ ['x'] = 1005.8270874023, ['y'] = -3200.3728027344, ['z'] = -38.519325256348,["distance"] = 1 },
    traitement4={ ['x'] = 1002.7363891602, ['y'] = -3199.8361816406, ['z'] = -38.993171691895,["distance"] = 1 },
    traitement5={ ['x'] = 1004.1533813477, ['y'] = -3196.4401855469, ['z'] = -38.993171691895,["distance"] = 1 },
    traitement6={ ['x'] = 1006.024597168, ['y'] = -3194.9404296875, ['z'] = -38.993171691895,["distance"] = 1 },
    Sorti={ ['x'] = 997.05859375, ['y'] = -3200.646484375, ['z'] = -37.393688201904,["distance"] = 1 },
    vente={ ['x'] = -2165.9821777344, ['y'] = 5196.9291992188, ['z'] = 16.880392074585,["distance"] = 1 },
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
                if (User.job == 41 or User.job == 42) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[9].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[9].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Mix amoniaque'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 9, 1)
				TriggerEvent("player:receiveItem", 45, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31  pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas d'éphédrine !")
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
                if (User.job == 41 or User.job == 42) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[45].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[45].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Sérotonine'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 45, 1)
				TriggerEvent("player:receiveItem", 46, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Mix amoniaque pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Mix amoniaque!")
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
                if (User.job == 41 or User.job == 42) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[46].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[46].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Dopamine'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 46, 1)
				TriggerEvent("player:receiveItem", 47, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Sérotonine pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Sérotonine 66% !")
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
                if (User.job == 41 or User.job == 42) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[47].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[47].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Noradrénaline'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 47, 1)
				TriggerEvent("player:receiveItem", 48, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Dopamine pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Dopamine !")
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
                if (User.job == 41 or User.job == 42) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[48].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[48].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Ocytocine'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 48, 1)
				TriggerEvent("player:receiveItem", 49, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Noradrénaline pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de Noradrénaline !")
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
                if (User.job == 41 or User.job == 42) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[49].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[49].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 Ecstasy'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 49, 1)
				TriggerEvent("player:receiveItem", 50, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Ocytocine pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas d'Ocytocine !")
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
                if (User.job == 41 or User.job ==42 or User.job == 40) then
                    TriggerEvent("itinerance:notif", "~r~Vous devez pas faire parti des TheLost pour vendre !")
                else
                    Citizen.Wait(1)
                    isSell = true
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
        inv_qty = tonumber(ITEMSDRUGS[50].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[50].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				--TriggerServerEvent("drugs:getBoursePrice", 12)
                --TriggerServerEvent("drugs:changeBoursePrice", 12)
				ShowMsgtime.msg = 'En train de vendre...'
				ShowMsgtime.time = 250
				Wait(2500)
                --local price = math.ceil(PriceBourse)
				ShowMsgtime.msg = '~r~-1 Ecstasy ~w~/ ~r~+'.. 1500 ..'$'
				ShowMsgtime.time = 150
				TriggerEvent("player:sellItem", 50, 1500)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 Ecstasy pour vendre !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas d'Ecstasy !")
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
            if User.job == 40 or User.job == 41 or User.job == 42 then
            mdmaOutfits()
              spawnprops()
              Wait(500)
              SetEntityCoords(GetPlayerPed(-1), tonumber(Positions.Sorti.x),tonumber(Positions.Sorti.y),tonumber(Positions.Sorti.z-1))
            else
                TriggerEvent("itinerance:notif", "~r~Vous n'avez pas les clef !")
            end
          end
--      end
    end
end
end
end)

 function spawnprops()
    for _,v in pairs(props) do
        TriggerEvent("es_admin:loadprops",v)
    end
end

RegisterNetEvent("vmenu:setUser")
AddEventHandler("vmenu:setUser", function(infos)
    for k,v in pairs(infos) do
        User[k] = v
    end
end)

function mdmaOutfits()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
      SetPedComponentVariation(GetPlayerPed(-1), 1, 38, 0, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
      SetPedComponentVariation(GetPlayerPed(-1), 1, 38, 0, 0)
  end
end
