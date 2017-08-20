-- Coded by Albo1125 to help debug FxServer "ghost" session issues.

local networkinfo = {}
local logdelay = 15000
local logfile = io.open("ghostsessiondebug.txt", "w")

AddEventHandler('playerConnecting', function(name, setCallback)
	logdebug("New player connecting with ID ".. source, false)
	logHostDetails()
end)


AddEventHandler("playerDropped", function(reason)
	logdebug("Dropping player ID: "..source .. ". Reason: ".. reason, false)
	logHostDetails()
end)

AddEventHandler('chatMessage', function(source, name, message)
	local cm = stringsplit(message, " ")
    if cm[1] == "/ghost" then
		CancelEvent()
		logdebug("GHOST SESSION ALERT by ID " .. source .. ", ping " .. GetPlayerPing(source) .. ": "..message, false)
		logHostDetails()
	end
end)

RegisterServerEvent("GetNetworkInfo")
AddEventHandler("GetNetworkInfo", function(source, playercount, ishost)
	local message = "ServerID="..source..";playercount="..playercount..";ishost="..tostring(ishost)
	table.insert(networkinfo, message)
end)

local shouldwaitfornetwork

function logdebug(msg, shownetworkinfo)
	logfile:write("["..os.date("%c").."] "..msg.."\n")
	print("["..os.date("%c").."] "..msg)
	if shownetworkinfo and #GetPlayers() > 0 then
		TriggerClientEvent("SendNetworkInfo", -1)
		Citizen.CreateThread(function()
			shouldwaitfornetwork = false
			Wait(10)
			shouldwaitfornetwork = true
			while #networkinfo < #GetPlayers() and shouldwaitfornetwork do
				Wait(1)
			end
			local networkmsg = "ClientNetworkInfo:"
			for i=1, #networkinfo do
				networkmsg = networkmsg.. networkinfo[i].."."
            end

			networkinfo = {}
			logfile:write("["..os.date("%c").."] "..networkmsg.."\n")
			print("["..os.date("%c").."] "..networkmsg)
		end)
	end		
end

function logHostDetails()
	local message = "Player count: ".. #GetPlayers()
	if GetHostId() ~= nil then
		message = message.. ". Host ID: ".. GetHostId().. ". Steam Id: ".. GetPlayerIdentifiers(GetHostId())[1] .." . Ping: ".. GetPlayerPing(GetHostId())
	else
		message = message.. ". Host server ID: nil (no host)"
	end		
	logdebug(message, true)	
	logfile:flush()
end

function logHostDetailsRecursive()
	logHostDetails()
	SetTimeout(logdelay, logHostDetailsRecursive)
end
SetTimeout(logdelay, logHostDetailsRecursive)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
