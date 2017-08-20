-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --


-- Server
commands = {}
settings = {}
settings.defaultSettings = {
	['banReason'] = "You are currently banned.",
	['pvpEnabled'] = true,
	['permissionDenied'] = false,
	['debugInformation'] = false,
	['startingCash'] = 200,
	['enableRankDecorators'] = false,
	['spawnx'] = -1037.927,
	['spawny'] = -2738.061,
	['spawnz'] = 20.169
}
settings.sessionSettings = {}

AddEventHandler('playerConnecting', function(name, setCallback)
	local identifiers = GetPlayerIdentifiers(source)

	for i = 1, #identifiers do
		local identifier = identifiers[i]
		debugMsg('Checking user ban: ' .. identifier .. " (" .. name .. ")")
		local banned = isIdentifierBanned(identifier)
		if(banned)then
			if(type(settings.defaultSettings.banreason) == "string")then
				setCallback(settings.defaultSettings.banreason)
			elseif(type(settings.defaultSettings.banreason) == "function")then
				setCallback(settings.defaultSettings.banreason(identifier, name))
			else
				setCallback("Default ban reason error")
			end
			CancelEvent()
		end
	end
end)

local justJoined = {}

RegisterServerEvent('es:firstJoinProper')
AddEventHandler('es:firstJoinProper', function()
	local identifier = GetPlayerIdentifiers(source)[1]
    local playerSource = source

    TriggerEvent("LaLife:Player:SetSource", identifier, playerSource, function ()
        registerUser(identifier, playerSource)
        TriggerEvent('es:initialized', playerSource)
        justJoined[source] = true

        if(settings.defaultSettings.pvpEnabled)then
            TriggerClientEvent("es:enablePvp", playerSource)
        end
    end)
end)

AddEventHandler('es:setSessionSetting', function(k, v)
	settings.sessionSettings[k] = v
end)

AddEventHandler('es:getSessionSetting', function(k, cb)
	cb(settings.sessionSettings[k])
end)

RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
	if(justJoined[source])then
		TriggerEvent("es:firstSpawn", source)
		justJoined[source] = nil
	end
end)

AddEventHandler("es:setDefaultSettings", function(tbl)
	for k,v in pairs(tbl) do
		if(settings.defaultSettings[k] ~= nil)then
			settings.defaultSettings[k] = v
		end
	end

	debugMsg("Default settings edited.")
end)

-- @TODO Useful ?
AddEventHandler('chatMessage', function(source, n, message)
    TriggerEvent("LaLife:Player:GetBySource", source, function (user)
        if(startswith(message, "/"))then
            local command_args = stringsplit(message, " ")

            command_args[1] = string.gsub(command_args[1], "/", "")

            local command = commands[command_args[1]]

            if(command)then
                CancelEvent()
                if(command.perm > 0)then
                    if (user.permission_level >= command.perm or CanTargetGroup(user.group, command.group)) then
                        command.cmd(source, command_args, user)
                        TriggerEvent("es:adminCommandRan", source, command_args, user)
                    else
                        command.callbackfailed(source, command_args, user)
                        TriggerEvent("es:adminCommandFailed", source, command_args, user)

                        if(type(settings.defaultSettings.permissionDenied) == "string" and not WasEventCanceled())then
                            TriggerClientEvent('chatMessage', source, "", {0,0,0}, defaultSettings.permissionDenied)
                        end

                        debugMsg("Non admin (" .. GetPlayerName(source) .. ") attempted to run admin command: " .. command_args[1])
                    end
                else
                    command.cmd(source, command_args, user)
                    TriggerEvent("es:userCommandRan", source, command_args, user)
                end

                TriggerEvent("es:commandRan", source, command_args, user)
            else
                TriggerEvent('es:invalidCommandHandler', source, command_args, user)

                if WasEventCanceled() then
                    CancelEvent()
                end
            end
        else
            TriggerEvent('es:chatMessage', source, message, user)
        end
    end)
end)

AddEventHandler('es:addCommand', function(command, callback)
	commands[command] = {}
	commands[command].perm = 0
	commands[command].group = "user"
	commands[command].cmd = callback

	debugMsg("Command added: " .. command)
end)

AddEventHandler('es:addAdminCommand', function(command, perm, callback, callbackfailed)
	commands[command] = {}
	commands[command].perm = perm
	commands[command].group = "superadmin"
	commands[command].cmd = callback
	commands[command].callbackfailed = callbackfailed

	debugMsg("Admin command added: " .. command .. ", requires permission level: " .. perm)
end)

AddEventHandler('es:addGroupCommand', function(command, group, callback, callbackfailed)
	commands[command] = {}
	commands[command].perm = math.maxinteger
	commands[command].group = group
	commands[command].cmd = callback
	commands[command].callbackfailed = callbackfailed

	debugMsg("Group command added: " .. command .. ", requires group: " .. group)
end)

RegisterServerEvent('es:updatePositions')
AddEventHandler('es:updatePositions', function(x, y, z)
    TriggerEvent("LaLife:Player:GetBySource", source, function (user)
        user.coords.x, user.coords.y, user.coords.z = x, y, z
        TriggerEvent('LaLife:Player:Save', {
            identifier = user.identifier,
            coords = user.coords,
        })
    end)
end)

-- Info command
commands['info'] = {}
commands['info'].perm = 0
commands['info'].cmd = function(source, args, user)
	--TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Version: ^22.0.0")
	--TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Commands loaded: ^2" .. (returnIndexesInTable(commands) - 1))
end
