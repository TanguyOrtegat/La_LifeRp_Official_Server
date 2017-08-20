local callActive = false
local haveTarget = false
local isCall = false
local work
local target = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        -- if IsControlJustPressed(1, 56) then
        --     local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
        --     TriggerServerEvent("call:makeCall", "uber", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
        -- end

        -- Press Y key to get the call
        if IsControlJustPressed(1, 246) and callActive then
			if isCall == false then
				TriggerServerEvent("call:getCall", work)
				TriggerEvent("itinerance:notif", "~g~Vous avez pris l'appel !")
				target.blip = AddBlipForCoord(target.pos.x, target.pos.y, target.pos.z)
				SetBlipRoute(target.blip, true)
				haveTarget = true
				isCall = true
				callActive = false
			else
				SendNotification("~r~Vous avez déjà un appel en cours !")
			end
        -- Press L key to decline the call
        elseif IsControlJustPressed(1, 182) and callActive then
            TriggerEvent("itinerance:notif", "~r~Vous avez refusé l'appel !")
            callActive = false
        end
        if haveTarget then
            DrawMarker(1, target.pos.x, target.pos.y, target.pos.z-1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 255, 255, 0, 200, 0, 0, 0, 0)
            local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
            if Vdist(target.pos.x, target.pos.y, target.pos.z, playerPos.x, playerPos.y, playerPos.z) < 2.0 then
                RemoveBlip(target.blip)
                haveTarget = false
				isCall = false
            end
        end
    end
end)

RegisterNetEvent("call:cancelCall")
AddEventHandler("call:cancelCall", function()
	if haveTarget then
		RemoveBlip(target.blip)
        haveTarget = false
		isCall = false
	else
		TriggerEvent("itinerance:notif", "~r~Vous n'avez aucun appel en cours !")
	end
end)

RegisterNetEvent("call:callIncoming")
AddEventHandler("call:callIncoming", function(job, pos, msg, name, tel)
    callActive = true
    work = job
    target.pos = pos
	plyPos = GetEntityCoords(GetPlayerPed(-1), true)
	distance = Vdist(target.pos.x, target.pos.y, target.pos.z, plyPos.x, plyPos.y, plyPos.z)
	if work == "police" then
		TriggerEvent("itinerance:notif", name.. " ~b~a appelé la police:~w~ " ..tostring(msg).. " (~g~" ..(math.floor(distance)).. "m~w~).")
	elseif work == "tow" then
		TriggerEvent("itinerance:notif", "~o~APPEL EN COURS:~w~ " ..tostring(msg))
	elseif work == "taxi" then
		TriggerEvent("itinerance:notif", "~y~APPEL EN COURS:~w~ " ..tostring(msg))
	elseif work == "medic" then
		TriggerEvent("itinerance:notif", "~r~APPEL EN COURS:~w~ " ..tostring(msg).. " (~g~" ..(math.floor(distance)).. "m~w~) (~g~" ..tel.. ").")
	end
end)

RegisterNetEvent("call:taken")
AddEventHandler("call:taken", function()
    callActive = false
    TriggerEvent("itinerance:notif", "L'appel a été pris.")
end)

RegisterNetEvent("target:call:taken")
AddEventHandler("target:call:taken", function(taken)
    if taken == 1 then
        TriggerEvent("itinerance:notif", "~g~Quelqu'un arrive !")
    elseif taken == 0 then
        TriggerEvent("itinerance:notif", "~r~Personne ne peut venir !")
    elseif taken == 2 then
        TriggerEvent("itinerance:notif", "~y~Veuillez rappeler dans quelques instants.")
    end
end)

-- If player disconnect, remove him from the inService server table
AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", nil)
end)
