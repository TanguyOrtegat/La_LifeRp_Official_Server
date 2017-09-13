--[[Register]]--

RegisterNetEvent("garages:getVehicles")
RegisterNetEvent('garages:SpawnVehicle')
RegisterNetEvent('garages:StoreVehicleTrue')
RegisterNetEvent('garages:StoreVehicleFalse')
RegisterNetEvent('garages:SelVehicle')

local vehicule = {"verlierer2",
"schafter3",
"schafter4",
"seven70",
"bestiagts",
"lynx",
"omnis",
"tropos",
"tampa2",
"raptor",
"jester",
"alpha",
"massacro",
"buffalo3",
"blista2",
"blista3",
"furoregt",
"kuruma",
"kuruma2",
"ninef",
"ninef2",
"banshee",
"buffalo",
"buffalo2",
"carbonizzare",
"comet2",
"coquette",
"elegy2",
"feltzer2",
"fusilade",
"futo",
"khamelion",
"penumbra",
"rapidgt",
"rapidgt2",
"schwarzer",
"sultan",
"surano",
"sultanrs",
"banshee2",
"fmj",
"pfister811",
"prototipo",
"reaper",
"tyrus",
"sheava",
"le7b",
"turismor",
"zentorno",
"bullet",
"cheetah",
"entityxf",
"infernus",
"adder",
"voltic",
"vacca",
"osiris",
"t20",
"limo2",
"schafter5",
"schafter6",
"cog55",
"cog552",
"cognoscenti",
"cognoscenti2",
"warrener",
"glendale",
"asea",
"asea2",
"asterope",
"emperor",
"emperor2",
"emperor3",
"fugitive",
"ingot",
"intruder",
"premier",
"primo",
"regina",
"romero",
"schafter2",
"stanier",
"stratum",
"superd",
"surge",
"tailgater",
"washington",
"stretch",
"tanker2",
"boattrailer",
"armytanker",
"armytrailer",
"armytrailer2",
"freighttrailer",
"airtug",
"caddy",
"caddy2",
"docktug",
"forklift",
"mower",
"proptrailer",
"ripley",
"sadler",
"sadler2",
"scrap",
"tractor",
"tractor2",
"tractor3",
"graintrailer",
"baletrailer",
"towtruck",
"towtruck2",
"utillitruck",
"utillitruck2",
"utillitruck3",
"docktrailer",
"trailers",
"trailers2",
"trailers3",
"tvtrailer",
"raketrailer",
"tanker",
"trailerlogs",
"tr2",
"tr3",
"tr4",
"trflat",
"trailersmall",
"ambulance",
"policet",
"fbi",
"fbi2",
"firetruk",
"lguard",
"pbus",
"police",
"police4",
"police2",
"police3",
"policeold1",
"policeold2",
"pranger",
"riot",
"sheriff",
"sheriff2",
"policeb",
"brioso",
"rhapsody",
"panto",
"blista",
"dilettante",
"dilettante2",
"issi2",
"prairie",
"brickade",
"rallytruck",
"trash2",
"bus",
"coach",
"airbus",
"rentalbus",
"taxi",
"trash",
"tourbus",
"barracks3",
"barracks",
"barracks2",
"crusader",
"rhino",
"baller3",
"baller4",
"baller5",
"baller6",
"xls",
"xls2",
"contender",
"huntley",
"baller",
"baller2",
"bjxl",
"cavalcade",
"cavalcade2",
"gresley",
"dubsta",
"dubsta2",
"fq2",
"granger",
"habanero",
"landstalker",
"mesa",
"mesa2",
"patriot",
"radi",
"rocoto",
"seminole",
"serrano",
"mule3",
"benson",
"biff",
"hauler",
"mule",
"mule2",
"packer",
"phantom",
"pounder",
"stockade",
"stockade3",
"trophytruck",
"trophytruck2",
"blazer4",
"dubsta3",
"monster",
"marshall",
"insurgent",
"insurgent2",
"technical",
"bfinjection",
"blazer",
"blazer2",
"blazer3",
"bodhi2",
"dune",
"dune2",
"dloader",
"mesa3",
"rancherxl",
"rancherxl2",
"rebel",
"rebel2",
"sandking",
"sandking2",
"brawler",
"rumpo3",
"youga2",
"boxville4",
"gburrito2",
"bison",
"bison2",
"bison3",
"boxville",
"boxville2",
"boxville3",
"bobcatxl",
"burrito",
"burrito2",
"burrito3",
"burrito4",
"burrito5",
"gburrito",
"camper",
"journey",
"minivan",
"pony",
"pony2",
"rumpo",
"rumpo2",
"speedo",
"speedo2",
"surfer",
"surfer2",
"taco",
"youga",
"minivan2",
"nightshade",
"blade",
"dukes",
"dukes2",
"dominator2",
"gauntlet2",
"stalion",
"stalion2",
"slamvan2",
"buccaneer",
"hotknife",
"dominator",
"gauntlet",
"phoenix",
"picador",
"ratloader",
"ruiner",
"sabregt",
"voodoo2",
"vigero",
"virgo",
"coquette3",
"chino",
"faction3",
"sabregt2",
"slamvan3",
"virgo2",
"virgo3",
"guardian",
"bulldozer",
"cutter",
"dump",
"rubble",
"flatbed",
"handler",
"mixer",
"mixer2",
"tiptruck",
"tiptruck2",
"nimbus",
"vestra",
"miljet",
"besra",
"dodo",
"blimp2",
"velum2",
"hydra",
"velum2",
"blimp",
"cuban800",
"duster",
"stunt",
"mammatus",
"jet",
"shamal",
"luxor",
"titan",
"lazer",
"cargoplane",
"velum",
"luxor2",
"cargobob4",
"supervolito",
"supervolito2",
"valkyrie2",
"volatus",
"swift",
"savage",
"valkyrie",
"annihilator",
"buzzard",
"buzzard2",
"cargobob",
"cargobob2",
"cargobob3",
"skylift",
"polmav",
"maverick",
"frogger",
"frogger2",
"swift2",
"gargoyle",
"cliffhanger",
"bf400",
"faggio3",
"faggio",
"vortex",
"avarus",
"sanctus",
"hakuchou2",
"nightblade",
"chimera",
"esskey",
"wolfsbane",
"zombiea",
"zombieb",
"defiler",
"daemon2",
"ratbike",
"shotaro",
"manchez",
"thrust",
"sovereign",
"innovation",
"hakuchou",
"enduro",
"lectro",
"sanchez",
"sanchez2",
"akuma",
"carbonrs",
"bagger",
"bati",
"bati2",
"ruffian",
"daemon",
"double",
"pcj",
"vader",
"faggio2",
"hexer",
"nemesis",
"vindicator",
"cablecar",
"freightcar",
"freight",
"freightcont1",
"freightcont2",
"freightgrain",
"tankercar",
"metrotrain",
"windsor2",
"cogcabrio",
"exemplar",
"f620",
"felon",
"felon2",
"Jackal",
"oracle",
"oracle2",
"sentinel",
"sentinel2",
"zion",
"zion2",
"windsor",
"mamba",
"tornado6",
"btype",
"pigalle",
"coquette2",
"casco",
"jb700",
"manana",
"monroe",
"peyote",
"stinger",
"stingergt",
"tornado",
"tornado2",
"tornado3",
"tornado4",
"ztype",
"feltzer3",
"tornado5",
"scorcher",
"tribike",
"tribike2",
"tribike3",
"fixter",
"cruiser",
"BMX",
"toro2",
"seashark3",
"dinghy4",
"tropic2",
"speeder2",
"tug",
"submersible2",
"dinghy3",
"squalo",
"marquis",
"dinghy",
"dinghy2",
"jetmax",
"predator",
"tropic",
"seashark",
"seashark2",
"submersible",
"suntrap",
"toro",
}

