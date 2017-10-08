-- Initialize global jobs legal vars
onJobLegal = 0
EndingDay = false
myjob = 0
ShowMsgtime = { msg = "", time = 0 }
ITEMSJOB = {}
PriceBourse = 20

RegisterNetEvent("jobslegal:getJobs")
AddEventHandler("jobslegal:getJobs", function(job)
    myjob = job
end)


job = {
	plate = 0,
}

RegisterNetEvent("jobs:getBoursePrice_c")
AddEventHandler("jobs:getBoursePrice_c", function(price)
  PriceBourse = price
end)

RegisterNetEvent("job:f_GetIdentifier")
AddEventHandler("job:f_GetIdentifier", function(plate)
	job.plate = plate
end)

local isSpawn = false

AddEventHandler('onClientResourceStart', function(name)
    if name == "jobs-legal" and isSpawn then
	    TriggerServerEvent("job:GetIdentifier")
    end
end)

AddEventHandler("playerSpawned", function()
    isSpawn = true
	TriggerServerEvent("job:GetIdentifier")
end)

ArgentJoueur = 0

RegisterNetEvent("job:f_getCash")
AddEventHandler("job:f_getCash", function(argent)
  ArgentJoueur = argent
end)

AddEventHandler("job:getJobInfos", function()
  TriggerEvent("fivemenu:f_getJobInfos", onJobLegal)
end)

AddEventHandler("job:setJobInfos", function(param)
  onJobLegal = param
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if ShowMsgtime.time ~= 0 then
      drawTxtpool(ShowMsgtime.msg, 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
      ShowMsgtime.time = ShowMsgtime.time - 1
    end
  end
end)

RegisterNetEvent("jobslegal:updateonJobLegal")
AddEventHandler("jobslegal:updateonJobLegal", function(status)
  onJobLegal = status
end)

RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text, time)
        ClearPrints()
        SetTextEntry_2("STRING")
        AddTextComponentString(text)
        DrawSubtitleTimed(time, 1)
end)

-- When the player have left the job he was doing.
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if onJobLegal == 2 then
      clearJob()
    elseif onJobLegal == 3 then
      clearJob2()
    end
  end
end)

function clearJob()
  if ( DoesEntityExist(MISSION.truck) ) then
    --SetEntityAsNoLongerNeeded(MISSION.truck)
    SetVehicleDoorsLocked(MISSION.truck, 2)
    SetVehicleUndriveable(MISSION.truck, true)

    local temptruck = MISSION.truck

    MISSION.truck = 0

    SetEntityAsMissionEntity(temptruck, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(temptruck))
  end
  onJobLegal = 0
  Citizen.Trace("Cleared")
  TriggerServerEvent("vmenu:lastChar")
  EndingDay = false
end

function clearJob2()
  if ( DoesEntityExist(MISSION.truck) ) then
    --SetEntityAsNoLongerNeeded(MISSION.truck)
    SetVehicleDoorsLocked(MISSION.truck, 2)
    SetVehicleUndriveable(MISSION.truck, true)

    local temptruck = MISSION.truck

    MISSION.truck = 0

    SetEntityAsMissionEntity(temptruck, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(temptruck))
  end
  onJobLegal = 0
  Citizen.Trace("Cleared")
  EndingDay = false
end

AddEventHandler("poleemploi:getQuantityJob", function(p_items)
  ITEMSJOB = p_items
end)
