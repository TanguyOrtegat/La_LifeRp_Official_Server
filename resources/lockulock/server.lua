local vehStorage = {}
local randomMsg = {	"Vous avez trouvé les clés sur le pare-soleil.",
                     "Vous avez trouvé les clés dans la boite a gants.",
                    "Vous avez trouvé les clés sur le siège passager.",
                    "Vous avez trouvé les clés sur le sol.",
                    "Les clés était sur le contact, vous les avez prise."}

RegisterServerEvent("ls:check")
AddEventHandler("ls:check", function(plate, vehicleId, isPlayerInside, notifParam)
    local playerSource = source
	playerIdentifier = GetPlayerIdentifiers(source)[1]
   	result = 0
	for i=1, #(vehStorage) do
		if vehStorage[i].plate == plate and vehStorage[i].id == vehicleId then
			result = result + 1
			if vehStorage[i].owner == playerIdentifier then
				TriggerClientEvent("ls:lock", source, vehStorage[i].lockStatus, vehStorage[i].id)
				break
			else
				TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas les clés !")
				break
			end
		end
	end

	if result == 0 and isPlayerInside then
local playerSource = source
		length = #(randomMsg)
		randomNbr = math.random(1, tonumber(length))
		TriggerClientEvent("itinerance:notif", playerSource, tostring(randomMsg))

		table.insert(vehStorage, {plate=plate, owner=playerIdentifier, lockStatus=0, id=vehicleId})
		--fTriggerClientEvent("ls:createMissionEntity", source, vehicleId)
	end
end)

RegisterServerEvent("ls:updateLockStatus")
AddEventHandler("ls:updateLockStatus", function(param, plate,vehicleId)
    for i=1, #(vehStorage) do
		if vehStorage[i].plate == plate and vehStorage[i].id == vehicleId then
            vehStorage[i].lockStatus = param
            if debugLog then print("(ls:updateLockStatus) : vehStorage["..i.."].lockStatus = "..param) end
            break
		end
	end
end)
