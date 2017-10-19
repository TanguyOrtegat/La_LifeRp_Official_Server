--NOTE: Dans l attente de la suppression des armes à la mort du joueur pour activer les armes du DLC. Si vous voulez ajouter une arme, vous n'avez qu'à enlever les "--" et pour les prix "costs = 'PRIX'"
local cshop = {}
local cshopf = {}


local cshop_locations = {
  {entering = {1696.5310058594, 4828.109375, 42.063121795654}, inside = {1696.5310058594, 4828.109375, 42.063121795654}, outside = {1696.5310058594, 4828.109375, 42.063121795654}},
  {entering = {-162.85632324219, -303.03753662109, 39.733276367188}, inside = {-162.85632324219, -303.03753662109, 39.733276367188}, outside = {-162.85632324219, -303.03753662109, 39.733276367188}},
  {entering = {72.531211853027, -1396.3240966797, 29.376146316528}, inside = {72.531211853027, -1396.3240966797, 29.376146316528}, outside = {72.531211853027, -1396.3240966797, 29.376146316528}},
}

local cshop_blips = {}
local inrangeofcshop = false
local currentlocation = nil

function LocalPed()
  return GetPlayerPed(-1)
end

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

function IsPlayerInRangeOfcshop()
  return inrangeofcshop
end

function ShowCshopBlips(bool)
  if bool and #cshop_blips == 0 then
    for station,pos in pairs(cshop_locations) do
      local loc = pos
      pos = pos.entering
      local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
      -- 60 58 137
      SetBlipSprite(blip, 73)
      SetBlipColour(blip, 3)
      SetBlipScale(blip, 0.9)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Magasin de vêtements')
      EndTextCommandSetBlipName(blip)
      SetBlipAsShortRange(blip,true)
      SetBlipAsMissionCreatorBlip(blip,true)
      table.insert(cshop_blips, {blip = blip, pos = loc})
    end
    Citizen.CreateThread(function()
      while #cshop_blips > 0 do
        Citizen.Wait(0)
        local inrange = false
        for i,b in ipairs(cshop_blips) do
          if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and cshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 2 then
            ShowInfoP("Appuyez sur ~INPUT_CONTEXT~ ~w~pour ~b~acheter des habits~w~.", 0)
            currentlocation = b
            inrange = true
          end
        end
        inrangeofcshop = inrange
      end
    end)
  elseif bool == false and #cshop_blips > 0 then
    for i,b in ipairs(cshop_blips) do
      if DoesBlipExist(b.blip) then
        SetBlipAsMissionCreatorBlip(b.blip,false)
        Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
      end
    end
    cshop_blips = {}
  end
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
  ShowCshopBlips(true)
  firstspawn = 1
end
end)


function ShowInfoP(text, state)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function f(n)
	return n + 0.0001
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

--local veh = nil
function OpenCreator()
	cshop.currentmenu = "main"
	cshop.opened = true
	cshop.selectedbutton = 1
end

function CloseCreator()
	Citizen.CreateThread(function()
		cshop.opened = false
	  cshop.menu.from = 1
	  cshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = cshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.title)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = cshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
	local menu = cshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
