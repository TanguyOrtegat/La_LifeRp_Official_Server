local permission = {
	kick = 1,
	ban = 4
}

-- Adding custom groups called owner, inhereting from superadmin. (It's higher then superadmin). And moderator, higher then user but lower then admin
TriggerEvent("es:addGroup", "owner", "superadmin", function(group) end)
TriggerEvent("es:addGroup", "mod", "user", function(group) end)

-- Default commands
TriggerEvent('es:addCommand', 'admin', function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Permission level: ^2" .. user['permission_level'])
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Group: ^2" .. user.group.group)
end)

TriggerEvent('es:addGroupCommand', 'feat', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:feat', source, args[2], args[3])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'car', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:spawnVehicle', source, args[2])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'pastore', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:pastore', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'god', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:god', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'godoff', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:godoff', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'couleur', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:couleur', source, args[2], args[3], args[4], args[5])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'barbe', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:barbe', source, args[2], args[3])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'changemodel', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:changeModel', source, args[2])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'invi', "admin", function(source, args, user)
  TriggerClientEvent('es_admin:invi', source)
end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'loadprops', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:loadprops', source, args[2])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'unloadprops', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:unloadprops', source, args[2])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'tppos', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:tppos', source, args[2], args[3], args[4])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'anim', "admin", function(source, args, user)
	TriggerClientEvent('es_admin:anim', source, args[2])
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'eat', "admin", function(source, args, user)
	TriggerClientEvent('food:veat', source, 100)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

TriggerEvent('es:addGroupCommand', 'drink', "admin", function(source, args, user)
	TriggerClientEvent('food:vdrink', source, 100)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)


-- Default commands
TriggerEvent('es:addCommand', 'report', function(source, args, user)
	table.remove(args, 1)
	TriggerClientEvent('chatMessage', source, "REPORT", {255, 0, 0}, " (^2" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " "))

	TriggerEvent("LaLife.Player.Manager.GetConnectedPlayers", function(pl)
		for _,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", v.identifier, function(user)
				if (user) then
					if(user.permission_level > 0 and v.source ~= source)then
						TriggerClientEvent('chatMessage', v.source, "REPORT", {255, 0, 0}, " (^2" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " "))
					end
				else
					TriggerEvent("es:desyncMsg", 'es:addCommand')
				end
			end)
		end
	end)
end)

-- Append a message
function appendNewPos(msg)
	local file = io.open('resources/[essential]/es_admin/positions.txt', "a")
	local newFile = msg
	file:write(newFile)
	file:flush()
	file:close()
end


RegisterServerEvent('es_admin:givePos')
AddEventHandler('es_admin:givePos', function(str)
	appendNewPos(str)
end)

