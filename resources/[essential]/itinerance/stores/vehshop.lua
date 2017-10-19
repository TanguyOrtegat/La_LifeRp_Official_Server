--[[Register]]--

RegisterNetEvent('FinishMoneyCheckForVeh')
RegisterNetEvent('vehshop:spawnVehicle')

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

--[[Local/Global]]--

local vehshop = {}

RegisterNetEvent("requestshop_f")
AddEventHandler("requestshop_f",function(shop)
    vehshop = shop
end)

Citizen.CreateThread(function()
    TriggerServerEvent("requestshop")
end)

local fakecar = {model = '', car = nil}
local vehshop_locations = {{entering = {-33.803,-1102.322,25.422}, inside = {-46.56327,-1097.382,25.99875, 120.1953}, outside = {-31.849,-1090.648,25.998,322.345}}}
local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false
local vehicle_price = 0
local backlock = false
local firstspawn = 0



--[[Functions]]--

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

function IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

function ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip, 326)
			SetBlipColour(blip, 3)
			SetBlipScale(blip, 0.9)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Concessionnaire')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if vehshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 5 then
						drawTxt('Appuyer sur ~g~Entrée~s~ pour accéder au menu d\'achat',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
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

function OpenCreator()
	boughtcar = false
	local ped = LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

RegisterNetEvent("vehshop:f_GetIdentifier")
AddEventHandler("vehshop:f_GetIdentifier", function(identifier)
	vehshop.identifier = identifier
end)

function CloseCreator(name, veh, price)
	Citizen.CreateThread(function()
		Wait(1000)
		local ped = LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local name = name
			local vehicle = veh
			local price = price
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = currentlocation.pos.outside

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			personalvehicle = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)
			SetModelAsNoLongerNeeded(model)
			for i,mod in pairs(mods) do
				SetVehicleModKit(personalvehicle,0)
				SetVehicleMod(personalvehicle,i,mod)
			end
			SetVehicleOnGroundProperly(personalvehicle)
			--local plate = vehshop.identifier
			--SetVehicleNumberPlateText(personalvehicle, plate)
			local plate = GetVehicleNumberPlateText(personalvehicle)
			SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
			local id = NetworkGetNetworkIdFromEntity(personalvehicle)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
			SetVehicleColours(personalvehicle,colors[1],colors[2])
			SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),personalvehicle,-1)
			SetEntityVisible(ped,true)
			local primarycolor = colors[1]
			local secondarycolor = colors[2]
			local pearlescentcolor = extra_colors[1]
			local wheelcolor = extra_colors[2]
			TriggerServerEvent('BuyForVeh', name, vehicle, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
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
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehshop.menu
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
	local menu = vehshop.menu
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
	local menu = vehshop.menu
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

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DoesPlayerHaveVehicle(model,button,y,selected)
		local t = false
		--TODO:check if player own car
		if t then
			drawMenuRight("OWNED",vehshop.menu.x,y,selected)
		else
			drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
		end
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Vehicles" then
			OpenMenu('vehicles')
		elseif btn == "Motorcycles" then
			OpenMenu('motorcycles')
        elseif btn == "Gang" then
            if (User.subjob == 2 or User.subjob == 3 or User.subjob == 4 or User.subjob == 5 or User.subjob == 6) then
                OpenMenu('gang')
            else
            	TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
            end
        elseif btn == "Cartel" then
            if (User.subjob == 10 or User.subjob == 9 or User.subjob == 8 or User.subjob == 7) then
                OpenMenu('cartel')
            else
                TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
            end
        elseif btn == "Redneck" then
            if (User.subjob == 11 or User.subjob == 12 or User.subjob == 13 or User.subjob == 14) then
                OpenMenu('redneck')
            else
                TriggerEvent("itinerance:notif", "~r~Vous n'avez pas acces a ça")
            end
		end
	elseif this == "vehicles" then
		if btn == "Sports" then
			OpenMenu('sports')
		elseif btn == "Sedans" then
			OpenMenu('sedans')
		elseif btn == "Compacts" then
			OpenMenu('compacts')
		elseif btn == "Coupes" then
			OpenMenu('coupes')
		elseif btn == "Sports Classics" then
			OpenMenu("sportsclassics")
		elseif btn == "Super" then
			OpenMenu('super')
		elseif btn == "Muscle" then
			OpenMenu('muscle')
		elseif btn == "Off-Road" then
			OpenMenu('offroad')
		elseif btn == "SUVs" then
			OpenMenu('suvs')
		elseif btn == "Vans" then
			OpenMenu('vans')
		end
	elseif this == "compacts" or this == "coupes" or this == "sedans" or this == "sports" or this == "sportsclassics" or this == "super" or this == "muscle" or this == "offroad" or this == "suvs" or this == "vans" or this == "industrial" or this == "cycles" or this == "motorcycles" or this == "gang" or this == "cartel" or this == "redneck" then
		TriggerServerEvent('CheckMoneyForVeh',button.name, button.model, button.costs)
	end
end

function OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "vehicles" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
    elseif menu == "gang"  then
        vehshop.lastmenu = "main"
    elseif menu == "cartel"  then
        vehshop.lastmenu = "main"
    elseif menu == "redneck"  then
        vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		CloseCreator()
	elseif vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" or vehshop.currentmenu == "gang" or vehshop.currentmenu == "cartel" or vehshop.currentmenu == "redneck" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
end

--[[Citizen]]--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				CloseCreator()
			else
				TriggerServerEvent("vehshop:GetIdentifier")
				OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			drawTxt(vehshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" or vehshop.currentmenu == "gang" or vehshop.currentmenu == "cartel" or vehshop.currentmenu == "redneck" then
							DoesPlayerHaveVehicle(button.model,button,y,selected)
						else
						drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" or vehshop.currentmenu == "gang" or vehshop.currentmenu == "cartel" or vehshop.currentmenu == "redneck" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)
									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)

								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
								while not DoesEntityExist(veh) do
									Citizen.Wait(0)
									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)
								end
								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								--SetEntityCollision(veh,false,false)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakecar = { model = button.model, car = veh}
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if vehshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)

AddEventHandler('FinishMoneyCheckForVeh', function(name, vehicle, price)
	local name = name
	local vehicle = vehicle
	local price = price
	boughtcar = true
	CloseCreator(name, vehicle, price)
end)

AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 225
	ShowVehshopBlips(true)
	firstspawn = 1
end
end)

AddEventHandler('vehshop:spawnVehicle', function(v)
	local car = GetHashKey(v)
	local playerPed = GetPlayerPed(-1)
	if playerPed and playerPed ~= -1 then
		RequestModel(car)
		while not HasModelLoaded(car) do
				Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)
		veh = CreateVehicle(car, playerCoords, 0.0, true, false)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, true)
		SetEntityAsMissionEntity(veh, true, true)
	end
end)

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		RemoveIpl('v_carshowroom')
		RemoveIpl('shutter_open')
		RemoveIpl('shutter_closed')
		RemoveIpl('shr_int')
		RemoveIpl('csr_inMission')
		RequestIpl('v_carshowroom')
		RequestIpl('shr_int')
		RequestIpl('shutter_closed')
		firstspawn = 1
	end
end)

RegisterNetEvent("vmenu:setUser")
AddEventHandler("vmenu:setUser", function(infos)
    for k,v in pairs(infos) do
        User[k] = v
    end
end)