--[[Local/Global]]--

VEHICLES = {}

local vente_location = {-45.228, -1083.123, 25.816}
local inrangeofgarage = false

local garages = {
	{name="Garage", colour=3, scale=0.9, id=357, x=215.124, y=-791.377, z=29.646},
	{name="Garage", colour=3, scale=0.9, id=357, x=-334.685, y=289.773, z=84.705},
	{name="Garage", colour=3, scale=0.9, id=357, x=-55.272, y=-1838.71, z=25.442},
	{name="Garage", colour=3, scale=0.9, id=357, x=126.434, y=6610.04, z=30.750},
	{name="Garage", colour=3, scale=0.9, id=357, x=-956.405, y=-2704.759, z=13.831}
}
garageSelected = { {x=nil, y=nil, z=nil}, }



--[[Functions]]--

function MenuGarage()
	ped = GetPlayerPed(-1);
	MenuTitle = "Garage"
	ClearMenu()
	Menu.addButton("Rentrer le véhicule","RentrerVehicule",nil)
	Menu.addButton("Sortir un véhicule","ListeVehicule",nil)
	Menu.addButton("Fermer","CloseMenu",nil)
end

function RentrerVehicule()
	Citizen.CreateThread(function()
		local caissei = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
		local model = ""
		local damage = GetVehicleEngineHealth(caissei)
		Citizen.Trace(damage)
		SetEntityAsMissionEntity(caissei, true, true)
		for _, car in pairs(vehicule) do
			if IsVehicleModel(caissei,car) then
				model = car
			end
		end
		local plate = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then
			TriggerServerEvent('garages:CheckForVeh', plate,model,damage)
		else
			drawNotification("Aucun véhicule présent")
		end
	end)
	CloseMenu()
