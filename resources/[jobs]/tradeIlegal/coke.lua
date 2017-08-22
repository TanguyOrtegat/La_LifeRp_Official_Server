local DrawMarkerShow = true
local DrawBlipTradeShow = true

local isMine = false
local isProc = false
local isProc2 = false
local isSell = false
local isSell2 = false
local inv_qty = 0
local cokeserver = 0
ITEMSDRUGS = {}

local Positions = {
  -- VOS POINTS ICI
    recolte={x=1990.6990966797,y=4831.1215820313,z=43.735900878906, distance=5},
    traitement={x=1268.0032958984,y=-1710.7111816406,z=54.771495819092, distance=3},
    traitement2={x=92.365592956543,y=3755.4782714844,z=40.774532318115, distance=3},
    vente={x=-760.41857910156,y=-1333.1286621094,z=9.5999927520752, distance=5},
 --   vente2={x=448.2629699707,y=-176.4065246582,z=71.254043579102, distance=10},
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

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

local ShowMsgtime = { msg = "", time = 0 }

RegisterNetEvent("drugs:getBoursePrice_c")
AddEventHandler("drugs:getBoursePrice_c", function(price)
  PriceBourse = price
end)

RegisterNetEvent("f_drogue:getcoke")
AddEventHandler("f_drogue:getcoke", function(itemQty)
  cokeserver = itemQty
end)

RegisterNetEvent("poleemploi:getQuantityDrugs")
AddEventHandler("poleemploi:getQuantityDrugs", function(p_items)
  ITEMSDRUGS = p_items
end)

Citizen.CreateThread(function()
    while true do
                    Citizen.Wait(0)
      if ShowMsgtime.time ~= 0 then
        drawTxt(ShowMsgtime.msg, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
        ShowMsgtime.time = ShowMsgtime.time - 1
      end
    end
end)

Citizen.CreateThread(function()
    if DrawBlipTradeShow then
        --SetBlipTrade(140, "~g~ Ceuillette ~b~Feuille de coka", 2, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z)
        --SetBlipTrade(50, "~g~ Traitement ~b~Feuille de coka", 1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)
        --SetBlipTrade(50, "~g~ Traitement ~b~Feuille de coka", 1, Positions.traitement2.x, Positions.traitement2.y, Positions.traitement2.z)
        --SetBlipTrade(277, "~g~ Vendre ~b~Coke", 1, Positions.vente.x, Positions.vente.y, Positions.vente.z)
        --SetBlipTrade(277, "~g~ Vendre ~b~Coke", 1, Positions.vente2.x, Positions.vente2.y, Positions.vente2.z)
    end

    while true do
     Citizen.Wait(0)
       if DrawMarkerShow then
          --DrawMarker(1, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.traitement2.x, Positions.traitement2.y, Positions.traitement2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.vente.x, Positions.vente.y, Positions.vente.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
          --DrawMarker(1, Positions.vente2.x, Positions.vente2.y, Positions.vente2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
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
        TriggerServerEvent('drogue:getcoke')
        TriggerEvent("inventory:getQuantityDrugs")
        Citizen.Wait(1000)
        inv_qty = tonumber(ITEMSDRUGS[6].quantity)+tonumber(ITEMSDRUGS[7].quantity)+tonumber(ITEMSDRUGS[8].quantity)
        Citizen.Wait(1000)
        if tonumber(cokeserver) > 0 then
          if tonumber(inv_qty) < 30 then
				ShowMsgtime.msg = 'En train de récolter...'
				ShowMsgtime.time = 250
				TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
				Wait(2500)
				ShowMsgtime.msg = '+1 feuille de cocaïne'
				ShowMsgtime.time = 150
				TriggerEvent("player:receiveItem", 6, 1)
				TriggerServerEvent('drogue:remcoke')
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
        inv_qty = tonumber(ITEMSDRUGS[6].quantity)+tonumber(ITEMSDRUGS[7].quantity)+tonumber(ITEMSDRUGS[8].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[6].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 feuille de cocaïne 50%'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 6, 1)
				TriggerEvent("player:receiveItem", 7, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 feuilles de cocaïne pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de feuille de cocaïne !")
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
        inv_qty = tonumber(ITEMSDRUGS[6].quantity)+tonumber(ITEMSDRUGS[7].quantity)+tonumber(ITEMSDRUGS[8].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[7].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				ShowMsgtime.msg = 'En train de traiter...'
				ShowMsgtime.time = 250
				Wait(2500)
				ShowMsgtime.msg = '+1 cocaïne'
				ShowMsgtime.time = 150
				TriggerEvent("player:looseItem", 7, 1)
				TriggerEvent("player:receiveItem", 8, 1)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 feuilles de cocaïne 50% pour traiter !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de feuille de cocaïne 50% !")
            isProc2 = false
          end
      end
      else
        isProc2 = false
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
        inv_qty = tonumber(ITEMSDRUGS[6].quantity)+tonumber(ITEMSDRUGS[7].quantity)+tonumber(ITEMSDRUGS[8].quantity)
        Citizen.Wait(1000)
          if ITEMSDRUGS[8].quantity > 0 then
			if tonumber(inv_qty) <= 30 then
				TriggerServerEvent("drugs:getBoursePrice", ITEMSDRUGS[8].libelle)
                TriggerServerEvent("drugs:changeBoursePrice", ITEMSDRUGS[8].libelle)
				ShowMsgtime.msg = 'En train de vendre...'
				ShowMsgtime.time = 250
				Wait(2500)
        local price = math.ceil(PriceBourse)
				ShowMsgtime.msg = '~r~-1 cocaïne ~w~/ ~r~+'..price..'$'
				ShowMsgtime.time = 150
				TriggerEvent("player:sellItem", 8, price)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 cocaïne pour vendre !")
			end
          else
            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de cocaïne !")
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

--Citizen.CreateThread(function()
--  while true do
--      Citizen.Wait(0)
--     playerPos = GetEntityCoords(GetPlayerPed(-1))
--      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.vente2.x, Positions.vente2.y, Positions.vente2.z, true)
--      if not IsInVehicle() then
--        if distance < Positions.vente.distance then
--            if isSell2 == false then
--              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~commencer à vendre~w~.", 0)
--            end
--            if isSell2 == true then
--              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~r~arrêter de vendre~w~.", 0)
--            end
--            if IsControlJustPressed(1, 38) and isSell2 == false then
--                Citizen.Wait(1)
--                isSell2 = true
--            end
--            if IsControlJustPressed(1, 38) and isSell2 == true then
--              Citizen.Wait(1)
--              isSell2 = false
--            end
--        end
--      end
--  end
--end)


--Citizen.CreateThread(function()
--  while true do
--    Citizen.Wait(0)
--    playerPos = GetEntityCoords(GetPlayerPed(-1))
--    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.vente2.x, Positions.vente2.y, Positions.vente2.z, true)
--    if distance < Positions.vente2.distance then
--      if isSell2 == true then
--        Citizen.Wait(1)
--        TriggerEvent("inventory:getQuantityDrugs")
--        Citizen.Wait(1000)
--       inv_qty = tonumber(ITEMSDRUGS[6].quantity)+tonumber(ITEMSDRUGS[7].quantity)+tonumber(ITEMSDRUGS[8].quantity)
--        Citizen.Wait(1000)
--          if ITEMSDRUGS[8].quantity > 0 then
--			if tonumber(inv_qty) <= 30 then
--				ShowMsgtime.msg = 'En train de vendre...'
--				ShowMsgtime.time = 250
--				Wait(2500)
--				ShowMsgtime.msg = '~r~-1 cocaïne ~w~/ ~r~+'..Price..'$'
--				ShowMsgtime.time = 150
--				TriggerEvent("player:sellItem", 8, Price)
--			else
--				TriggerEvent("itinerance:notif", "~r~Vous devez avoir moins de 31 feuilles de cocaïne pour vendre !")
--			end
--          else
--            TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de cocaïne !")
--            isSell2 = false
--          end
--      end
--      else
--        isSell2 = false
--      end
--    end
--end)
