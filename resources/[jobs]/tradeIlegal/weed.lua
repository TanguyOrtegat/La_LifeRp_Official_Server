local DrawMarkerShow = true
local DrawBlipTradeShow = true

local Price = 110
local isMine = false
local isProc = false
local isSell = false
local inv_qty = 0
local weedserver = 0

local Positions = {
    -- VOS POINTS ICI
    recolte={x=1875.8841552734,y=5056.6772460938,z=51.513126373291, distance=20},
    traitement={x=83.502479553223,y=6650.2631835938,z=32.19792175293, distance=5},
    vente={x=2477.1474609375,y=3763.0439453125,z=41.8897171020508, distance=5}
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
  DrawText(x , y)
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

local ShowMsgtime = {msg="",time=0}

local weedserver = 0

RegisterNetEvent("f_drogue:getweed")
AddEventHandler("f_drogue:getweed", function(itemQty)
  weedserver = itemQty
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if ShowMsgtime.time >= 0 then
        drawTxt(ShowMsgtime.msg, 0,1,0.5,0.8,0.6,255,255,255,255)
        ShowMsgtime.time = ShowMsgtime.time - 1
      end
    end
end)

Citizen.CreateThread(function()

    if DrawBlipTradeShow then
        --SetBlipTrade(140, "~g~ Ceuillette ~b~Cannabis", 2, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z)
        --SetBlipTrade(50, "~g~ Préparation ~b~Cannabis", 1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)
        --SetBlipTrade(277, "~g~ Vendre ~b~Cannabis", 1, Positions.vente.x, Positions.vente.y, Positions.vente.z)
    end

    while true do
       Citizen.Wait(0)
       if DrawMarkerShow then
          --DrawMarker(1, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.vente.x, Positions.vente.y, Positions.vente.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
       end
    end
end)

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
                Citizen.Wait(1)
                isMine = true
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
        TriggerServerEvent('drogue:getweed')
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[4].quantity)+tonumber(ITEMSDRUGS[5].quantity)
        Citizen.Wait(1000)
        if tonumber(weedserver) > 0 then
          if tonumber(inv_qty) < 30 then
				ShowMsgtime.msg = 'En train de récolter...'
				ShowMsgtime.time = 250
				TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
				Wait(2500)
				ShowMsgtime.msg = '+1 cannabis'
				ShowMsgtime.time = 150
				TriggerEvent("player:receiveItem", 4, 1)
				TriggerServerEvent('drogue:remweed')
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
---------------------------------------------TRAITEMENT-----------------------------------------------
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
        inv_qty = tonumber(ITEMSDRUGS[4].quantity)+tonumber(ITEMSDRUGS[5].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[4].quantity >= 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 cannabis roulé'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 4, 1)
				TriggerEvent("player:receiveItem", 5, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 cannabis pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de cannabis !")
            isProc = false
          end
      end
      else
        isProc = false
      end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------VENTE-----------------------------------------------
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
        inv_qty = tonumber(ITEMSDRUGS[4].quantity)+tonumber(ITEMSDRUGS[5].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[5].quantity >= 0 then
			if tonumber(inv_qty) <= 30 then
				--TriggerServerEvent("drugs:getBoursePrice", 5)
                --TriggerServerEvent("drugs:changeBoursePrice", 5)
				ShowMsgtime.msg = 'En train de vendre...'
				ShowMsgtime.time = 250
				Wait(2500)
        --local price = math.ceil(PriceBourse)
				ShowMsgtime.msg = '~r~-1 cannabis roulé ~w~/ ~r~+'.. 150 ..'$'
				ShowMsgtime.time = 150
				TriggerEvent("player:sellItem", 5, 150)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 cannabis roulés pour vendre !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de cannabis roulé !")
            isSell = false
          end
      end
      else
        isSell = false
      end
    end
end)