end

function ListeVehicule()
	TriggerServerEvent("garages:CheckGarageForVeh")
	Wait(200)
	ped = GetPlayerPed(-1);
	MenuTitle = "Mes vehicules :"
	ClearMenu()
	for ind, value in pairs(VEHICLES) do
		Menu.addButton(tostring(value.vehicle_name) .. " : " .. tostring(value.vehicle_state), "OptionVehicle", value.id)
	end
	Menu.addButton("Retour","MenuGarage",nil)
end

function OptionVehicle(vehID)
	local vehID = vehID
	MenuTitle = "Options :"
	ClearMenu()
	Menu.addButton("Sortir", "SortirVehicule", vehID)
	--Menu.addButton("Supprimer", "SupprimerVehicule", vehID)
	Menu.addButton("Retour", "ListeVehicule", nil)
end

function SortirVehicule(vehID)
	local vehID = vehID
	TriggerServerEvent('garages:CheckForSpawnVeh', vehID)
	CloseMenu()
end

--[[
function SupprimerVehicule(vehID)
local vehID = vehID
TriggerServerEvent('garages:CheckForDelVeh', vehID)
Menu.addButton("Fermer","CloseMenu",nil)
end
]]--

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function CloseMenu()
	Menu.hidden = true
end

function LocalPed()
	return GetPlayerPed(-1)
end

function IsPlayerInRangeOfGarage()
	return inrangeofgarage
end

function Chat(debugg)
	TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
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



--[[Citizen]]--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, garage in pairs(garages) do
			DrawMarker(1, garage.x, garage.y, garage.z, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and IsPedInAnyVehicle(LocalPed(), true) == false then
				drawTxt("~g~E~s~ pour ouvrir le menu",0,1,0.5,0.8,0.6,255,255,255,255)
				if IsControlJustPressed(1, 86) then
					garageSelected.x = garage.x
					garageSelected.y = garage.y
					garageSelected.z = garage.z
					MenuGarage()
					Menu.hidden = not Menu.hidden
				end
				Menu.renderGUI()
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local near = false
		Citizen.Wait(0)
		for _, garage in pairs(garages) do
			if (GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 3 and near ~= true) then
				near = true
			end
		end
		if near == false then
			Menu.hidden = true;
		end
	end
end)

Citizen.CreateThread(function()
	for _, item in pairs(garages) do
		item.blip = AddBlipForCoord(item.x, item.y, item.z)
		SetBlipSprite(item.blip, item.id)
		SetBlipAsShortRange(item.blip, true)
		SetBlipColour(item.blip, item.colour)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(item.name)
		EndTextCommandSetBlipName(item.blip)
	end
end)

