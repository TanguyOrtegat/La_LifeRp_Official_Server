local playerCount = 0
local list = {}

RegisterServerEvent('hardcap:playerActivated')

AddEventHandler('hardcap:playerActivated', function()
  if not list[source] then
    playerCount = playerCount + 1
    list[source] = true
  end
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    playerCount = playerCount - 1
    list[source] = nil
  end
end)

AddEventHandler('playerConnecting', function(name, setReason)
  print('Connecting: ' .. name)

  -- Should never happens as the queue take the relay (but still set a hard limit in case of something fails)
  if playerCount >= 40 then
    print('Full - Something is wrong. :(')

    setReason('This server is full (past ' .. tostring(100) .. ' players).')
    CancelEvent()
  end
end)