-- Noclip
TriggerEvent('es:addGroupCommand', 'noclip', "admin", function(source, args, user)
	TriggerClientEvent("es_admin:noclip", source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Marker
TriggerEvent('es:addGroupCommand', 'marker', "admin", function(source, args, user)
	TriggerClientEvent("vmenu:teleport_marker", source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- TPMarker
TriggerEvent('es:addGroupCommand', 'tpme', "admin", function(source, args, user)
	local pos = {}
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if (user) then
			pos = user.coords
		else
			TriggerEvent("es:desyncMsg", 'es:addGroupCommand')
		end
	end)
	TriggerEvent("itinerance:notif", GetPlayerName(tonumber(args[2])))
	TriggerClientEvent("vmenu:teleport_marker_player", tonumber(args[2]), pos)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Kicking
TriggerEvent('es:addGroupCommand', 'kick', "mod", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])))then
		local player = tonumber(args[2])

		-- User permission check
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
					return
				end

				local reason = args
				table.remove(reason, 1)
				table.remove(reason, 1)
				if(#reason == 0)then
					reason = "Kicked: You have been kicked from the server"
				else
					reason = "Kicked: " .. table.concat(reason, " ")
				end

				TriggerClientEvent('chatMessage', -1, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been kicked(^2" .. reason .. "^0)")
				DropPlayer(player, reason)
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 2')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Banning
TriggerEvent('es:addGroupCommand', 'ban', "admin", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])) ~= nil)then
		-- User permission check
		local player = tonumber(args[2])
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
					return
				end
				local time = args[3]

				local message = ""

				if string.find(time, "m") then
					time = string.gsub(time, "m", "")
					time = os.time() + (tonumber(time) * 60)
					message = time .. " minute(s)"
				elseif string.find(time, "h") then
					time = string.gsub(time, "h", "")
					message = time .. " hour(s)"
					time = os.time() + (tonumber(time) * 60 * 60)
				else
					time = os.time() + tonumber(time)
					message = time .. " second(s)"
				end

				if not tonumber(time) > 0 then
					time = os.time() + 999999999999
					message = 'very long'
				end

				local reason = args
				table.remove(reason, 1)
				table.remove(reason, 1)
				table.remove(reason, 1)

				reason = "Banned: " .. table.concat(reason, " ")

				if(reason == "Banned: ")then
					reason = reason .. "You have been banned for: ^1^*" .. message .. "^r^0."
					DropPlayer(player, "You have been banned for: " .. message)
				else
					DropPlayer(player, "Banned: " .. reason)
				end

				TriggerClientEvent('chatMessage', -1, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been banned(^2" .. reason .. "^0)")

				local tstamp = os.date("*t", time)
				local tstamp2 = os.date("*t", os.time())

				MySQL.Async.execute("INSERT INTO bans (`banned`, `reason`, `expires`, `banner`, `timestamp`) VALUES (@username, @reason, @expires, @banner, @now)",
				{['@username'] = target.identifier, ['@reason'] = reason, ['@expires'] = os.date(tstamp.year .. "-" .. tstamp.month .. "-" .. tstamp.day .. " " .. tstamp.hour .. ":" .. tstamp.min .. ":" .. tstamp.sec), ['@banner'] = user.identifier, ['@now'] = os.date(tstamp2.year .. "-" .. tstamp2.month .. "-" .. tstamp2.day .. " " .. tstamp2.hour .. ":" .. tstamp2.min .. ":" .. tstamp2.sec)})
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 3')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

function stringsplit(self, delimiter)
	local a = self:Split(delimiter)
	local t = {}

	for i = 0, #a - 1 do
		table.insert(t, a[i])
	end

	return t
end

-- Announcing
TriggerEvent('es:addGroupCommand', 'announce', "admin", function(source, args, user)
    table.remove(args, 1)
    TriggerClientEvent('es_admin:announce', -1, "" .. table.concat(args, " "))
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Freezing
local frozen = {}
TriggerEvent('es:addGroupCommand', 'freeze', "mod", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])))then
		local player = tonumber(args[2])

		-- User permission check
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
					return
				end

				if(frozen[player])then
					frozen[player] = false
				else
					frozen[player] = true
				end

				TriggerClientEvent('es_admin:freezePlayer', player, frozen[player])

				local state = "unfrozen"
				if(frozen[player])then
					state = "frozen"
				end

				TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "You have been " .. state .. " by ^2" .. GetPlayerName(source))
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been " .. state)
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 4')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Bring
local frozen = {}
TriggerEvent('es:addGroupCommand', 'bring', "mod", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])))then
		local player = tonumber(args[2])

		-- User permission check
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
					return
				end

				TriggerClientEvent('es_admin:teleportUser', player, source)

				TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "You have brought by ^2" .. GetPlayerName(source))
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been brought")
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 5')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Bring
local frozen = {}
TriggerEvent('es:addGroupCommand', 'slap', "admin", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])))then
		local player = tonumber(args[2])

		-- User permission check
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
					return
				end

				TriggerClientEvent('es_admin:slap', player)

				TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "You have slapped by ^2" .. GetPlayerName(source))
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been slapped")
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 6')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Freezing
local frozen = {}
TriggerEvent('es:addGroupCommand', 'goto', "mod", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])))then
		local player = tonumber(args[2])

		-- User permission check
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(target)then
					if(tonumber(target.permission_level) > tonumber(user.permission_level))then
						TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
						return
					end

					TriggerClientEvent('es_admin:teleportUser', source, player)

					TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "You have been teleported to by ^2" .. GetPlayerName(source))
					TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Teleported to player ^2" .. GetPlayerName(player) .. "")
				end
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 7')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Kill yourself
TriggerEvent('es:addCommand', 'die', function(source, args, user)
	TriggerClientEvent('es_admin:kill', source)
	TriggerClientEvent('chatMessage', source, "", {0,0,0}, "^1^*You killed yourself.")
end)