local menu = cshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuTitleColors(txt,x,y)
  local menu = cshopcolors.menu
  SetTextFont(2)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawRect(x,y,menu.width,menu.height,0,0,0,150)
  DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function DoesPlayerHaveCloth(button,y,selected, source)
	drawMenuRight(button.costs.." $",cshop.menu.x, y, selected)
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if(cshop.opened) then
			FreezeEntityPosition(GetPlayerPed(-1), true)
		else
			FreezeEntityPosition(GetPlayerPed(-1), false)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,38) and IsPlayerInRangeOfcshop() then
		if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			if cshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
	  end
	  if GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
      if cshopf.opened then
        CloseCreatorF()
      else
        OpenCreatorF()
      end
    end
			if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			 Citizen.Trace("HOMME")
			elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
			 Citizen.Trace("FEMME")
			end
		end
		if cshop.opened then
			local ped = LocalPed()
			local menu = cshop.menu[cshop.currentmenu]
			drawTxt(cshop.title,1,1,cshop.menu.x,cshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, cshop.menu.x,cshop.menu.y + 0.08)
			drawTxt(cshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,cshop.menu.x + cshop.menu.width/2 - 0.0385,cshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = cshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= cshop.menu.from and i <= cshop.menu.to then

					if i == cshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,cshop.menu.x,y,selected)
					if button.costs ~= nil then
						DoesPlayerHaveCloth(button,y,selected,ped)
					end
					y = y + 0.04
					if cshop.currentmenu == "Chapeaux" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 0, button.hat, button.hat_text[1], 0)
            end
          end
		  if cshop.currentmenu == "Casque" then
	if selected then
		SetPedPropIndex(GetPlayerPed(-1), 0, button.casque, button.casque_text[1], 0)
	end
  end
          if cshop.currentmenu == "Lunettes" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 1, button.glass, button.glass_text[1], 0)
            end
          end
					if cshop.currentmenu == "Hauts" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 8, button.shirt, button.shirt_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
            end
          end
          if cshop.currentmenu == "Cravates" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 7, button.seven, button.seven_text[1], 0)
            end
          end
          if cshop.currentmenu == "Montres" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 6, button.watch, button.watch_text[1], 0)
            end
          end
          if cshop.currentmenu == "Pantalons" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 4, button.pants, button.pants_text[1], 0)
            end
          end
          if cshop.currentmenu == "Chaussures" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 6, button.shoes, button.shoes_text[1], 0)
            end
          end
          if cshop.currentmenu == "Couleurs" then
            if selected then
              if button.type_str == "Haut" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text, 0)
              end
              if button.type_str == "Montre" or "Lunettes" or "Chapeaux" or "Casque" then
                SetPedPropIndex(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
              if button.type_str == "Pantalon" or "Chaussure" or "Cravate" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
            end
          end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if cshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustPressed(1,188) then
				if cshop.selectedbutton > 1 then
					cshop.selectedbutton = cshop.selectedbutton -1
					if buttoncount > 10 and cshop.selectedbutton < cshop.menu.from then
						cshop.menu.from = cshop.menu.from -1
						cshop.menu.to = cshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if cshop.selectedbutton < buttoncount then
					cshop.selectedbutton = cshop.selectedbutton +1
					if buttoncount > 10 and cshop.selectedbutton > cshop.menu.to then
						cshop.menu.to = cshop.menu.to + 1
						cshop.menu.from = cshop.menu.from + 1
					end
				end
			end
    end
	end
end)

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

local Tab = {}

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = cshop.currentmenu
	local btn = button.name
	if this == "main" then
	  if btn == "Chapeaux" then
      OpenMenu('Chapeaux')
    elseif btn == "Lunettes" then
      OpenMenu('Lunettes')
  elseif btn == "Casque" then
	OpenMenu('Casque')
		elseif btn == "Hauts" then
			OpenMenu('Hauts')
		elseif btn == "Cravates" then
			OpenMenu('Cravates')
	  elseif btn == "Montres" then
      OpenMenu('Montres')
		elseif btn == "Pantalons" then
      OpenMenu('Pantalons')
    elseif btn == "Chaussures" then
      OpenMenu('Chaussures')
		end
	elseif this == "Chapeaux" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.hat_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chapeau", type = 0, slot = button.hat, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
elseif this == "Casque" then
cshop.menu.Couleurs.buttons = {}
for i, v in ipairs(button.casque_text) do
  table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Casque", type = 0, slot = button.casque, text = v, costs = button.costs})
end
Wait(100)
OpenMenu('Couleurs')
  elseif this == "Lunettes" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.glass_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Lunettes", type = 1, slot = button.glass, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
	elseif this == "Hauts" then
	  cshop.menu.Couleurs.buttons = {}
	  for i, v in ipairs(button.torso_text) do
	   for j, w in ipairs(button.shirt_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i.."-"..j, type_str = "Haut", type = 8, torso = button.torso, torso_text = v, slot = button.shirt, text = w, three = button.three, three_text = button.three_text, costs = button.costs})
     end
    end
    Wait(100)
    OpenMenu('Couleurs')
	elseif this == "Cravates" then
	  cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.seven_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Cravate", type = 7, slot = button.seven, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Montres" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.watch_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Montre", type = 6, slot = button.watch, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Pantalons" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.pants_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Pantalon", type = 4, slot = button.pants, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Chaussures" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.shoes_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chaussure", type = 6, slot = button.shoes, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Couleurs" then
    if button.type == 8 then
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text, button.torso, button.torso_text, button.three, button.three_text})
    else
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text})
    end
	end
end

function OpenMenu(menu)
	cshop.lastmenu = cshop.currentmenu
	cshop.menu.from = 1
	cshop.menu.to = 10
	cshop.selectedbutton = 1
	cshop.currentmenu = menu
end

function Back()
  if cshop.currentmenu == "main" then
    CloseCreator()
    TriggerServerEvent("cshop:reloadOutfits_s")
  else
    OpenMenu("main")
    TriggerServerEvent("cshop:reloadOutfits_s")
  end
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

