local states = {}
states.frozen = false
states.frozenPos = nil

local isInvi = false

RegisterNetEvent('es_admin:changeModel')
AddEventHandler('es_admin:changeModel', function(skinName)
        -- Get model hash.
	    local modelhashed = GetHashKey(skinName)

        -- Request the model, and wait further triggering untill fully loaded.
	    RequestModel(modelhashed)
	    while not HasModelLoaded(modelhashed) do
	    	RequestModel(modelhashed)
	    	Citizen.Wait(0)
	    end
        -- Set playermodel.
		SetPlayerModel(PlayerId(), modelhashed)
		SetPedRandomComponentVariation(GetPlayerPed(-1), true)
        -- Set model no longer needed.
		SetModelAsNoLongerNeeded(modelhashed)
end)

RegisterNetEvent('es_admin:barbe')
AddEventHandler('es_admin:barbe', function(barbe1, barbe2)
Citizen.Trace("test barbe")
		SetPedHeadOverlay(GetPlayerPed(-1), barbe1, barbe2, 1.0)
Citizen.Trace("test barbe")
end)

RegisterNetEvent('es_admin:feat')
AddEventHandler('es_admin:feat', function(feat, feat1)
Citizen.Trace("test feat")
		SetPedFaceFeature(GetPlayerPed(-1), tonumber(feat), tonumber(feat))
Citizen.Trace("test feat")
end)

RegisterNetEvent('es_admin:couleur')
AddEventHandler('es_admin:couleur', function(couleur, couleur2, couleur3, couleur4)
		SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, couleur, couleur2, couleur3, couleur4)
end)


RegisterNetEvent('es_admin:loadprops')
AddEventHandler('es_admin:loadprops', function(loadprops)
        local hash = GetInteriorFromEntity(GetPlayerPed(-1))
		--Citizen.Trace(hash)
        EnableInteriorProp(tonumber(247041),loadprops)
        RefreshInterior(tonumber(247041))
end)

RegisterNetEvent('es_admin:loadpropscoke')
AddEventHandler('es_admin:loadpropscoke', function(loadprops)
        local hash = GetInteriorFromEntity(GetPlayerPed(-1))
		--Citizen.Trace(hash)
        EnableInteriorProp(tonumber(247553),loadprops)
        RefreshInterior(tonumber(247553))
end)

RegisterNetEvent('es_admin:unloadprops')
AddEventHandler('es_admin:unloadprops', function(unloadprops)
        local hash = GetInteriorFromEntity(GetPlayerPed(-1))
        DisableInteriorProp(tonumber(hash),unloadprops)
        RefreshInterior(tonumber(hash))
end)

RegisterNetEvent('es_admin:invi')
AddEventHandler('es_admin:invi', function(anim)
  if isInvi then
    SetEntityVisible(GetPlayerPed(-1), true, false)
    isInvi = false
    TriggerEvent('chatMessage', prefix, {255, 0, 0}, 'Invisibilité désactivée.')
  else
    SetEntityVisible(GetPlayerPed(-1), false, false)
    isInvi = true
    TriggerEvent('chatMessage', prefix, {255, 0, 0}, 'Invisibilité activée.')
  end
end)

RegisterNetEvent('es_admin:anim')
AddEventHandler('es_admin:anim', function(anim)
		TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_FISHING", 0, false)
		Citizen.Trace('Test anim')
end)

RegisterNetEvent('es_admin:pastore')
AddEventHandler('es_admin:pastore', function()
	SetPedPropIndex(GetPlayerPed(-1), 0, 58, 2, 1)
end)

RegisterNetEvent('es_admin:god')
AddEventHandler('es_admin:god', function()
	SetEntityInvincible(GetPlayerPed(-1), true )
	TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "God mode ON")
end)

RegisterNetEvent('es_admin:godoff')
AddEventHandler('es_admin:godoff', function()
	SetEntityInvincible(GetPlayerPed(-1), false )
	TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "God mode OFF")
end)


RegisterNetEvent('es_admin:tppos')
AddEventHandler('es_admin:tppos', function(x, y, z)
	SetEntityCoords(GetPlayerPed(-1), tonumber(x),tonumber(y),tonumber(z))
end)

RegisterNetEvent('es_admin:spawnVehicle')
AddEventHandler('es_admin:spawnVehicle', function(v)
	local carid = GetHashKey(v)
	local playerPed = GetPlayerPed(-1)
	if playerPed and playerPed ~= -1 then
		RequestModel(carid)
		while not HasModelLoaded(carid) do
				Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)

		veh = CreateVehicle(carid, playerCoords, 0.0, true, false)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, true)
	end
end)

ShowMsgtime = { msg = "", time = 0 }

