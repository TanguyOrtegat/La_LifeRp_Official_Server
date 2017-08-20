local playerIndicators = {}

RegisterServerEvent('IndicatorL')
RegisterServerEvent('IndicatorR')

AddEventHandler('IndicatorL', function(IndicatorL)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'left', IndicatorL)
end)

AddEventHandler('IndicatorR', function(IndicatorR)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'right', IndicatorR)
end)

AddEventHandler('IndicatorRL', function(IndicatorRL)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'rightleft', IndicatorRL)
end)

