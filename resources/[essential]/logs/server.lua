local os_time = os.time
local os_date = os.date


local entityIdToPlayer = {}

local LogConnect = true
local LogDisconnect = true

RegisterServerEvent('logs:onPlayerKilled')
AddEventHandler('logs:onPlayerKilled', function(t,killer, kilerT) -- t : 0 = NPC, 1 = player
  file = io.open("resources/[essential]/logs/KillLogs.txt", "a")
  local local_hour = os_date("%x:%I:%M:%S")


  if(t == 1) then
     if(GetPlayerName(killer) ~= nil and GetPlayerName(source) ~= nil)then

       if(kilerT.killerinveh) then
         local model = kilerT.killervehname
         if file then
             --print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") has been killed by  : "..GetPlayerName(killer).." ("..getPlayerID(killer)..") | Vehicle : "..model)

             file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") has been killed by : "..GetPlayerName(killer).." ("..getPlayerID(killer)..") | Vehicle : "..model)
             file:write("\n")
         end

       else
          if file then
             --print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") has been killed by : "..GetPlayerName(killer).." ("..getPlayerID(killer)..")")

             file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") has been killed by : "..GetPlayerName(killer).." ("..getPlayerID(killer)..")")
             file:write("\n")
         end
       end
    end
  else
    --print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") has been killed by a NPC or vehicle")
    file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") has been killed by a NPC or vehicle")
    file:write("\n")
  end
  file:close()
end)


RegisterServerEvent("logs:sendPoliceLog")
AddEventHandler("logs:sendPoliceLog", function(model)
  local local_hour = os_date("%x:%I:%M:%S")
    --print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") : "..model)
    file = io.open("resources/[essential]/logs/PoliceVehicleLogs.txt", "a")
    if file then
      file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") : "..model)
      file:write("\n")
    end
    file:close()
end)



RegisterServerEvent("logs:sendBlackListedLogs")
AddEventHandler("logs:sendBlackListedLogs", function(model)
  local local_hour = os_date("%x:%I:%M:%S")
  file = io.open("resources/[essential]/logs/BlackListedLogs.txt", "a")
  if file then
    --print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") : "..model)
     file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") : "..model)
     file:write("\n")
  end
  file:close()
end)




RegisterServerEvent("logs:sendBlackListedWeapon")
AddEventHandler("logs:sendBlackListedWeapon", function(wea)
local local_hour = os_date("%x:%I:%M:%S")
  file = io.open("resources/[essential]/logs/BlackListedWeaponLogs.txt", "a")
  if file then
    --print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") have a blacklisted weapon : "..hashToWeapon[wea])
     file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") have a blacklisted weapon : "..hashToWeapon[wea])
     file:write("\n")
  end
  file:close()
end)




AddEventHandler("playerDropped", function(reason)
  local playersource = source
	if(LogDisconnect) then
		local local_hour = os_date("%x:%H:%M:%S")
	  	 file = io.open("resources/[essential]/logs/Connections.txt", "a")
	  	if file then
	    --	print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") disconnected.")
	    	 file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") disconnected.")
	    	 file:write("\n")
	  	end
	  file:close()
	end
end)


RegisterServerEvent("logs:playerConnected")
AddEventHandler("logs:playerConnected", function()
  local playersource = source
	if(LogConnect) then
		local local_hour = os_date("%x:%I:%M:%S")
      file = io.open("resources/[essential]/logs/Connections.txt", "a")
     --print(file)
  		if file then
   			print("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") connected.")
    		file:write("["..local_hour.."] "..GetPlayerName(source).." ("..getPlayerID(source)..") connected.")
    		file:write("\n")
  		end
 		file:close()
	end
end)


-- get's the player id without having to use bugged essentials
function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end




RegisterServerEvent("logs:addEntityId")
AddEventHandler("logs:addEntityId",function(id)
  entityIdToPlayer[source] = id
end)
