function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

RegisterNetEvent("itinerance:notif")
AddEventHandler('itinerance:notif', function(lestring)
    drawNotification("" .. lestring .. "")
end)

function ShowInfo(text, state)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

RegisterNetEvent("itinerance:info")
AddEventHandler('itinerance:info', function(lestring)
    ShowInfo("" .. lestring .. "", 0)
end)

AddEventHandler('onClientMapStart', function()
    print('yolo')
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)
