local DrawMarkerShow = true
local DrawBlipTradeShow = true

local isMine = false
local isProc = false
local isProc2 = false
local isProc3 = false
local isSell = false
local isSell2 = false
local inv_qty = 0
local methserver = 0

local Positions = {
    -- VOS POINTS ICI
    recolte={x=3642.4509277344,y=3744.5773925781,z=28.515714645386, distance=3},
    traitement={x=1390.51037597656,y=3609.09399414063,z=38.9419288635254, distance=1},
    traitement2={x=1389.52404785156,y=3604.15209960938,z=38.9419288635254, distance=1},
    traitement3={x=1394.45300292969,y=3601.97973632813,z=38.94189453125, distance=1},
    vente={x=-2638.1674804688,y=1868.6248779297,z=160.13459777832, distance=3},
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
---------------------------------------------RECOLTE-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, true)
      if not IsInVehicle() then
        if distance < Positions.recolte.distance then
            if isMine == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à récolter~w~.", 0)
            end
            if isMine == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de récolter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isMine == false then
                if (User.job ~= 41 and User.job ~=42 and User.job ~= 40) then
                    Citizen.Wait(1)
                    isMine = true
                else
                    TriggerEvent("itinerance:notif", "~r~Vous devez pas faire parti des TheLost pour récolter !")
                end
            end
            if IsControlJustPressed(1, 38) and isMine == true then
              Citizen.Wait(1)
              isMine = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, true)
    if distance < Positions.recolte.distance then
      if isMine == true then
        Citizen.Wait(1)
        TriggerServerEvent('drogue:getmeth')
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[9].quantity)+tonumber(ITEMSDRUGS[10].quantity)+tonumber(ITEMSDRUGS[11].quantity)+tonumber(ITEMSDRUGS[12].quantity)
        Citizen.Wait(1000)
        if tonumber(methserver) > 0 then
          if tonumber(inv_qty) < 30 then
            ShowMsgtime.msg = 'En train de récolter...'
            ShowMsgtime.time = 250
            TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
            Wait(2500)
            ShowMsgtime.msg = '+1 Éphédrine'
            ShowMsgtime.time = 150
            TriggerEvent("player:receiveItem", 9, 1)
            TriggerServerEvent('drogue:remmeth')
          else
            TriggerEvent("itinerance:notif", "~r~Votre inventaire est plein !")
            isMine = false
          end
        else
          TriggerEvent("itinerance:notif", "~r~Le champs est vide ! Revenez plus tard !")
          isMine = false
        end
      end
      else
        isMine = false
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
                Citizen.Wait(1)
                isProc = true
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
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[9].quantity)+tonumber(ITEMSDRUGS[10].quantity)+tonumber(ITEMSDRUGS[11].quantity)+tonumber(ITEMSDRUGS[12].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[9].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 éphédrine 33%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 9, 1)
				TriggerEvent("player:receiveItem", 10, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 éphédrine pour traiter !")
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
                Citizen.Wait(1)
                isProc2 = true
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
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[9].quantity)+tonumber(ITEMSDRUGS[10].quantity)+tonumber(ITEMSDRUGS[11].quantity)+tonumber(ITEMSDRUGS[12].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[10].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 éphédrine 66%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 10, 1)
				TriggerEvent("player:receiveItem", 11, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 éphédrine 33% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas d'éphédrine 33% !")
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
                Citizen.Wait(1)
                isProc3 = true
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
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[9].quantity)+tonumber(ITEMSDRUGS[10].quantity)+tonumber(ITEMSDRUGS[11].quantity)+tonumber(ITEMSDRUGS[12].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[11].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 méthemphétamine'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 11, 1)
				TriggerEvent("player:receiveItem", 12, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 éphédrine 66% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas d'éphédrine 66% !")
            isProc3 = false
          end
      end
      else
        isProc3 = false
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
                Citizen.Wait(1)
                isSell = true
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
        inv_qty = tonumber(ITEMSDRUGS[9].quantity)+tonumber(ITEMSDRUGS[10].quantity)+tonumber(ITEMSDRUGS[11].quantity)+tonumber(ITEMSDRUGS[12].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[12].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				--TriggerServerEvent("drugs:getBoursePrice", 12)
                --TriggerServerEvent("drugs:changeBoursePrice", 12)
				ShowMsgtime.msg = 'En train de vendre...'
				ShowMsgtime.time = 250
				Wait(2500)
                --local price = math.ceil(PriceBourse)
				ShowMsgtime.msg = '~r~-1 méthemphétamine ~w~/ ~r~+'.. 500 ..'$'
				ShowMsgtime.time = 150
				TriggerEvent("player:sellItem", 12, 500)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 méthemphétamine pour vendre !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de méthemphétamine !")
            isSell = false
          end
      end
      else
        isSell = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------VENTE 2-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.vente2.x, Positions.vente2.y, Positions.vente2.z, true)
      if not IsInVehicle() then
        if distance < Positions.vente2.distance then
            if isSell2 == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à vendre~w~.", 0)
            end
            if isSell2 == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de vendre~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isSell2 == false then
                Citizen.Wait(1)
                isSell2 = true
            end
            if IsControlJustPressed(1, 38) and isSell2 == true then
              Citizen.Wait(1)
              isSell2 = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.vente2.x, Positions.vente2.y, Positions.vente2.z, true)
    if distance < Positions.vente2.distance then
      if isSell2 == true then
        Citizen.Wait(1)
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[9].quantity)+tonumber(ITEMSDRUGS[10].quantity)+tonumber(ITEMSDRUGS[11].quantity)+tonumber(ITEMSDRUGS[12].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[12].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				--TriggerServerEvent("drugs:getBoursePrice", 12)
                --TriggerServerEvent("drugs:changeBoursePrice", 12)
				ShowMsgtime.msg = 'En train de vendre...'
				ShowMsgtime.time = 250
				Wait(2500)
                --local price = math.ceil(PriceBourse)
				ShowMsgtime.msg = '~r~-1 méthemphétamine ~w~/ ~r~+'.. 500 ..'$'
				ShowMsgtime.time = 150
				TriggerEvent("player:sellItem", 12, 500)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 méthemphétamine pour vendre !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de méthemphétamine !")
            isSell2 = false
          end
      end
      else
        isSell2 = false
      end
    end
end)
