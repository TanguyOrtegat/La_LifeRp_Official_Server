settings = {
	LogKills = true, -- Log when a player kill an other player.
	LogPnjKills = true, -- Log when a player has been killed by a pnj
	LogEnterPoliceVehicle = true, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = true, -- Log when a player enter in a blacklisted vehicle. Blacklisted vehicles are vehicles in te "blacklistedModels" array.
	DeleteWhenEnterBlackListedVehicle = false, -- if it's on "true", when a player enter in one of blacklisted vehicles, it's going to depop.
	LogWhenHaveBlackListedGun = false, -- Log when a player gets a blacklisted gun
	DeleteBlackListedGun = false, -- if it's on true, when a player gets a blacklisted gun, it's going to be removed
}


blacklistedModels = { -- By default, it's all the military vehicles
	GetHashKey("APC"),
	GetHashKey("BARRACKS"),
	GetHashKey("BARRACKS2"),
	GetHashKey("RHINO"),
	GetHashKey("CRUSADER"),
	GetHashKey("CARGOBOB"),
	GetHashKey("SAVAGE"),
	GetHashKey("TITAN"),
	GetHashKey("LAZER"),
}


blacklistedGuns = {
	--Get models id here : https://pastebin.com/0wwDZgkF
	--0x99B507EA,
	-- (Example)
}
