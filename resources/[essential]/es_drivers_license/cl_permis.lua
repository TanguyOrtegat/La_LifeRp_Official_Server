local permis = {
	opened = false,
	title = "permis",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 155, g = 155, b = 255, a = 200, type = 1 },
}
local permis_locations = {
{entering = {249.7434,-1512.085,28.04321}, inside = {38.34729,-969.293,29.09835}, outside = {249.7434,-1512.085,28.34321}},
}

local permis_blips ={}
local inrangeofpermis = false
local currentlocation = nil

local function LocalPed()
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

function IsPlayerInRangeOfpermis()
return inrangeofpermis
end

function ShowpermisBlips(bool)
	if bool and #permis_blips == 0 then
		for station,pos in pairs(permis_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			SetBlipSprite(blip, 267)
			SetBlipColour(blip, 64)
			SetBlipScale(blip, 0.8)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Auto-école')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(permis_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #permis_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(permis_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and permis.opened == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed()),true) > 0 then
						DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						currentlocation = b
						if GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed()),true) < 4 and IsPedInAnyVehicle(LocalPed(), true) == false then
							ShowInfoPermis("Appuyez sur ~INPUT_CONTEXT~ ~w~pour passer votre ~b~permis de conduire~w~.", 0)
							inrange = true
						end
					end
				end
				inrangeofpermis = inrange
			end
		end)
	elseif bool == false and #permis_blips > 0 then
		for i,b in ipairs(permis_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		permis_blips = {}
	end
end


function ShowInfoPermis(text, state)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


function DrawMissionText2(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

onPermis = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1,38) and inrangeofpermis then
            TriggerServerEvent('permis:permischeckserver')
	    end
    end
end)

RegisterNetEvent('permis:permischeck')
AddEventHandler('permis:permischeck', function()
	Wait(1)
	blippermis = AddBlipForCoord(385.63098144531,285.40124511719,102.03652954102)
	N_0x80ead8e2e1d5d52e(blippermis)
	SetBlipRoute(blippermis, 1)
	onPermis = 1
	SpawnPermisCar()
end)

function SpawnPermisCar()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('asea')

    RequestModel(vehicle)

while not HasModelLoaded(vehicle) do
	Wait(1)
end
colors = table.pack(GetVehicleColours(veh))
extra_colors = table.pack(GetVehicleExtraColours(veh))
plate = math.random(100, 900)
local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
local spawned_car = CreateVehicle(vehicle, coords, 64.55118,116.613,78.69622, true, false)
SetVehicleColours(spawned_car,colors[1],colors[2])
SetVehicleExtraColours(spawned_car,extra_colors[1],extra_colors[2])
SetVehicleOnGroundProperly(spawned_car)
SetPedIntoVehicle(myPed, spawned_car, - 1)
SetModelAsNoLongerNeeded(vehicle)
Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if onPermis == 1 then
			DrawMissionText2("~b~Conduit en sécurité et respecte le code de la route.", 5000)
		end
		
        local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
		if IsVehicleDamaged(veh) and onPermis == 1 then
			DrawMissionText2("~r~Le véhicule est endommagé. C'est reparti pour un tour !", 5000)
			Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(blippermis))
			blippermis = nil
			onPermis = 0
			TaskLeaveVehicle(GetPlayerPed(-1), veh, 0)
			Wait(1000)
			CarTargetForLock = GetPlayersLastVehicle(GetPlayerPed(-1))
			lockStatus = GetVehicleDoorLockStatus(CarTargetForLock)
			SetVehicleDoorsLocked(CarTargetForLock, 2)
			SetVehicleDoorsLockedForPlayer(CarTargetForLock, PlayerId(), false)

    	end
	
	if onPermis == 1 then
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 385.63098144531,285.40124511719,102.03652954102, true) > 4.0001 then
		   DrawMarker(1,385.63098144531,285.40124511719,101.03652954102,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
		else
		    if blippermis ~= nil and DoesBlipExist(blippermis) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(blippermis))
		    end
			blippermis = nil
			TaskLeaveVehicle(GetPlayerPed(-1), veh, 0)
			Wait(1000)
			CarTargetForLock = GetPlayersLastVehicle(GetPlayerPed(-1))
			lockStatus = GetVehicleDoorLockStatus(CarTargetForLock)
			SetVehicleDoorsLocked(CarTargetForLock, 2)
			SetVehicleDoorsLockedForPlayer(CarTargetForLock, PlayerId(), false)			
		    	TriggerEvent("itinerance:notif", "~g~Félicitations ! Vous avez obtenu votre permis de conduire !")
			onPermis = 0
			TriggerServerEvent('permis:updateDriverLicense')
		end
	end
end
end)

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	ShowpermisBlips(true)
	firstspawn = 1
end
end)