Citizen.CreateThread(function()
	local loc = vente_location
	pos = vente_location
	-- local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
	-- SetBlipSprite(blip,207)
	-- SetBlipColour(blip, 3)
	-- BeginTextCommandSetBlipName("STRING")
	-- AddTextComponentString(ventenamefr)
	-- EndTextCommandSetBlipName(blip)
	-- SetBlipAsShortRange(blip,true)
	-- SetBlipAsMissionCreatorBlip(blip,true)
	checkgarage = 0
	while true do
		Wait(0)
		DrawMarker(1,vente_location[1],vente_location[2],vente_location[3],0,0,0,0,0,0,3.001,3.0001,0.5001,0,155,255,200,0,0,0,0)
		if GetDistanceBetweenCoords(vente_location[1],vente_location[2],vente_location[3],GetEntityCoords(LocalPed())) < 5 and IsPedInAnyVehicle(LocalPed(), true) == false then
			drawTxt("~g~E~s~ pour vendre le véhicule à 50% du prix d\'achat",0,1,0.5,0.8,0.6,255,255,255,255)
			if IsControlJustPressed(1, 86) then
				local caissei = GetClosestVehicle(vente_location[1],vente_location[2],vente_location[3], 3.000, 0, 70)
				SetEntityAsMissionEntity(caissei, true, true)
				local platecaissei = GetVehicleNumberPlateText(caissei)
				if DoesEntityExist(caissei) then
					TriggerServerEvent('garages:CheckForSelVeh', platecaissei)
				else
					drawNotification("Aucun véhicule présent")
				end
			end
		end
	end
end)

--[[Events]]--

AddEventHandler("garages:getVehicles", function(THEVEHICLES)
	VEHICLES = {}
	VEHICLES = THEVEHICLES
end)

AddEventHandler("playerSpawned", function()

end)

AddEventHandler('garages:SpawnVehicle', function(vehicle, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor,damage)
	local car = GetHashKey(vehicle)
	local plate = plate
	local state = state
	local primarycolor = tonumber(primarycolor)
	local secondarycolor = tonumber(secondarycolor)
	local pearlescentcolor = tonumber(pearlescentcolor)
	local wheelcolor = tonumber(wheelcolor)
	Citizen.CreateThread(function()
		Citizen.Wait(3000)
		local caisseo = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
		if DoesEntityExist(caisseo) then
			drawNotification("La zone est encombrée")
		else
			if state == "Sorti" then
				drawNotification("Ce véhicule n'est pas dans le garage")
			else
				local mods = {}
				for i = 0,24 do
					mods[i] = GetVehicleMod(veh,i)
				end
				RequestModel(car)
				while not HasModelLoaded(car) do
					Citizen.Wait(0)
				end
				veh = CreateVehicle(car, garageSelected.x, garageSelected.y, garageSelected.z, 0.0, true, false)
				for i,mod in pairs(mods) do
					SetVehicleModKit(personalvehicle,0)
					SetVehicleMod(personalvehicle,i,mod)
				end
				SetVehicleNumberPlateText(veh, plate)
				SetVehicleOnGroundProperly(veh)
				SetVehicleHasBeenOwnedByPlayer(veh,true)
				local id = NetworkGetNetworkIdFromEntity(veh)
				SetNetworkIdCanMigrate(id, true)
				SetVehicleColours(veh, primarycolor, secondarycolor)
				SetVehicleExtraColours(veh, pearlescentcolor, wheelcolor)
				SetEntityInvincible(veh, false)
				SetEntityAsMissionEntity(veh, true, true)
				SetVehicleIsConsideredByPlayer(veh, true)
				SetVehicleEngineHealth(veh,damage)
				drawNotification("Véhicule sorti")
				TriggerServerEvent('garages:SetVehOut', vehicle, plate, car)
				TriggerServerEvent("garages:CheckGarageForVeh")
			end
		end
	end)
end)

AddEventHandler('garages:StoreVehicleTrue', function()
	Citizen.CreateThread(function()
		Citizen.Wait(1000)
		local caissei = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
		SetEntityAsMissionEntity(caissei, true, true)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
		drawNotification("Véhicule rentré")
		TriggerServerEvent("garages:CheckGarageForVeh")
	end)
end)

AddEventHandler('garages:StoreVehicleFalse', function()
	drawNotification("Ce n'est pas ton véhicule")
end)

AddEventHandler('garages:SelVehicle', function(vehicle, plate)
	local car = GetHashKey(vehicle)
	local plate = plate
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		local caissei = GetClosestVehicle(vente_location[1],vente_location[2],vente_location[3], 3.000, 0, 70)
		SetEntityAsMissionEntity(caissei, true, true)
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then
			if plate ~= platecaissei then
				drawNotification("Ce n'est pas ton véhicule")
			else
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
				TriggerServerEvent('garages:SelVeh', plate, vehicle)
				TriggerServerEvent("garages:CheckGarageForVeh")
			end
		else
			drawNotification("Aucun véhicule présent")
		end
	end)
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