-----------------------------------------------------------------------------------
-----------------------------------------FEMME-------------------------------------
-----------------------------------------------------------------------------------

function drawTxtF(text,font,centre,x,y,scale,r,g,b,a)
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

--local veh = nil
function OpenCreatorF()
  cshopf.currentmenu = "main"
  cshopf.opened = true
  cshopf.selectedbutton = 1
end

function CloseCreatorF()
  Citizen.CreateThread(function()
    cshopf.opened = false
    cshopf.menu.from = 1
    cshopf.menu.to = 10
  end)
end

function drawMenuButtonF(button,x,y,selected)
  local menuf = cshopf.menu
  SetTextFont(menuf.font)
  SetTextProportional(0)
  SetTextScale(menuf.scale, menuf.scale)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(button.title)
  if selected then
    DrawRect(x,y,menuf.width,menuf.height,255,255,255,255)
  else
    DrawRect(x,y,menuf.width,menuf.height,0,0,0,150)
  end
  DrawText(x - menuf.width/2 + 0.005, y - menuf.height/2 + 0.0028)
end

function drawMenuRightF(txt,x,y,selected)
  local menuf = cshopf.menu
  SetTextFont(menuf.font)
  SetTextProportional(0)
  SetTextScale(menuf.scale, menuf.scale)
  SetTextRightJustify(1)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawText(x + menuf.width/2 - 0.03, y - menuf.height/2 + 0.0028)
end

function drawMenuTitleF(txt,x,y)
local menuf = cshopf.menu
  SetTextFont(2)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawRect(x,y,menuf.width,menuf.height,0,0,0,150)
  DrawText(x - menuf.width/2 + 0.005, y - menuf.height/2 + 0.0028)
end

