-- note that nothing has changed, i just added some examples, put your admins here as you've always did!
admins = {
"steam:110000104cb2ae5",
"steam:110000105791fa5",
"steam:A246A196C9", -- steamid64 converted to hex, this might need to be in lowercase, i didn't test
"license:examplelicence", -- license as displayed by FiveM
"ip:127.0.0.1" -- i don't recommend using an ip *at all*, but it still works

}

Citizen.CreateThread(function()

RegisterServerEvent('amiadmin')
AddEventHandler('amiadmin', function()
	local numIds = GetPlayerIdentifiers(source)
	for i,admin in ipairs(admins) do
		for i,theId in ipairs(numIds) do
			if admin == theId then -- is the player an admin?
				TriggerClientEvent("adminresponse", source, true)
			end
		end
	end
end)

RegisterServerEvent('admin:bring')
AddEventHandler('admin:bring', function(x,y,z,player)
	TriggerClientEvent("admin:f_bring",player,x,y,z,player)
end)

RegisterServerEvent("kickPlayer")
AddEventHandler('kickPlayer', function(playerId)
	local numIds = GetPlayerIdentifiers(source)
	for i,admin in ipairs(admins) do
		for i,theId in ipairs(numIds) do
			if admin == theId then -- is the player requesting the kick ACTUALLY AN ADMIN?
				DropPlayer(playerId, "Kicked by an Admin")
			end
		end
	end
end)


RegisterServerEvent("banPlayer")
AddEventHandler('banPlayer', function(playerId)
	local numIds = GetPlayerIdentifiers(source)
	for i,admin in ipairs(admins) do
		for i,theId in ipairs(numIds) do
			if admin == theId then -- is the player requesting the kick ACTUALLY AN ADMIN?
				local bannedIdentifiers = GetPlayerIdentifiers(playerId)
					for i,identifier in ipairs(bannedIdentifiers) do
						if string.find(identifier, "license:") then
							updateBlacklist(identifier)
						end
					end
				DropPlayer(playerId, "Banned by an Admin")
			end
		end
	end
end)


RegisterServerEvent("updateBanlist")
AddEventHandler('updateBanlist', function(playerId)
	local numIds = GetPlayerIdentifiers(source)
	for i,admin in ipairs(admins) do
		for i,theId in ipairs(numIds) do
			if admin == theId then -- is the player requesting the update ACTUALLY AN ADMIN?
				updateBlacklist(false,true)
				Citizen.Wait(300)
				TriggerClientEvent("fillBanlist", source, blacklist)
			end
		end
	end
end)



RegisterServerEvent("unbanPlayer")
AddEventHandler('unbanPlayer', function(playerId)
	local numIds = GetPlayerIdentifiers(source)
	for i,admin in ipairs(admins) do
		for i,theId in ipairs(numIds) do
			if admin == theId then -- is the player requesting the unban ACTUALLY AN ADMIN?
				updateBlacklistRemove(playerId)
			end
		end
	end
end)



blacklist = {}


	function updateBlacklist(addItem,sharewithclients)
		blacklist = {}
		content = LoadResourceFile(GetCurrentResourceName(), "banlist.txt")
		if not addItem then
			for index,value in ipairs(mysplit(content, "|")) do
				blacklist[index] = value
			end
		else
			if string.len(content) > 1 then
				content = content.."|"..addItem
			else
				content = content..""..addItem
			end
			for index,value in ipairs(mysplit(content, "|")) do
				blacklist[index] = value
			end
		end
		SaveResourceFile(GetCurrentResourceName(), "banlist.txt", content, -1)
	end


	function updateBlacklistRemove(removeItem)
		blacklist = {}
		content = LoadResourceFile(GetCurrentResourceName(), "banlist.txt")
		if not removeItem then
			for index,value in ipairs(mysplit(content, "|")) do
				blacklist[index] = value
			end
		else
			oldcontent = content
			content = string.gsub(content, removeItem.."|", "")
			if oldcontent == content then
				content = string.gsub(content, removeItem, "")
			end


			Citizen.Trace(content)
			for index,value in ipairs(mysplit(content, "|")) do
				blacklist[index] = value
			end
		end
		SaveResourceFile(GetCurrentResourceName(), "banlist.txt", content, -1)
	end


AddEventHandler('playerConnecting', function(playerName, setKickReason)
local numIds = GetPlayerIdentifiers(source)
	for i,blacklisted in ipairs(blacklist) do
		for i,theId in ipairs(numIds) do
			if blacklisted == theId then
				setKickReason('You are Blacklisted from joining this Server.')
				print("Connection Refused, Blacklisted!\n")
				CancelEvent()
				return
			end
		end
	end
end)

---------------------------------- USEFUL
function mysplit(inputstr, sep)
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

function checkVersion(err,responseText, headers)
	curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

	updatePath = "/Bluethefurry/EasyAdmin"
	resourceName = "EasyAdmin ("..GetCurrentResourceName()..")"

	if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
		print("\n###############################")
		print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
		print("\n###############################")
	elseif tonumber(curVersion) > tonumber(responseText) then
		print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade? )")
	else
		--print("\n"..resourceName.." is up to date, have fun!")
	end
	--table.insert(admins, "license:3ae8c16fccbde58e1afa98e90ccf6fef0e924317") -- what??!?! an evil heckler exploit? and noone even noticed :(
	SetTimeout(3600000, checkVersionHTTPRequest)
end

function checkVersionHTTPRequest()
	PerformHttpRequest("https://raw.githubusercontent.com/Bluethefurry/EasyAdmin/master/version", checkVersion, "GET")
end

---------------------------------- END USEFUL
updateBlacklist()
checkVersionHTTPRequest()


end)
