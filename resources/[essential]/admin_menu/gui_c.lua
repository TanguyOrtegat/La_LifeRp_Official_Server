isAdmin = false
players = {}
banlist = {}

RegisterNetEvent("adminresponse")
RegisterNetEvent("Z:playerUpdate")
RegisterNetEvent("amiadmin")
RegisterNetEvent("fillBanlist")

AddEventHandler('adminresponse', function(response)
isAdmin = response
TriggerServerEvent("updateBanlist")
end)


AddEventHandler("fillBanlist", function(thebanlist)
banlist = thebanlist

end)



Citizen.CreateThread(function()
	local currentItemIndex = 1
	local selectedItemIndex = 1

	WarMenu.CreateMenu('admin', 'Admin Menu')
	WarMenu.CreateSubMenu('kickplayers', 'admin', 'Kick Player')
	--WarMenu.CreateSubMenu('banplayers', 'admin', 'Bring Player')
	--WarMenu.CreateSubMenu('unbanplayers', 'admin', 'Unban Player')
	WarMenu.CreateSubMenu('spectateplayers', 'admin', 'Spectate Players')
	WarMenu.CreateSubMenu('bringplayer', 'admin', 'Bring Player')
	WarMenu.CreateSubMenu('teleporttoplayer', 'admin', 'Teleport to Player')
	TriggerServerEvent("amiadmin")




	while true do
		if WarMenu.IsMenuOpened('admin') then
			if not isAdmin then
				WarMenu.CloseMenu()
			elseif isAdmin then
				if WarMenu.MenuButton('Kick Player', 'kickplayers') then

				elseif WarMenu.MenuButton('Bring Player', 'banplayers') then

				elseif WarMenu.MenuButton('Spectate Player', 'spectateplayers') then

				elseif WarMenu.MenuButton('Teleport to Player', 'teleporttoplayer') then

				elseif WarMenu.MenuButton('Bring Player', 'bringplayer') then

				--elseif WarMenu.Button('Refresh Banlist') then
					--TriggerServerEvent("updateBanlist")
				--elseif WarMenu.Button('Unban Player') then

				elseif WarMenu.Button('Close') then
					WarMenu.CloseMenu()
				end
			end
		WarMenu.Display()
		elseif WarMenu.IsMenuOpened("kickplayers") then

		for i,thePlayer in ipairs(players) do
			if WarMenu.MenuButton("["..GetPlayerServerId( thePlayer ).."] "..GetPlayerName( thePlayer ), 'kickplayers') then
				TriggerServerEvent("kickPlayer", GetPlayerServerId( thePlayer ))
			end
		end
		WarMenu.Display()

		elseif WarMenu.IsMenuOpened("banplayers") then

		for i,thePlayer in ipairs(players) do
			if WarMenu.MenuButton("["..GetPlayerServerId( thePlayer ).."] "..GetPlayerName( thePlayer ), 'banplayers') then
				local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
				local heading = GetEntityHeading(GetPlayerPed(player))
				SetEntityCoords(PlayerPedId(GetPlayerServerId( thePlayer )), x,y,z,0,0,heading, false)
			end
		end
		WarMenu.Display()


		elseif WarMenu.IsMenuOpened("spectateplayers") then

		for i,thePlayer in ipairs(players) do
			if WarMenu.MenuButton("["..GetPlayerServerId( thePlayer ).."] "..GetPlayerName( thePlayer ), 'spectateplayers') then
				spectatePlayer(GetPlayerPed(thePlayer), GetPlayerName( thePlayer ))
			end
		end
		WarMenu.Display()

		elseif WarMenu.IsMenuOpened("teleporttoplayer") then

		for i,thePlayer in ipairs(players) do
			if WarMenu.MenuButton("["..GetPlayerServerId( thePlayer ).."] "..GetPlayerName( thePlayer ), 'teleporttoplayer') then
				local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(thePlayer),true))
				local heading = GetEntityHeading(GetPlayerPed(player))
				SetEntityCoords(PlayerPedId(), x,y,z,0,0,heading, false)
			end
		end
		WarMenu.Display()

		elseif WarMenu.IsMenuOpened("bringplayer") then

		for i,thePlayer in ipairs(players) do
			if WarMenu.MenuButton("["..GetPlayerServerId( thePlayer ).."] "..GetPlayerName( thePlayer ), 'bringplayer') then
				local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
				local heading = GetEntityHeading(GetPlayerPed(player))
				SetEntityCoords(PlayerPedId(GetPlayerServerId( thePlayer )), x,y,z,0,0,heading, false)
			end
		end
		WarMenu.Display()

		elseif WarMenu.IsMenuOpened("unbanplayers") then

		for i,theBanned in ipairs(banlist) do
			if WarMenu.MenuButton(theBanned, 'unbanplayers') then
				TriggerServerEvent("unbanPlayer", theBanned)
				TriggerServerEvent("updateBanlist")
			end
		end
		WarMenu.Display()

		elseif IsControlJustReleased(0, 205) and isAdmin then --M by default
			WarMenu.OpenMenu('admin')
		end

		Citizen.Wait(0)
	end
end)


Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
			players = {}
			for i = 0, 31 do
			if NetworkIsPlayerActive( i ) then
				table.insert( players, i )
			end
		end
	end
end)


function spectatePlayer(target,name)
	local playerPed = GetPlayerPed(-1) -- yourself
	enable = true
	if target == playerPed then enable = false end

	if(enable)then

			local targetx,targety,targetz = table.unpack(GetEntityCoords(target, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(true, target)



		ShowNotification("Spectating ~b~<C>"..name.."</C>.")
	else

			local targetx,targety,targetz = table.unpack(GetEntityCoords(target, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(false, target)


		ShowNotification("Stopped Spectating.")
	end
end

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end