function DoesPlayerHaveClothF(button,y,selected, source)
  drawMenuRightF(button.costs.." $",cshopf.menu.x, y, selected)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if cshopf.opened then
      local ped = LocalPed()
      local menuf = cshopf.menu[cshopf.currentmenu]
      drawTxtF(cshopf.title,1,1,cshopf.menu.x,cshopf.menu.y,1.0, 255,255,255,255)
      drawMenuTitleF(menuf.title, cshopf.menu.x,cshopf.menu.y + 0.08)
      drawTxtF(cshopf.selectedbutton.."/"..tablelength(menuf.buttons),0,0,cshopf.menu.x + cshopf.menu.width/2 - 0.0385,cshopf.menu.y + 0.067,0.4, 255,255,255,255)
      local y = cshopf.menu.y + 0.12
      buttoncountf = tablelength(menuf.buttons)
      local selectedf = false

      for i,button in pairs(menuf.buttons) do
        if i >= cshopf.menu.from and i <= cshopf.menu.to then

          if i == cshopf.selectedbutton then
            selectedf = true
          else
            selectedf = false
          end
          drawMenuButtonF(button,cshopf.menu.x,y,selectedf)
          if button.costs ~= nil then
            DoesPlayerHaveClothF(button,y,selectedf,ped)
          end
          y = y + 0.04
          if cshopf.currentmenu == "Chapeaux" then
            if selectedf then
                SetPedPropIndex(GetPlayerPed(-1), 0, button.hat, button.hat_text[1], 0)
            end
          end
		  if cshopf.currentmenu == "Casque" then
			if selectedf then
				SetPedPropIndex(GetPlayerPed(-1), 0, button.casque, button.casque_text[1], 0)
			end
		  end
          if cshopf.currentmenu == "Lunettes" then
            if selectedf then
                SetPedPropIndex(GetPlayerPed(-1), 1, button.glass, button.glass_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Hauts" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 8, button.shirt, button.shirt_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
            end
          end
          if cshopf.currentmenu == "Cravates" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 7, button.seven, button.seven_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Montres" then
            if selectedf then
                SetPedPropIndex(GetPlayerPed(-1), 6, button.watch, button.watch_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Pantalons" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 4, button.pants, button.pants_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Chaussures" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 6, button.shoes, button.shoes_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Couleurs" then
            if selectedf then
             if button.type_str == "Haut" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text, 0)
              end
              if button.type_str == "Montre" or "Lunettes" or "Chapeaux" or "Casque" then
                SetPedPropIndex(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
              if button.type_str == "Pantalon" or "Chaussure" or "Cravate" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
            end
          end
          if selectedf and IsControlJustPressed(1,201) then
            ButtonSelectedF(button)
          end
        end
      end
    end
    if cshopf.opened then
      if IsControlJustPressed(1,202) then
        BackF()
      end
      if IsControlJustPressed(1,188) then
        if cshopf.selectedbutton > 1 then
          cshopf.selectedbutton = cshopf.selectedbutton -1
          if buttoncountf > 10 and cshopf.selectedbutton < cshopf.menu.from then
            cshopf.menu.from = cshopf.menu.from -1
            cshopf.menu.to = cshopf.menu.to - 1
          end
        end
      end
      if IsControlJustPressed(1,187)then
        if cshopf.selectedbutton < buttoncountf then
          cshopf.selectedbutton = cshopf.selectedbutton +1
          if buttoncountf > 10 and cshopf.selectedbutton > cshopf.menu.to then
            cshopf.menu.to = cshopf.menu.to + 1
            cshopf.menu.from = cshopf.menu.from + 1
          end
        end
      end
    end
  end
end)

function ButtonSelectedF(button)
  local pedf = GetPlayerPed(-1)
  local thisf = cshopf.currentmenu
  local btnf = button.name
  if thisf == "main" then
    if btnf == "Chapeaux" then
      OpenMenuF('Chapeaux')
	elseif btnf == "Casque" then
		OpenMenuF('Casque')
    elseif btnf == "Lunettes" then
      OpenMenuF('Lunettes')
    elseif btnf == "Hauts" then
      OpenMenuF('Hauts')
    elseif btnf == "Cravates" then
      OpenMenuF('Cravates')
    elseif btnf == "Montres" then
      OpenMenuF('Montres')
    elseif btnf == "Pantalons" then
      OpenMenuF('Pantalons')
    elseif btnf == "Chaussures" then
      OpenMenuF('Chaussures')
    end
  elseif thisf == "Chapeaux" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.hat_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chapeau", type = 0, slot = button.hat, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
elseif thisf == "Casque" then
  cshopf.menu.Couleurs.buttons = {}
  for i, v in ipairs(button.casque_text) do
	table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Casque", type = 0, slot = button.casque, text = v, costs = button.costs})
  end
  Wait(100)
  OpenMenuF('Couleurs')
  elseif thisf == "Lunettes" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.glass_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Lunettes", type = 1, slot = button.glass, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Hauts" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.torso_text) do
     for j, w in ipairs(button.shirt_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i.."-"..j, type_str = "Haut", type = 8, torso = button.torso, torso_text = v, slot = button.shirt, text = w, three = button.three, three_text = button.three_text, costs = button.costs})
     end
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Cravates" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.seven_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Cravate", type = 7, slot = button.seven, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Montres" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.watch_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Montre", type = 6, slot = button.watch, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Pantalons" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.pants_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Pantalon", type = 4, slot = button.pants, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Chaussures" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.shoes_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chaussure", type = 6, slot = button.shoes, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Couleurs" then
    if button.type == 8 then
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text, button.torso, button.torso_text, button.three, button.three_text})
    else
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text})
    end
  end
end

function OpenMenuF(menu)
  cshopf.lastmenu = cshopf.currentmenu
  cshopf.menu.from = 1
  cshopf.menu.to = 10
  cshopf.selectedbutton = 1
  cshopf.currentmenu = menu
end

function BackF()
  if cshopf.currentmenu == "main" then
    CloseCreatorF()
    TriggerServerEvent("cshop:reloadOutfits_s")
  else
    OpenMenuF("main")
    TriggerServerEvent("cshop:reloadOutfits_s")
  end
end

RegisterNetEvent("cshop:reloadOutfits")
AddEventHandler("cshop:reloadOutfits", function(pants, pants_text, shoes, shoes_text, torso, torso_text, shirt, shirt_text, three, three_text, seven, seven_text, hat, hat_text, glass, glass_text, watch, watch_text)
  SetPedComponentVariation(GetPlayerPed(-1), 3, three, three_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 7, seven, seven_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 4, pants, pants_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 6, shoes, shoes_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 8, shirt, shirt_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 11, torso, torso_text, 0)
  SetPedPropIndex(GetPlayerPed(-1), 0, hat, hat_text, 0)
  SetPedPropIndex(GetPlayerPed(-1), 1, glass, glass_text, 0)
  --SetPedComponentVariation(GetPlayerPed(-1), 6, watch, watch_text, 0)
end)

Citizen.CreateThread(function()
	TriggerServerEvent("resquestmenu")
end)

RegisterNetEvent("requestmenu_f")
AddEventHandler("requestmenu_f", function(menuh,menuf)
	Citizen.Trace("hello hello")
	cshop = menuh
	cshopf = menuf
end)