function drawTxtpool(text,font,centre,x,y,scale,r,g,b,a)
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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ShowMsgtime.time ~= 0 then
            drawTxtpool(ShowMsgtime.msg, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
            ShowMsgtime.time = ShowMsgtime.time - 1
        end
    end
end)

RegisterNetEvent('es_admin:announce')
AddEventHandler('es_admin:announce', function(text)
    ShowMsgtime.msg = 'Annonce : ' .. text
    ShowMsgtime.time = 500
end)

RegisterNetEvent('es_admin:freezePlayer')
AddEventHandler("es_admin:freezePlayer", function(state)
	local player = PlayerId()

	local ped = GetPlayerPed(-1)

	states.frozen = state
	states.frozenPos = GetEntityCoords(ped, false)

	if not state then
			if not IsEntityVisible(ped) then
					SetEntityVisible(ped, true)
			end

			if not IsPedInAnyVehicle(ped) then
					SetEntityCollision(ped, true)
			end

			FreezeEntityPosition(ped, false)
			--SetCharNeverTargetted(ped, false)
			SetPlayerInvincible(player, false)
	else

			SetEntityCollision(ped, false)
			FreezeEntityPosition(ped, true)
			--SetCharNeverTargetted(ped, true)
			SetPlayerInvincible(player, true)
			--RemovePtfxFromPed(ped)

			if not IsPedFatallyInjured(ped) then
					ClearPedTasksImmediately(ped)
			end
	end
end)

RegisterNetEvent('es_admin:teleportUser')
AddEventHandler('es_admin:teleportUser', function(user)
	local pos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(tonumber(user))))
	RequestCollisionAtCoord(pos.x, pos.y, pos.z)
	while not HasCollisionLoadedAroundEntity(GetPlayerPed(-1))do
		RequestCollisionAtCoord(pos.x, pos.y, pos.z)
		Citizen.Wait(0)
	end
	SetEntityCoords(GetPlayerPed(-1), pos)
	states.frozenPos = pos
end)

RegisterNetEvent('es_admin:slap')
AddEventHandler('es_admin:slap', function()
	local ped = GetPlayerPed(-1)

	ApplyForceToEntity(ped, 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
end)

RegisterNetEvent('es_admin:givePosition')
AddEventHandler('es_admin:givePosition', function()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	local string = "{ ['x'] = " .. pos.x .. ", ['y'] = " .. pos.y .. ", ['z'] = " .. pos.z .. " },\n" ..  heading .. "\n"
	TriggerServerEvent('es_admin:givePos', string)
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, 'Position saved to file.')
end)

RegisterNetEvent('es_admin:kill')
AddEventHandler('es_admin:kill', function()
	SetEntityHealth(GetPlayerPed(-1), 0)
end)

RegisterNetEvent('es_admin:crash')
AddEventHandler('es_admin:crash', function()
	while true do
	end
end)

local noclip = false

RegisterNetEvent("es_admin:noclip")
AddEventHandler("es_admin:noclip", function(t)
	local msg = "disabled"
	if(noclip == false)then
		noclip_pos = GetEntityCoords(GetPlayerPed(-1), false)
	end

	noclip = not noclip

	if(noclip)then
		msg = "enabled"
	end

	TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Noclip has been ^2^*" .. msg)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if(states.frozen)then
			ClearPedTasksImmediately(GetPlayerPed(-1))
			SetEntityCoords(GetPlayerPed(-1), states.frozenPos)
		end
	end
end)

local heading = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(noclip)then
			SetEntityCoordsNoOffset(GetPlayerPed(-1),  noclip_pos.x,  noclip_pos.y,  noclip_pos.z,  0, 0, 0)

			if(IsControlPressed(1,  34))then
				heading = heading + 1.5
				if(heading > 360)then
					heading = 0
				end
				SetEntityHeading(GetPlayerPed(-1),  heading)
			end
			if(IsControlPressed(1,  9))then
				heading = heading - 1.5
				if(heading < 0)then
					heading = 360
				end
				SetEntityHeading(GetPlayerPed(-1),  heading)
			end
			if(IsControlPressed(1,  8))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 1.0, 0.0)
			end
			if(IsControlPressed(1,  32))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, -1.0, 0.0)
			end

			if(IsControlPressed(1,  27))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 0.0, 1.0)
			end
			if(IsControlPressed(1,  173))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 0.0, -1.0)
			end
		end
	end
end)


function PlayScenario(param1, param2, param3)
	Citizen.CreateThread(function()
		TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
		PlayAmbientSpeech1(GetPlayerPed(-1), param2, param3)
		Citizen.Wait(20000)
		ClearPedTasksImmediately(GetPlayerPed(-1))
	end)
end
