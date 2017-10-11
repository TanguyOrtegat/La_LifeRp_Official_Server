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
}

User = {
    Spawned = false,
    Loaded = false,
    group = "0",
    permission_level = 0,
    money = 0,
    dirtymoney = 0,
    job = 0,
    subjob = 0,
    police = 0,
    enService = 0,
    nom = "",
    prenom = "",
    vehicle = "",
    identifier = nil,
    telephone = "",
    gender = ""
}

RegisterNetEvent('trade:f_requestweed')
AddEventHandler('trade:f_requestweed', function(propsweed)
    props = propsweed
end)

local Positions = {
    -- VOS POINTS ICI
    Entrer={ ['x'] = 2428.1909179688, ['y'] = 4970.33203125, ['z'] = 46.170871734619 ,["distance"] = 3 },
    traitement={ ['x'] = 1063.3736572266, ['y'] = -3194.3112792969, ['z'] = -39.124752044678 ,["distance"] = 1 },
    traitement2={ ['x'] = 1063.9052734375, ['y'] = -3204.40625, ['z'] = -39.151641845703 ,["distance"] = 1 },
    traitement3={ ['x'] = 1052.1785888672, ['y'] = -3206.3544921875, ['z'] = -39.148048400879 ,["distance"] = 1 },
    traitement4={ ['x'] = 1037.6202392578, ['y'] = -3205.40234375, ['z'] = -38.170040130615 ,["distance"] = 1 },
    traitement5={ ['x'] = 1032.9360351563, ['y'] = -3205.5493164063, ['z'] = -38.180423736572 ,["distance"] = 1 },
    traitement6={ ['x'] = 1039.4704589844, ['y'] = -3201.2404785156, ['z'] = -38.167304992676 ,["distance"] = 1 },
    Sorti={ ['x'] = 1066.0001220703, ['y'] = -3183.3852539063, ['z'] = -39.163482666016 ,["distance"] = 3 },
    vente={ ['x'] = -2168.3701171875, ['y'] = 5198.0712890625, ['z'] = 17.028638839722 ,["distance"] = 1 },
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
                if (User.subjob == 12 or User.subjob == 13 or User.subjob == 14) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[4].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[4].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 weed traité 10%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 4, 1)
				TriggerEvent("player:receiveItem", 60, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 canabis pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de canabis !")
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
                if (User.subjob == 12 or User.subjob == 13 or User.subjob == 14) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[60].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[60].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 weed traité 30%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 60, 1)
				TriggerEvent("player:receiveItem", 61, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 weed traité 10% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de weed traité 10%!")
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
                if (User.subjob == 12 or User.subjob == 13 or User.subjob == 14) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[61].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[61].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 weed traité 50%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 61, 1)
				TriggerEvent("player:receiveItem", 62, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 weed traité 30% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de weed traité 30% !")
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
                if (User.subjob == 12 or User.subjob == 13 or User.subjob == 14) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[62].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[62].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 31 weed traité 70%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 62, 1)
				TriggerEvent("player:receiveItem", 63, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 31 weed traité 50% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de 31 weed traité 50% !")
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
                if (User.subjob == 12 or User.subjob == 13 or User.subjob == 14) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[63].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[63].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 weed traité 90%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 63, 1)
				TriggerEvent("player:receiveItem", 64, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 weed traité 70% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de weed traité 70% !")
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
                if (User.subjob == 12 or User.subjob == 13 or User.subjob == 14) and tenu == true then
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
        inv_qty = tonumber(ITEMSDRUGS[64].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[64].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 wax'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 64, 1)
				TriggerEvent("player:receiveItem", 65, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 weed traité 90% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de weed traité 90% !")
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
                if (User.subjob == 7 or User.subjob == 8 or User.subjob == 9 or User.subjob == 10 or User.Subjob == 2 or User.Subjob == 3 or User.Subjob == 4 or User.subjob == 11 or User.subjob == 12 or User.subjob == 13 or User.subjob == 14) then
                    TriggerEvent("itinerance:notif", "~r~Vous devez pas faire parti d'un gang pour vendre !")
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
        inv_qty = tonumber(ITEMSDRUGS[65].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[65].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				--TriggerServerEvent("drugs:getBoursePrice", 12)
                --TriggerServerEvent("drugs:changeBoursePrice", 12)
				ShowMsgtime.msg = 'En train de vendre...'
				ShowMsgtime.time = 250
				Wait(2500)
                --local price = math.ceil(PriceBourse)
				ShowMsgtime.msg = '~r~-1 Wax ~w~/ ~r~+'.. 1500 ..'$'
				ShowMsgtime.time = 150
				TriggerEvent("player:sellItem", 64, 1500)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 wax pour vendre !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de wax !")
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
            if (User.subjob == 11 or User.subjob == 12 or User.subjob == 13 or User.subjob == 14) then
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
--[[
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.Couleur.x, Positions.Couleur.y, Positions.Couleur.z, true)
    if not IsInVehicle() then
      if distance < 1.5 then
--        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour prendre vos couleur.', 0)
          if IsControlJustPressed(1,38) then
            if (User.subjob == 2 or User.subjob == 3 or User.subjob == 4 or User.subjob == 5 or User.subjob == 6) then
                ApplyPedOverlay(GetPlayerPed(-1), GetHashKey("mpbiker_overlays"), GetHashKey("MP_Biker_Tee_34_M"))
                if (User.subjob == 2) then
                    ApplyPedOverlay(GetPlayerPed(-1), GetHashKey("mpbiker_overlays"), GetHashKey("MP_Biker_Rank_004_M"))
                end
                if (User.subjob == 3) then
                    ApplyPedOverlay(GetPlayerPed(-1), GetHashKey("mpbiker_overlays"), GetHashKey("MP_Biker_Rank_003_M"))
                end
                if (User.subjob == 4) then
                    ApplyPedOverlay(GetPlayerPed(-1), GetHashKey("mpbiker_overlays"), GetHashKey("MP_Biker_Rank_000_M"))
                end
                if ( User.subjob == 5 or User.subjob == 6) then
                    ApplyPedOverlay(GetPlayerPed(-1), GetHashKey("mpbiker_overlays"), GetHashKey("MP_Biker_Rank_017_M"))
                end
                TriggerEvent("itinerance:notif", "Voici vos couleur")
            else
                TriggerEvent("itinerance:notif", "~r~Et non!")
            end
          end
--      end
    end
end
end
end)
]]
 function spawnprops()
    for _,v in pairs(props) do
        TriggerEvent("es_admin:loadpropsweed",v)
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

Citizen.CreateThread(function()
    TriggerServerEvent("trade:requestweed")
end)
