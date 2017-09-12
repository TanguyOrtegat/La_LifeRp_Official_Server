phone = false
phoneId = 0

local function chatMessage(msg)
	TriggerEvent('chatMessage', '', {0, 0, 0}, msg)
end

phones = {
[0] = "Michael's",
[1] = "Trevor's",
[2] = "Franklin's",
[4] = "Prologue"
}

RegisterNetEvent('camera:phone')
AddEventHandler('camera:phone', function(message)		
	local id = tonumber(string.sub(message, 7, 8))
	
	if id == 0 or id == 1 or id == 2 or id == 4 then
		ChangePhone(id)
	else
		chatMessage("^1/phone [ID]")
		chatMessage("^10 - Michael's phone")
		chatMessage("^11 - Trevor's phone")
		chatMessage("^12 - Franklin's phone")
		chatMessage("^14 - Prologue phone")
	end
end)

function ChangePhone(flag)
	if flag == 0 or flag == 1 or flag == 2 or flag == 4 then
		phoneId = flag
		chatMessage("^2Changed phone to "..phones[flag].." phone")
	end
end

frontCam = false

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end

Citizen.CreateThread(function()
DestroyMobilePhone()
	while true do
		Citizen.Wait(0)
		
		if IsControlPressed(1, 288) then -- OPEN PHONE
			CreateMobilePhone(phoneId)
			CellCamActivate(true, true)
			phone = true
		end
		
		if IsControlPressed(1, 177) and phone == true then -- CLOSE PHONE
			DestroyMobilePhone()
			phone = false
			CellCamActivate(false, false)
			if firstTime == true then 
				firstTime = false 
				Citizen.Wait(2500)
				displayDoneMission = true
			end
		end
		
		if IsControlPressed(1, 288) and phone == true then -- SELFIE MODE
			frontCam = not frontCam
			CellFrontCamActivate(frontCam)
		end
			
		if phone == true then
			HideHudComponentThisFrame(7)
			HideHudComponentThisFrame(8)
			HideHudComponentThisFrame(9)
			HideHudComponentThisFrame(6)
			HideHudComponentThisFrame(19)
			HideHudAndRadarThisFrame()
		end
			
		ren = GetMobilePhoneRenderId()
		SetTextRenderId(ren)
		
		-- Everything rendered inside here will appear on your phone.
		
		SetTextRenderId(1) -- NOTE: 1 is default
	end
end)