-- Killing
TriggerEvent('es:addGroupCommand', 'slay', "admin", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])))then
		local player = tonumber(args[2])

		-- User permission check
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
					return
				end

				TriggerClientEvent('es_admin:kill', player)

				TriggerClientEvent('chatMessage', player, "SYSTEM", {255, 0, 0}, "You have been killed by ^2" .. GetPlayerName(source))
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been killed.")
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 8')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Crashing
TriggerEvent('es:addGroupCommand', 'crash', "superadmin", function(source, args, user)
	if(GetPlayerName(tonumber(args[2])))then
		local player = tonumber(args[2])

		-- User permission check
		TriggerEvent("es:getPlayerFromId", player, function(target)
			if target ~= nil then
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You're not allowed to target this person!")
					return
				end

				TriggerClientEvent('es_admin:crash', player)

				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been crashed.")
			else
				TriggerEvent("es:desyncMsg", 'es:addGroupCommand 9')
			end
		end)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- Position
TriggerEvent('es:addGroupCommand', 'pos', "owner", function(source, args, user)
	TriggerClientEvent('es_admin:givePosition', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)


-- Rcon commands
AddEventHandler('rconCommand', function(commandName, args)
	if commandName == 'setadmin' then
		if #args ~= 2 then
			RconPrint("Usage: setadmin [user-id] [permission-level]\n")
			CancelEvent()
			return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

		TriggerEvent("es:setPlayerData", tonumber(args[1]), "permission_level", tonumber(args[2]), function(response, success)
			RconPrint(response)

			if(success)then
				print(args[1] .. " " .. args[2])
				TriggerClientEvent('es:setPlayerDecorator', tonumber(args[1]), 'rank', tonumber(args[2]), true)
				TriggerClientEvent('chatMessage', -1, "CONSOLE", {0, 0, 0}, "Permission level of ^2" .. GetPlayerName(tonumber(args[1])) .. "^0 has been set to ^2" .. args[2])
			end
		end)

		CancelEvent()
	elseif commandName == 'setgroup' then
		if #args ~= 2 then
			RconPrint("Usage: setgroup [user-id] [group]\n")
			CancelEvent()
			return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

		TriggerEvent("es:getAllGroups", function(groups)

			if(groups[args[2]])then
				TriggerEvent("es:setPlayerData", tonumber(args[1]), "group", args[2], function(response, success)
					RconPrint(response)

					if(success)then
						print(args[1] .. " " .. args[2])
						TriggerClientEvent('es:setPlayerDecorator', tonumber(args[1]), 'group', tonumber(args[2]), true)
						TriggerClientEvent('chatMessage', -1, "CONSOLE", {0, 0, 0}, "Group of ^2" .. GetPlayerName(tonumber(args[1])) .. "^0 has been set to ^2" .. args[2])
					end
				end)
			else
				RconPrint("This group does not exist.\n")
			end
		end)

		CancelEvent()
	elseif commandName == 'setmoney' then
		if #args ~= 2 then
			RconPrint("Usage: setmoney [user-id] [money]\n")
			CancelEvent()
			return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

		TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
			if(user)then
                LaLife.Player.Manager.SetPlayerMoney(user, args[2] + 0.0)

				RconPrint("Money set")
			end
		end)

		CancelEvent()
	elseif commandName == 'unban' then
		if #args ~= 1 then
			RconPrint("Usage: unban [identifier]\n")
			CancelEvent()
			return
		end

		CancelEvent()
	elseif commandName == 'ban' then
		if #args ~= 1 then
			RconPrint("Usage: ban [user-id]\n")
			RconPrint("Use status in the server console to get the user-id]\n")
			CancelEvent()
			return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			-- User permission check
			local player = tonumber(args[1])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				if target ~= nil then

					local message = ""

					local reason = args
					table.remove(reason, 1)
					table.remove(reason, 1)
					table.remove(reason, 1)

					reason = "Banned: From the rcon"

					if(reason == "Banned: ")then
						reason = reason .. "You have been banned for: ^1^*" .. message .. "^r^0."
						DropPlayer(player, "You have been banned for: " .. message)
					else
						DropPlayer(player, "Banned: " .. reason)
					end

					TriggerClientEvent('chatMessage', -1, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been banned(^2" .. reason .. "^0)")

					MySQL.Async.execute("INSERT INTO bans (`banned`, `reason`, `expires`, `banner`, `timestamp`) VALUES (@username, @reason, @expires, @banner, @now)",
					{['@username'] = target.identifier, ['@reason'] = "rcon", ['@expires'] = "2017-06-16 19:35:31", ['@banner'] = "rcon", ['@now'] = "2017-06-16 19:35:31"})
				else
					TriggerEvent("es:desyncMsg", 'rconCommand')
				end
			end)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
		end

		CancelEvent()
	elseif commandName == 'bcp' then
		if #args < 2 then
      RconPrint("Usage: bcp [id] [msg]\n")
      RconPrint("Use status in the server console to get the user-id\n")
      CancelEvent()
      return
    end

    if(GetPlayerName(tonumber(args[1])) == nil)then
      RconPrint("Player not ingame\n")
      CancelEvent()
      return
    end

    if(GetPlayerName(tonumber(args[1])) ~= nil)then
      -- User permission check
      local player = tonumber(args[1])
      TriggerEvent("es:getPlayerFromId", player, function(target)
        if target ~= nil then
          table.remove(args, 1)
          TriggerClientEvent("itinerance:notif", player, table.concat(args, " "))
        else
          TriggerEvent("es:desyncMsg", 'rconCommand')
        end
      end)
    else
      TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect player ID!")
    end

    CancelEvent()
  elseif commandName == 'bc' then
    if #args ~= 1 then
      RconPrint("Usage: bc [msg]\n")
      CancelEvent()
      return
    end
    TriggerClientEvent('es_admin:announce', -1, "" .. table.concat(args, " "))
    CancelEvent()
  elseif commandName == 'addmoney' then
    if #args ~= 2 then
      RconPrint("Usage: addmoney [user-id] [money]\n")
      CancelEvent()
      return
    end

    if(GetPlayerName(tonumber(args[1])) == nil)then
      RconPrint("Player not ingame\n")
      CancelEvent()
      return
    end

    TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
      if(user)then
                LaLife.Player.Manager.AddPlayerMoney(user, args[2] + 0.0)

        RconPrint("Money added")
      end
    end)

    CancelEvent()
  elseif commandName == 'remmoney' then
    if #args ~= 2 then
      RconPrint("Usage: remmoney [user-id] [money]\n")
      CancelEvent()
      return
    end

    if(GetPlayerName(tonumber(args[1])) == nil)then
      RconPrint("Player not ingame\n")
      CancelEvent()
      return
    end

    TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
      if(user)then
                LaLife.Player.Manager.RemovePlayerMoney(user, args[2] + 0.0)

        RconPrint("Money removed")
      end
    end)

    CancelEvent()
  elseif commandName == 'infos' then
    if #args ~= 1 then
      RconPrint("Usage: infos [user-id]\n")
      CancelEvent()
      return
    end

    if(GetPlayerName(tonumber(args[1])) == nil)then
      RconPrint("Player not ingame\n")
      CancelEvent()
      return
    end

    TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
      if(user)then
      local player = user.identifier
      MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @username",{['@username'] = player}, function(result)
      if (result) then
        RconPrint("Prénom/Nom RP: "..tostring(user.prenom).. " " ..tostring(user.nom).. "\n")
        RconPrint("Argent propre: "..tostring(math.floor(user.money)).. "$" .. "\n")
        RconPrint("Argent sale: "..tostring(math.floor(user.dirtymoney)).. "$" .. "\n")
        RconPrint("Argent en banque: "..tostring(math.floor(result[1].bankbalance)).. "$" .. "\n")
        RconPrint("Métier: "..tostring(user.job).. "\n")
        RconPrint("Numéro de téléphone: "..tostring(user.telephone).. "\n")
        RconPrint("Coordonnées: X: "..tostring(user.coords.x).." Y:"..tostring(user.coords.y).." Z:"..tostring(user.coords.z).. "\n")
      else
        RconPrint("An error occured.")
      end
      end)
      end
    end)

    CancelEvent()
  --elseif commandName == 'where' then
    -- for identifier, user in ipairs(LaLife.Player.UserRegistry) do
     --     RconPrint("["..tostring(identifier).. "] Coordonnées: X: "..tostring(user.coords.x).." Y:"..tostring(user.coords.y).." Z:"..tostring(user.coords.z).. "\n")
     --end

   -- CancelEvent()
  elseif commandName == 'garage' then
    if #args ~= 1 then
      RconPrint("Usage: garage [user-id]\n")
      CancelEvent()
      return
    end

    if(GetPlayerName(tonumber(args[1])) == nil)then
      RconPrint("Player not ingame\n")
      CancelEvent()
      return
    end

    TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
      if(user)then
      MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username",{['@username'] = tostring(user.identifier)}, function(result)
      local tab = result
        for v, i in ipairs(tab) do
          RconPrint("["..tostring(i.vehicle_name).."] ".."Status: "..tostring(i.vehicle_state).. " / Plaque: "..tostring(i.vehicle_plate).. "\n")
        end
      end)
      end
    end)

    CancelEvent()
	end
end)

-- Logging
AddEventHandler("es:adminCommandRan", function(source, command)

end)
