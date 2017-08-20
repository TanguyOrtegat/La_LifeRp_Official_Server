-- Coded by Albo1125 to help debug FxServer "ghost" session issues.

RegisterNetEvent("SendNetworkInfo")
AddEventHandler("SendNetworkInfo", function()
	local numplayers = NetworkGetNumConnectedPlayers()
	local ishost = NetworkIsHost()
	local serverid = GetPlayerServerId(PlayerId())
	TriggerServerEvent("GetNetworkInfo", serverid, numplayers, ishost)
end)