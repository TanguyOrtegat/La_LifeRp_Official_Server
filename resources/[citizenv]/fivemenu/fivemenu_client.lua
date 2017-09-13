--[[
FiveMenu v1.4
by GeeknessFr

détruit par Draziak :)
--]]

------------------------------ KEY LIST HERE ------------------------------

--[[    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118    ]]

------------------------------ KEY LIST HERE -----------------------------

--> Voir ReadMe.txt pour la doc.
local livery = 0
local kpress = false

menuitem = {
  id = 0,
  name = "",
  quantity = 0
}

VMenu = {

	-----------------------------------------------------
	----------------- CONFIGURATION ---------------------
	-----------------------------------------------------
	-- ATTENTION : Bien laisser la virgule ( , ) à la fin de chaque ligne !


	-- Configuration des Touches
	-- Liste . https.//forum.fivem.net/t/list-of-possible-keys-in-array/1979

	-- { Haut, Bas, Gauche, Droite, Valide, Retour}
	-- keys = {172, 173, 174, 175, 18, 177}, ----- Valeurs par défaut, en cas d'édition.
	keys = {172, 173, 174, 175, 18, 177},
	-- Configuration d'une touche pour ouvrir le menu.
	-- Si aucune touche, mettre nil

	-- Ouverture du Menu
	--openKey = 167, -- F6 -- Default
	-- Ouverture par un event serveur. -> vmenu:openMenu

	--VMenu.openKey = nil -- Aucune touche.
	mopenKey = 168, -- F6
	openKey = 167, -- F6

	-- Pour la position : Valeurs de 0 à 1 par rapport à la taille totale de l'affichage du jeu. ! (0 = 0% - 1 = 100%)

	-- Coin Haut Gauche du Menu
	top = 0.01,
	left = 0.01,

	-- Largeur du Menu
	width = 0.23,

	-- Nombre de lignes affichées sur le menu
	itemsOnScreen = 9,

	HeaderDict = "fivemenu", -- Nom du Fichier Dictionnaire sans le ".ytd" qui est placé dans le dossier "stream"

	rootMenu = 98, -- ID Menu de départ (0 par défaut)

	voiceTarget = true, -- Active le ciblage à la voix, si besoin.
	-----------------------> User.target contient le PlayerID à l'ouverture du Menu.

	checkUser = false, -- Active la récupération des infos du joueur via Essential Mod. (Voir ReadMe)


	------------------ AJOUT
	updatedChar = true,

	mainMenu = false,
  store = false,
  barbershop = false,
  outfitshop = false,
  garagepolice = false,
  garagegouv = false,
  garagebateaupolice = false,
  garagehelicopolice = false,
  garagehelicoambulance = false,
  garagehelicogouv = false,
  armorypolice = false,
  armorygouv = false,
  vote = false,
  lockerpolice = false,

	Tanker_company = false,
	Container_company = false,
	Frigorifique_company = false,
	Log_company = false,

  item_menu = false,
	police = false,
	telephone = false,
	animations = false,
	depan = false,
	taxi = false,
	medic = false,
	pres = false,
	garde = false,
	jobs = false,
  garda = false,

	Cuffedkeys = {167, 168},
	------------------ FIN AJOUT

	-----------------------------------------------------
	----------------- FIN CONFIGURATION -----------------
	-----------------------------------------------------

	visible = false,
	curMenu = 0,
	prevMenu = 0,
	curItem = 1,
	scroll = 0,
	closedTime = 0,
	offsetY = 0.03,
	HdHeight = 0,
	BgHeight = 0.314,
	menus = {},
	items = {},
	disableKeys = { 19, 20, 43, 48, 187, 233, 309, 311, 85, 74, 21, 73, 121, 45, 80, 140, 170, 177, 194, 202, 225, 263},
	target = -1,
	debugKeys = false

}

local VOpts = {
	firstLoad = false,
	toUpdate = nil,
	LastVeh = 0,
	openMenu = false
}

local isHaveMask = false

User = {
	Spawned = false,
	Loaded = false,
	group = "0",
	permission_level = 0,
	money = 0,
	dirtymoney = 0,
	job = 0,
	police = 0,
	enService = 0,
	nom = "",
	prenom = "",
	vehicle = "",
	identifier = nil,
	telephone = "",
	gender = ""
}
--SetPedDecoration(ped, col, tats)
local Homme = {
  Tete = {
    [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
    [2] = {["name"] = "MP_Bea_M_Neck_001", ["col"] = "mpbeach_overlays"},
    [3] = {["name"] = "MP_Bea_M_Neck_000", ["col"] = "mpbeach_overlays"},
    [4] = {["name"] = "MP_Bea_M_Head_002", ["col"] = "mpbeach_overlays"},
    [5] = {["name"] = "MP_Bea_M_Head_001", ["col"] = "mpbeach_overlays"},
    [6] = {["name"] = "MP_Bea_M_Head_000", ["col"] = "mpbeach_overlays"},
    [7] = {["name"] = "FM_Tat_Award_M_000", ["col"] = "multiplayer_overlays"},
  },
  Bras_Gauche = {
    [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
    [2] = {["name"] = "MP_Bea_M_LArm_001", ["col"] = "mpbeach_overlays"},
    [3] = {["name"] = "MP_Bea_M_LArm_000", ["col"] = "mpbeach_overlays"},
    [4] = {["name"] = "FM_Tat_Award_M_001", ["col"] = "multiplayer_overlays"},
    [5] = {["name"] = "FM_Tat_Award_M_015", ["col"] = "multiplayer_overlays"},
    [6] = {["name"] = "FM_Tat_M_005", ["col"] = "multiplayer_overlays"},
    [7] = {["name"] = "FM_Tat_M_006", ["col"] = "multiplayer_overlays"},
    [8] = {["name"] = "FM_Tat_M_015", ["col"] = "multiplayer_overlays"},
    [9] = {["name"] = "FM_Tat_M_031", ["col"] = "multiplayer_overlays"},
    [10] = {["name"] = "FM_Tat_M_041", ["col"] = "multiplayer_overlays"},
  },
  Bras_Droit = {
    [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
    [2] = {["name"] = "MP_Bea_M_RArm_000", ["col"] = "mpbeach_overlays"},
    [3] = {["name"] = "MP_Bea_M_RArm_001", ["col"] = "mpbeach_overlays"},
    [4] = {["name"] = "FM_Tat_Award_M_00", ["col"] = "multiplayer_overlays"},
    [5] = {["name"] = "FM_Tat_M_000", ["col"] = "multiplayer_overlays"},
    [6] = {["name"] = "FM_Tat_M_001", ["col"] = "multiplayer_overlays"},
    [7] = {["name"] = "FM_Tat_M_003", ["col"] = "multiplayer_overlays"},
    [8] = {["name"] = "FM_Tat_Award_M_010", ["col"] = "multiplayer_overlays"},
    [9] = {["name"] = "FM_Tat_M_014", ["col"] = "multiplayer_overlays"},
    [10] = {["name"] = "FM_Tat_M_018", ["col"] = "multiplayer_overlays"},
    [11] = {["name"] = "FM_Tat_M_027", ["col"] = "multiplayer_overlays"},
    [12] = {["name"] = "FM_Tat_M_028", ["col"] = "multiplayer_overlays"},
    [13] = {["name"] = "FM_Tat_M_038", ["col"] = "multiplayer_overlays"},
    [14] = {["name"] = "FM_Tat_M_047", ["col"] = "multiplayer_overlays"},
  },

  Jambe_Droite = {
    [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
    [2] = {["name"] = "MP_Bea_M_Rleg_000", ["col"] = "mpbeach_overlays"},
    [3] = {["name"] = "FM_Tat_Award_M_006", ["col"] = "multiplayer_overlays"},
    [4] = {["name"] = "FM_Tat_M_007", ["col"] = "multiplayer_overlays"},
    [5] = {["name"] = "FM_Tat_M_017", ["col"] = "multiplayer_overlays"},
    [6] = {["name"] = "FM_Tat_M_022", ["col"] = "multiplayer_overlays"},
    [7] = {["name"] = "FM_Tat_M_039", ["col"] = "multiplayer_overlays"},
    [8] = {["name"] = "FM_Tat_M_040", ["col"] = "multiplayer_overlays"},
    [9] = {["name"] = "FM_Tat_M_042", ["col"] = "multiplayer_overlays"},
    [10] = {["name"] = "FM_Tat_M_043", ["col"] = "multiplayer_overlays"},
  },

  Jambe_Gauche = {
    [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
    [2] = {["name"] = "MP_Bea_M_Lleg_000", ["col"] = "mpbeach_overlays"},
    [3] = {["name"] = "FM_Tat_Award_M_007", ["col"] = "multiplayer_overlays"},
    [4] = {["name"] = "FM_Tat_Award_M_009", ["col"] = "multiplayer_overlays"},
    [5] = {["name"] = "FM_Tat_M_002", ["col"] = "multiplayer_overlays"},
    [6] = {["name"] = "FM_Tat_M_002", ["col"] = "multiplayer_overlays"},
    [7] = {["name"] = "FM_Tat_M_008", ["col"] = "multiplayer_overlays"},
    [8] = {["name"] = "FM_Tat_M_021", ["col"] = "multiplayer_overlays"},
    [9] = {["name"] = "FM_Tat_M_023", ["col"] = "multiplayer_overlays"},
    [10] = {["name"] = "FM_Tat_M_026", ["col"] = "multiplayer_overlays"},
    [11] = {["name"] = "FM_Tat_M_032", ["col"] = "multiplayer_overlays"},
    [12] = {["name"] = "FM_Tat_M_033", ["col"] = "multiplayer_overlays"},
    [13] = {["name"] = "FM_Tat_M_035", ["col"] = "multiplayer_overlays"},
    [14] = {["name"] = "FM_Tat_M_037", ["col"] = "multiplayer_overlays"},
  },

  Torso = {
    [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
    [2] = {["name"] = "MP_Bea_M_Stom_001", ["col"] = "mpbeach_overlays"},
    [3] = {["name"] = "MP_Bea_M_Stom_000", ["col"] = "mpbeach_overlays"},
    [4] = {["name"] = "MP_Bea_M_Chest_001", ["col"] = "mpbeach_overlays"},
    [5] = {["name"] = "MP_Bea_M_Back_000", ["col"] = "mpbeach_overlays"},
    [6] = {["name"] = "MP_Bea_M_Chest_000", ["col"] = "mpbeach_overlays"},
    [7] = {["name"] = "FM_Tat_Award_M_003", ["col"] = "multiplayer_overlays"},
    [8] = {["name"] = "FM_Tat_Award_M_004", ["col"] = "multiplayer_overlays"},
    [9] = {["name"] = "FM_Tat_Award_M_005", ["col"] = "multiplayer_overlays"},
    [10] = {["name"] = "FM_Tat_Award_M_008", ["col"] = "multiplayer_overlays"},
    [11] = {["name"] = "FM_Tat_Award_M_011", ["col"] = "multiplayer_overlays"},
    [12] = {["name"] = "FM_Tat_Award_M_012", ["col"] = "multiplayer_overlays"},
    [13] = {["name"] = "FM_Tat_Award_M_013", ["col"] = "multiplayer_overlays"},
    [14] = {["name"] = "FM_Tat_Award_M_014", ["col"] = "multiplayer_overlays"},
    [15] = {["name"] = "FM_Tat_Award_M_016", ["col"] = "multiplayer_overlays"},
    [16] = {["name"] = "FM_Tat_Award_M_017", ["col"] = "multiplayer_overlays"},
    [17] = {["name"] = "FM_Tat_Award_M_018", ["col"] = "multiplayer_overlays"},
    [18] = {["name"] = "FM_Tat_Award_M_019", ["col"] = "multiplayer_overlays"},
    [19] = {["name"] = "FM_Tat_M_004", ["col"] = "multiplayer_overlays"},
    [20] = {["name"] = "FM_Tat_M_009", ["col"] = "multiplayer_overlays"},
    [21] = {["name"] = "FM_Tat_M_010", ["col"] = "multiplayer_overlays"},
    [22] = {["name"] = "FM_Tat_M_011", ["col"] = "multiplayer_overlays"},
    [23] = {["name"] = "FM_Tat_M_012", ["col"] = "multiplayer_overlays"},
    [24] = {["name"] = "FM_Tat_M_013", ["col"] = "multiplayer_overlays"},
    [25] = {["name"] = "FM_Tat_M_016", ["col"] = "multiplayer_overlays"},
    [26] = {["name"] = "FM_Tat_M_019", ["col"] = "multiplayer_overlays"},
    [27] = {["name"] = "FM_Tat_M_020", ["col"] = "multiplayer_overlays"},
    [28] = {["name"] = "FM_Tat_M_024", ["col"] = "multiplayer_overlays"},
    [29] = {["name"] = "FM_Tat_M_025", ["col"] = "multiplayer_overlays"},
    [30] = {["name"] = "FM_Tat_M_029", ["col"] = "multiplayer_overlays"},
    [31] = {["name"] = "FM_Tat_M_030", ["col"] = "multiplayer_overlays"},
    [32] = {["name"] = "FM_Tat_M_034", ["col"] = "multiplayer_overlays"},
    [33] = {["name"] = "FM_Tat_M_036", ["col"] = "multiplayer_overlays"},
    [34] = {["name"] = "FM_Tat_M_044", ["col"] = "multiplayer_overlays"},
    [35] = {["name"] = "FM_Tat_M_045", ["col"] = "multiplayer_overlays"},
    [36] = {["name"] = "FM_Tat_M_046", ["col"] = "multiplayer_overlays"},
  },
}

local Femme = {
    Jambe_Droite = {
      [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
      [2] = {["name"] = "MP_Bea_F_RLeg_000", ["col"] = "mpbeach_overlays"},
    	[3] = {["name"] = "FM_Tat_Award_F_006", ["col"] = "multiplayer_overlays"},
    },
  	Jambe_Gauche = {
      [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
      [2] = {["name"] = "FM_Tat_Award_F_009", ["col"] = "multiplayer_overlays"},
  	},
    Bras_Droit = {
      [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
      [2] = {["name"] = "MP_Bea_F_RArm_001", ["col"] = "mpbeach_overlays"},
    	[3] = {["name"] = "FM_Tat_Award_F_002", ["col"] = "multiplayer_overlays"},
    	[4] = {["name"] = "FM_Tat_Award_F_010", ["col"] = "multiplayer_overlays"},
    },
    Bras_Gauche = {
      [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
      [2] = {["name"] = "MP_Bea_F_LArm_000", ["col"] = "mpbeach_overlays"},
      [3] = {["name"] = "MP_Bea_F_LArm_001", ["col"] = "mpbeach_overlays"},
    	[4] = {["name"] = "FM_Tat_Award_F_001", ["col"] = "multiplayer_overlays"},
    	[5] = {["name"] = "FM_Tat_Award_F_007", ["col"] = "multiplayer_overlays"},
    	[6] = {["name"] = "FM_Tat_Award_F_015", ["col"] = "multiplayer_overlays"},
    },
    Torso = {
      [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
      [2] = {["name"] = "MP_Bea_F_Back_000", ["col"] = "mpbeach_overlays"},
      [3] = {["name"] = "MP_Bea_F_Back_002", ["col"] = "mpbeach_overlays"},
      [4] = {["name"] = "MP_Bea_F_Chest_001", ["col"] = "mpbeach_overlays"},
      [5] = {["name"] = "MP_Bea_F_Chest_002", ["col"] = "mpbeach_overlays"},
      [6] = {["name"] = "MP_Bea_F_RSide_000", ["col"] = "mpbeach_overlays"},
      [7] = {["name"] = "MP_Bea_F_Should_000", ["col"] = "mpbeach_overlays"},
      [8] = {["name"] = "MP_Bea_F_Should_001", ["col"] = "mpbeach_overlays"},
      [9] = {["name"] = "MP_Bea_F_Stom_000", ["col"] = "mpbeach_overlays"},
      [10] = {["name"] = "MP_Bea_F_Stom_001", ["col"] = "mpbeach_overlays"},
      [11] = {["name"] = "MP_Bea_F_Stom_002", ["col"] = "mpbeach_overlays"},
    	[12] = {["name"] = "FM_Tat_Award_F_003", ["col"] = "multiplayer_overlays"},
    	[13] = {["name"] = "FM_Tat_Award_F_004", ["col"] = "multiplayer_overlays"},
    	[14] = {["name"] = "FM_Tat_Award_F_005", ["col"] = "multiplayer_overlays"},
    	[15] = {["name"] = "FM_Tat_Award_F_008", ["col"] = "multiplayer_overlays"},
    	[16] = {["name"] = "FM_Tat_Award_F_011", ["col"] = "multiplayer_overlays"},
    	[17] = {["name"] = "FM_Tat_Award_F_012", ["col"] = "multiplayer_overlays"},
    	[18] = {["name"] = "FM_Tat_Award_F_013", ["col"] = "multiplayer_overlays"},
    	[19] = {["name"] = "FM_Tat_Award_F_014", ["col"] = "multiplayer_overlays"},
      [20] = {["name"] = "FM_Tat_Award_F_016", ["col"] = "multiplayer_overlays"},
    },
    Tete = {
      [1] = {["name"] = "rien", ["col"] = "mpbeach_overlays"},
      [2] = {["name"] = "MP_Bea_F_Neck_000", ["col"] = "mpbeach_overlays"},
    	[3] = {["name"] = "FM_Tat_Award_F_000", ["col"] = "multiplayer_overlays"},
    },
  }

-- AddEventHandler("playerSpawned", function()
-- 	TriggerServerEvent('vmenu:sendData_s')
-- end)
--
-- RegisterNetEvent("vmenu:f_sendData")
-- AddEventHandler("vmenu:f_sendData", function(data) -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
-- 	VMenu = data
-- 	Citizen.Trace(VMenu[1].top)
-- end)



-------- DISTANCE ENTRE JOUEUR ET POINT
function IsNearPoints(area, dist)
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	for _, item in pairs(area) do
		local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance <= dist) then
			return true
		end
	end
end

--------- SICK TEXT DISPLAY
local ShowMsgtime = { msg = "", time = 0 }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ShowMsgtime.time ~= 0 then
			drawTxt(ShowMsgtime.msg, 0,1,0.5,0.8,0.6,255,255,255,255)
			ShowMsgtime.time = ShowMsgtime.time - 1
		end
	end
end)

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

--------- FIN DÉCLARATION

VMenu.ctop = ((VMenu.width / 2) / 2) + VMenu.top
VMenu.cleft = (VMenu.width / 2) + VMenu.left
VMenu.TextX = VMenu.left + 0.01
VMenu.BgY = VMenu.top + VMenu.HdHeight + (VMenu.BgHeight / 2)




function VMenu.Info(text, loop)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, loop, 1, 0)
end

function VMenu.DrawText(Text, X, Y, ScX, ScY, Font, Outline, Shadow, Center, RightJustify, R, G, B, A)
	SetTextFont(Font)
	SetTextScale(ScX, ScY)
	SetTextColour(R, G, B, A)
	if Outline then
		SetTextOutline()
	end
	if Shadow then
		SetTextDropShadow()
	end
	SetTextCentre(Center)
	SetTextRightJustify(RightJustify)
	SetTextEntry("STRING")
	AddTextComponentString(Text)
	DrawText(X, Y)
end
function VMenu.DrawHeader(td)
	local header = VMenu.menus[VMenu.curMenu].header
	if header ~= nil then
		VMenu.HdHeight = (VMenu.width / 2)
		VMenu.ctop = ((VMenu.width / 2) / 2) + VMenu.top
		if string.lower(header) == "default" then
			DrawSprite(td, "default_bgd", VMenu.cleft, VMenu.ctop, VMenu.width, VMenu.width / 2, 0.0, 255, 255, 255, 255)
			VMenu.DrawText(VMenu.menus[VMenu.curMenu].name, VMenu.left + (VMenu.width / 2), VMenu.top + (VMenu.HdHeight / 2) - 0.02, VMenu.width, 0.8, 7, false, false, true, false, 255, 255, 255, 255)
		else
			DrawSprite(td, header, VMenu.cleft, VMenu.ctop, VMenu.width, VMenu.width / 2, 0.0, 255, 255, 255, 255)
		end
	else
		VMenu.HdHeight = 0
		VMenu.ctop = VMenu.top
	end
end
function VMenu.DrawBg(td)
	local numItems = #VMenu.items[VMenu.curMenu]
	if numItems > VMenu.itemsOnScreen then numItems = VMenu.itemsOnScreen end
	VMenu.BgHeight = numItems * VMenu.offsetY + 0.05
	VMenu.BgY = VMenu.top + VMenu.HdHeight + (VMenu.BgHeight / 2)
	DrawSprite(td, "gradient_bgd", VMenu.cleft, VMenu.BgY , VMenu.width, VMenu.BgHeight, 0.0, 255, 255, 255, 255)
end
function VMenu.DrawItems(td)
	local curMenu = VMenu.curMenu
	local curItem = VMenu.curItem
	local numItems = #VMenu.items[curMenu]
	local menuTitle = string.upper(VMenu.menus[curMenu].name)
	local count = tostring(curItem) .. "/" .. tostring(numItems)
	local footerY = VMenu.BgY + (VMenu.BgHeight / 2)

	VMenu.DrawText(menuTitle, VMenu.TextX, VMenu.top + VMenu.HdHeight + 0.005, 0.30, 0.33, 8, false, false, false, false, 255, 255, 255, 255)
	VMenu.DrawText(count, (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.005, 0.30, 0.33, 8, false, false, false, false, 255, 255, 255, 255)

	for i = 1 + VMenu.scroll, numItems do
		if i > VMenu.itemsOnScreen + VMenu.scroll then
			break
		end

		local itemTitle = VMenu.items[curMenu][i].name
		local itemDesc = VMenu.items[curMenu][i].desc

		if VMenu.items[curMenu][i].type == "separator" then
			VMenu.DrawText("- "..itemTitle.." -", VMenu.left + (VMenu.width / 2), VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.45, 0.45, 6, false, false, true, false, 255, 255, 255, 255)
		elseif i == curItem then
			DrawSprite(td, "gradient_nav", VMenu.cleft, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), VMenu.width, 0.03, 0.0, 255, 255, 255, 255)
			VMenu.DrawText(itemTitle, VMenu.TextX, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.30, 0.33, 8, false, false, false, false, 0, 0, 0, 255)

			if itemDesc ~= "" and itemDesc ~= nil then
				DrawSprite(td, "gradient_bgd", VMenu.cleft, footerY + 0.045, VMenu.width, 0.030, 0.0, 255, 255, 255, 120)
				VMenu.DrawText(itemDesc, VMenu.TextX, footerY + 0.032, VMenu.width, 0.33, 8, false, false, false, false, 255, 255, 255, 220)
			end

		else
			VMenu.DrawText(itemTitle, VMenu.TextX, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.30, 0.33, 8, false, false, false, false, 255, 255, 255, 255)
		end

		if VMenu.items[curMenu][i].type == "bool" then
			local sprite = "shop_box_blank"
			local varname = VMenu.items[curMenu][i].varname
			if VOpts[varname] then sprite = "shop_box_tick" end
			if i == curItem then sprite = sprite.."b" end

			DrawSprite(td, sprite, (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.02, 0.04, 0.0, 255, 255, 255, 200)
		end
		if VMenu.items[curMenu][i].type == "num" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[curMenu][i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.03, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
		if VMenu.items[curMenu][i].type == "num1000" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[curMenu][i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.03, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
    if VMenu.items[curMenu][i].type == "num100" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[curMenu][i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.03, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
    if VMenu.items[curMenu][i].type == "num10" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[curMenu][i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.03, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
    if VMenu.items[curMenu][i].type == "num50" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[curMenu][i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.03, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.064 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
		if VMenu.items[curMenu][i].type == "valsub" then
			local varname = VMenu.items[curMenu][i].varname
			local c = 255
			if i == curItem then
				c = 0
			end
			VMenu.DrawText(tostring(VOpts[varname]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.050 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end

	end
	DrawRect(VMenu.cleft, footerY + 0.015, VMenu.width, 0.025, 0, 0, 0, 160);
	DrawSprite(td, "shop_arrows_upanddown", VMenu.cleft, footerY + 0.015, 0.018, 0.03, 0.0, 255, 255, 255, 255)
end
function VMenu.Show()
	if VMenu.visible then
		local td = VMenu.HeaderDict
		if not HasStreamedTextureDictLoaded(td) then
			RequestStreamedTextureDict(td, true)
			while not HasStreamedTextureDictLoaded(td) do
				Wait(10)
			end
		end
		VMenu.DrawHeader(td)
		VMenu.DrawBg(td)
		VMenu.DrawItems(td)
	end
end

function scrollAdjust()
	if #VMenu.items[VMenu.curMenu] > VMenu.itemsOnScreen then
		if VMenu.curItem < math.floor((VMenu.itemsOnScreen) / 2) + 1  then
			VMenu.scroll = 0
		end
		if VMenu.curItem >= math.floor((VMenu.itemsOnScreen) / 2) + 1 then
			VMenu.scroll = VMenu.curItem - (math.floor((VMenu.itemsOnScreen) / 2) + 1)
		end
		if VMenu.scroll + VMenu.itemsOnScreen >= #VMenu.items[VMenu.curMenu] then
			VMenu.scroll = #VMenu.items[VMenu.curMenu] - VMenu.itemsOnScreen
		end
	else
		VMenu.scroll = 0
	end
end

function VMenu.k_down()
	VMenu.curItem = VMenu.curItem + 1;
	if VMenu.curItem > #VMenu.items[VMenu.curMenu] then
		VMenu.curItem = 1
	end
	local infinite = 0
	while VMenu.items[VMenu.curMenu][VMenu.curItem].type == "separator" do
		VMenu.curItem = VMenu.curItem + 1;
		if VMenu.curItem > #VMenu.items[VMenu.curMenu] then
			VMenu.curItem = 1
			infinite = infinite + 1
			if infinite == 2 then
				break
			end
		end
	end
	PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	scrollAdjust()
end

function VMenu.k_up()
	VMenu.curItem = VMenu.curItem - 1;
	if VMenu.curItem < 1 then
		VMenu.curItem = #VMenu.items[VMenu.curMenu]
	end
	local infinite = 0
	while VMenu.items[VMenu.curMenu][VMenu.curItem].type == "separator" do
		VMenu.curItem = VMenu.curItem - 1;
		if VMenu.curItem < 1 then
			VMenu.curItem = #VMenu.items[VMenu.curMenu]
			infinite = infinite + 1
			if infinite == 2 then
				break
			end
		end
	end
	PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	scrollAdjust()
end

function VMenu.k_left()
	if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] - 1
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
	if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num1000" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] - 1000
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
  if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num100" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] - 100
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
  if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num10" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] - 10
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
  if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num50" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] - 50
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
end

function VMenu.k_right()
	if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] + 1
		if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
	if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num1000" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] + 1000
		if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
  if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num100" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] + 100
		if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
  if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num10" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] + 10
		if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
  if VMenu.items[VMenu.curMenu][VMenu.curItem].type == "num50" then
		local varname = VMenu.items[VMenu.curMenu][VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] + 50
		if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
end

function VMenu.valid()
	local curMenu = VMenu.curMenu
	local curItem = VMenu.curItem
	if (VMenu.items[curMenu][curItem].type == "sub" or VMenu.items[curMenu][curItem].type == "valsub") and VMenu.items[curMenu][curItem].toMenu ~= nil then
		local newMenu = VMenu.items[curMenu][curItem].toMenu
		VMenu.menus[newMenu].prev = curMenu
		VMenu.menus[curMenu].select = curItem
		VMenu.curMenu = newMenu
		VMenu.curItem = VMenu.menus[newMenu].select
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		scrollAdjust()
		Wait(1000)
	end
	if VMenu.items[curMenu][curItem].type == "func" and VMenu.items[curMenu][curItem].func ~= nil then
		local func = VMenu.items[curMenu][curItem].func
		local params = VMenu.items[curMenu][curItem].params
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		TriggerEvent(func, VMenu.target, table.unpack(params))
		if VMenu.curMenu == 5 then
			TriggerEvent("vmenu:closeMenu")
		elseif VMenu.curMenu == 7 then
			TriggerEvent("vmenu:closeMenu")
		elseif VMenu.curMenu == 15 then
			TriggerEvent("vmenu:closeMenu")
		elseif VMenu.curMenu == 17 then
			TriggerEvent("vmenu:closeMenu")
		elseif VMenu.curMenu == 18 then
			TriggerEvent("vmenu:closeMenu")
		elseif VMenu.curMenu == 19 then
			TriggerEvent("vmenu:closeMenu")
		elseif VMenu.curMenu == 98 then
			--TriggerServerEvent("inventory:getItems_s")
			getMainMenu()
		end
		if #VMenu.items[curMenu] < curItem then
			if VMenu.telephone then
				VMenu.curItem = 2
				curItem = 2
			else
				VMenu.curItem = 1
				curItem = 1
			end
		end
		scrollAdjust()
		Wait(1000)
	end
	if VMenu.items[curMenu][curItem].type == "bool" and VMenu.items[curMenu][curItem].varname ~= nil then
		VOpts[VMenu.items[curMenu][curItem].varname] = not VOpts[VMenu.items[curMenu][curItem].varname]
		VOpts['toUpdate'] = VMenu.items[curMenu][curItem].varname
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		Wait(1000)
	end
end

function VMenu.back()
	if VMenu.curMenu ~= VMenu.rootMenu then
		local curMenu = VMenu.curMenu
		local newMenu = VMenu.menus[curMenu].prev
		VMenu.menus[curMenu].prev = 0
		VMenu.menus[curMenu].select = VMenu.curItem
		VMenu.curMenu = newMenu
		VMenu.curItem = VMenu.menus[newMenu].select
		scrollAdjust()
	else
		TriggerEvent("vmenu:closeMenu")
	end
end


local k_delay = 200 -- 1er Delay
local k_delay2 = 160 -- puis 2 3 et 4ème delay
local k_delay3 = 50 -- et si touche restée appuyée.



local jLastKey = 0
local jTimer = 0
function isJustPressedKey(key)
	if key ~= jLastKey and IsDisabledControlPressed(0, key) then -- Pas la même touche -> RESET
		jLastKey = key
		jTimer = GetGameTimer()
		return true

	elseif key == jLastKey and IsDisabledControlPressed(0, key) then -- Meme Touche
		if GetGameTimer() - jTimer < k_delay3 then
			while IsDisabledControlPressed(0, key) do
				Wait(1)
			end
			return false
		else
			jTimer = GetGameTimer()
			return true
		end

	end
	return false
end

local lastKey = 0
local timer = 0
local count = 0
local pass = false

function isPressedKey(key)
	if key ~= lastKey and IsDisabledControlPressed(0, key) then -- Pas la même touche -> RESET
		lastKey = key
		timer = GetGameTimer()
		count = 0
		pass = false
		return true

	elseif key == lastKey and IsDisabledControlPressed(0, key) then -- Meme Touche
		if pass then 										-- Accélération du défilement
			count = 0
			if GetGameTimer() - timer > k_delay3 and GetGameTimer() - timer < k_delay then
				timer = GetGameTimer()
				return true
			elseif GetGameTimer() - timer > k_delay then
				pass = false
				timer = GetGameTimer()
				return true
			end
			return false
		elseif GetGameTimer() - timer > k_delay + 100 then
			count = 0
			timer = GetGameTimer()
			return true
		elseif GetGameTimer() - timer > k_delay then
			count = 1
			timer = GetGameTimer()
			return true
		elseif GetGameTimer() - timer > k_delay2 and (count > 0 and count < 5) then
			count = count + 1
			timer = GetGameTimer()
			return true
		elseif count > 4 then
			pass = true
			return false
		end
		return false
	end
	return false
end

function VMenu.test_keys()
	Citizen.CreateThread(function()
		while true do
			Wait(5)
			if VMenu.visible then
				if isPressedKey(VMenu.keys[1]) then
					VMenu.k_up()
				elseif isPressedKey(VMenu.keys[2]) then
					VMenu.k_down()
				elseif isPressedKey(VMenu.keys[3]) then
					VMenu.k_left()
				elseif isPressedKey(VMenu.keys[4]) then
					VMenu.k_right()
				elseif isJustPressedKey(VMenu.keys[5]) then
					VMenu.valid()
				elseif isJustPressedKey(VMenu.keys[6]) then
					VMenu.back()
				end
			end
			if VMenu.openKey ~= nil then
				if IsControlPressed(0, VMenu.openKey) or IsDisabledControlPressed(0, VMenu.openKey) then
					if VMenu.curMenu ~= 98 then
						if VMenu.visible then
							TriggerEvent("vmenu:toggleMenu")
						end
						if (VMenu.updatedChar == false) then
							Wait(500)
							TriggerServerEvent("vmenu:lastChar")
							Wait(200)
						end
					end
					Wait(200)
				end
			end
			if VMenu.mopenKey ~= nil then
				if IsControlPressed(0, VMenu.mopenKey) or IsDisabledControlPressed(0, VMenu.mopenKey) then
					if VMenu.curMenu == 98 then
						if VMenu.visible then
							TriggerEvent("vmenu:toggleMenu")
						else
							TriggerEvent("vmenu:openMenu", 98)
						end
					end
					Wait(200)
				end
			end

		end
	end)
end

function VMenu.DisableControls()
	for i = 1, #VMenu.keys do
		DisableControlAction(0,  VMenu.keys[i],  1)
	end
	for i = 1, #VMenu.disableKeys do
		DisableControlAction(0,  VMenu.disableKeys[i],  1)
	end
end

function DisableControlsHandCuffed()
	for i = 1, #VMenu.Cuffedkeys do
		DisableControlAction(0,  VMenu.Cuffedkeys[i],  1)
	end
end


function VMenu.AddMenu(id, menu, header)
	VMenu.menus[id] = {}
	VMenu.menus[id].name = menu
	VMenu.menus[id].header = header
	VMenu.menus[id].prev = 0 -- Default Value
	VMenu.menus[id].select = 1 -- Default Value
	VMenu.items[id] = {} 	-- Table Creation / Reset
end

function VMenu.ResetMenu(id, menu, header)
	VMenu.items[id] = {} 	-- Table Creation / Reset
end

function VMenu.AddSep(bindMenu, item)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "separator"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].desc = nil
end
function VMenu.EditSep(bindMenu, item)
	local size = nil
	for i = 1, #VMenu.items[bindMenu] do
		if VMenu.items[bindMenu][i].type == "separator" then
			size = i
			break
		end
	end
	VMenu.items[bindMenu][size] = {}
	VMenu.items[bindMenu][size].type = "separator"
	VMenu.items[bindMenu][size].name = tostring(item)
	VMenu.items[bindMenu][size].desc = nil
end
function VMenu.AddSub(bindMenu, item, toMenu, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "sub"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].toMenu = toMenu
	VMenu.items[bindMenu][size+1].desc = desc
end
function VMenu.AddFunc(bindMenu, item, func, params, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "func"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].func = func
	VMenu.items[bindMenu][size+1].params = params
	VMenu.items[bindMenu][size+1].desc = desc
end
function VMenu.EditFunc(bindMenu, item, func, params, desc)
	local size = nil
	for i = 1, #VMenu.items[bindMenu] do
		if VMenu.items[bindMenu][i].name == item then
			size = i
			break
		end
	end
	VMenu.items[bindMenu][size] = {}
	VMenu.items[bindMenu][size].type = "func"
	VMenu.items[bindMenu][size].name = item
	VMenu.items[bindMenu][size].func = func
	VMenu.items[bindMenu][size].params = params
	VMenu.items[bindMenu][size].desc = desc
end
function VMenu.AddBool(bindMenu, item, varname, value, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "bool"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].varname = varname
	VMenu.items[bindMenu][size+1].desc = desc
	VOpts[varname] = value
end
function VMenu.AddNum(bindMenu, item, varname, valmin, valmax, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "num"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].varname = varname
	VMenu.items[bindMenu][size+1].desc = desc
	VOpts[varname] = {valmin, valmin, valmax}
end
function VMenu.AddNum1000(bindMenu, item, varname, valmin, valmax, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "num1000"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].varname = varname
	VMenu.items[bindMenu][size+1].desc = desc
	VOpts[varname] = {valmin, valmin, valmax}
end
function VMenu.AddNum100(bindMenu, item, varname, valmin, valmax, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "num100"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].varname = varname
	VMenu.items[bindMenu][size+1].desc = desc
	VOpts[varname] = {valmin, valmin, valmax}
end
function VMenu.AddNum10(bindMenu, item, varname, valmin, valmax, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "num10"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].varname = varname
	VMenu.items[bindMenu][size+1].desc = desc
	VOpts[varname] = {valmin, valmin, valmax}
end
function VMenu.AddNum50(bindMenu, item, varname, valmin, valmax, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "num50"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].varname = varname
	VMenu.items[bindMenu][size+1].desc = desc
	VOpts[varname] = {valmin, valmin, valmax}
end
function VMenu.EditNum(bindMenu, item, varname, valmin, valmax, desc)
	VOpts[varname] = {valmin, valmin, valmax}
end

function VMenu.AddValSub(bindMenu, item, varname, value, toMenu, desc)
	local size = #VMenu.items[bindMenu]
	VMenu.items[bindMenu][size+1] = {}
	VMenu.items[bindMenu][size+1].type = "valsub"
	VMenu.items[bindMenu][size+1].name = item
	VMenu.items[bindMenu][size+1].varname = varname
	VMenu.items[bindMenu][size+1].toMenu = toMenu
	VMenu.items[bindMenu][size+1].desc = desc
	VOpts[varname] = value
end

function getOpt(varname)
	if type(VOpts[varname]) == "boolean" or type(VOpts[varname]) == "number" then
		return VOpts[varname]
	end
	if type(VOpts[varname]) == "table" then
		return VOpts[varname][1]
	end
end

function setOpt(varname, value)
	if type(VOpts[varname]) == "table" and #VOpts[varname] == 3 then
		VOpts[varname][1] = value
	else
		VOpts[varname] = value
	end
end

function list_keys()
	for tk = 0, 345 do
		if IsControlJustReleased(0,  tk) then
			VMenu.notif("Key :"..tostring(tk))
		end
	end
end

function VMenu.notif(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

local showId = false
local showBourse = false

RegisterNetEvent("vmenu:identity_check")
AddEventHandler("vmenu:identity_check", function(target)
	TriggerServerEvent('vmenu:identity_check_s')
end)

RegisterNetEvent("vmenu:bourse_check")
AddEventHandler("vmenu:bourse_check", function(target)
  TriggerServerEvent('vmenu:bourse_s')
end)


RegisterNetEvent("vmenu:identity")
AddEventHandler("vmenu:identity", function(permis, permisArme, permisBateau, permisPilote)
  showId = false
  Wait(500)
	showId = true
	showBourse = false
	while showId == true do
		Citizen.Wait(0)
				DrawRect(0.862, 0.292, 0.18, 0.3, 0, 0, 0, 150)
				DrawAdvancedText(0.902000000000001, 0.220, 0.005, 0.0028, 0.7, "~h~Carte d'identité", 255, 255, 255, 255, 1, 1)
				DrawAdvancedText(0.874000000000001, 0.278, 0.005, 0.0028, 0.4, "~b~Nom: ~w~" ..User.nom.. " " ..User.prenom, 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.874000000000001, 0.298, 0.005, 0.0028, 0.4, "~b~Numéro de teléphone: ~w~" ..User.telephone, 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.874000000000001, 0.318, 0.005, 0.0028, 0.4, "~y~Métier: ~w~" ..jobsname[User.job], 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.874000000000001, 0.338, 0.005, 0.0028, 0.4, "~o~Permis de conduire (points): ~w~" ..permis, 255, 255, 255, 255, 6, 1)
				DrawAdvancedText(0.874000000000001, 0.358, 0.005, 0.0028, 0.4, "~o~Permis de port d'armes: ~w~" ..permisArme, 255, 255, 255, 255, 6, 1)
				-- DrawAdvancedText(0.874000000000001, 0.378, 0.005, 0.0028, 0.4, "~g~Permis bateau: ~w~" ..permisBateau, 255, 255, 255, 255, 6, 1)
				-- DrawAdvancedText(0.874000000000001, 0.398, 0.005, 0.0028, 0.4, "~g~Permis de pilote: ~w~" ..permisPilote, 255, 255, 255, 255, 6, 1)
	end
end)

RegisterNetEvent("vmenu:bourse")
AddEventHandler("vmenu:bourse", function(roche, rochechange, cuivre, cuivrechange, fer, ferchange, diamant, diamantchange, morue, moruechange, sardine, sardinechange, daurade, dauradechange, saumon, saumonchange, vin, vinchange, bcuivre, bcuivrechange, pfer, pferchange, patate, patatechange)
  showBourse = false
  Wait(500)
  showBourse = true
  showId = false
  while showBourse == true do
    Citizen.Wait(0)
        DrawRect(0.862, 0.322, 0.18, 0.4, 0, 0, 0, 150)
        DrawAdvancedText(0.922000000000001, 0.200, 0.005, 0.0028, 0.9, "~h~~g~Bourse", 255, 255, 255, 255, 1, 1)
        if rochechange < 0 then
          DrawAdvancedText(0.874000000000001, 0.278, 0.005, 0.0028, 0.4, "Roche: ~w~" .. math.ceil(roche) .. "$ (~r~" ..math.ceil(rochechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.278, 0.005, 0.0028, 0.4, "Roche: ~w~" .. math.ceil(roche) .. "$ (~g~+" ..math.floor(rochechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if cuivrechange < 0 then
          DrawAdvancedText(0.874000000000001, 0.298, 0.005, 0.0028, 0.4, "Cuivre: ~w~" ..math.ceil(cuivre).. "$ (~r~" ..math.ceil(cuivrechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.298, 0.005, 0.0028, 0.4, "Cuivre: ~w~" ..math.ceil(cuivre).. "$ (~g~+" ..math.floor(cuivrechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if ferchange < 0 then
          DrawAdvancedText(0.874000000000001, 0.318, 0.005, 0.0028, 0.4, "Fer: ~w~" ..math.ceil(fer).. "$ (~r~" ..math.ceil(ferchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.318, 0.005, 0.0028, 0.4, "Fer: ~w~" ..math.ceil(fer).. "$ ( ~g~+" ..math.floor(ferchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if diamantchange < 0 then
          DrawAdvancedText(0.874000000000001, 0.338, 0.005, 0.0028, 0.4, "Diamant: ~w~" ..math.ceil(diamant).. "$ (~r~" ..math.ceil(diamantchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.338, 0.005, 0.0028, 0.4, "Diamant: ~w~" ..math.ceil(diamant).. "$ (~g~+" ..math.floor(diamantchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if diamantchange < 0 then
          DrawAdvancedText(0.874000000000001, 0.338, 0.005, 0.0028, 0.4, "Diamant: ~w~" ..math.ceil(diamant).. "$ (~r~" ..math.ceil(diamantchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.338, 0.005, 0.0028, 0.4, "Diamant: ~w~" ..math.ceil(diamant).. "$ (~g~+" ..math.floor(diamantchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if moruechange < 0 then
          DrawAdvancedText(0.874000000000001, 0.358, 0.005, 0.0028, 0.4, "Morue: ~w~" ..math.ceil(morue).. "$ (~r~" ..math.ceil(moruechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.358, 0.005, 0.0028, 0.4, "Morue: ~w~" ..math.ceil(morue).. "$ (~g~+" ..math.floor(moruechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if sardinechange < 0 then
          DrawAdvancedText(0.874000000000001, 0.378, 0.005, 0.0028, 0.4, "Sardine: ~w~" ..math.ceil(sardine).. "$ (~r~" ..math.ceil(sardinechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.378, 0.005, 0.0028, 0.4, "Sardine: ~w~" ..math.ceil(sardine).. "$ (~g~+" ..math.floor(sardinechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if dauradechange < 0 then
          DrawAdvancedText(0.874000000000001, 0.398, 0.005, 0.0028, 0.4, "Daurade: ~w~" ..math.ceil(daurade).. "$ (~r~" ..math.ceil(dauradechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.398, 0.005, 0.0028, 0.4, "Daurade: ~w~" ..math.ceil(daurade).. "$ (~g~+" ..math.floor(dauradechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if saumonchange < 0 then
          DrawAdvancedText(0.874000000000001, 0.418, 0.005, 0.0028, 0.4, "Saumon: ~w~" ..math.ceil(saumon).. "$ (~r~" ..math.ceil(saumonchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.418, 0.005, 0.0028, 0.4, "Saumon: ~w~" ..math.ceil(saumon).. "$ (~g~+" ..math.floor(saumonchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if vinchange < 0 then
          DrawAdvancedText(0.874000000000001, 0.438, 0.005, 0.0028, 0.4, "Vin: ~w~" ..math.ceil(vin).. "$ (~r~" ..math.ceil(vinchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.438, 0.005, 0.0028, 0.4, "Vin: ~w~" ..math.ceil(vin).. "$ (~g~+" ..math.floor(vinchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if bcuivrechange < 0 then
          DrawAdvancedText(0.874000000000001, 0.458, 0.005, 0.0028, 0.4, "Bobine de cuivre: ~w~" ..math.ceil(bcuivre).. "$ (~r~" ..math.ceil(bcuivrechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.458, 0.005, 0.0028, 0.4, "Bobine de cuivre: ~w~" ..math.ceil(bcuivre).. "$ (~g~+" ..math.floor(bcuivrechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if pferchange < 0 then
          DrawAdvancedText(0.874000000000001, 0.478, 0.005, 0.0028, 0.4, "Plaque de fer: ~w~" ..math.ceil(pfer).. "$ (~r~" ..math.ceil(pferchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.478, 0.005, 0.0028, 0.4, "Plaque de fer: ~w~" ..math.ceil(pfer).. "$ (~g~+" ..math.floor(pferchange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
        if patatechange < 0 then
          DrawAdvancedText(0.874000000000001, 0.498, 0.005, 0.0028, 0.4, "Sac de pommes de terre: ~w~" ..math.ceil(patate).. "$ (~r~" ..math.ceil(patatechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        else
          DrawAdvancedText(0.874000000000001, 0.498, 0.005, 0.0028, 0.4, "Sac de pommes de terre: ~w~" ..math.ceil(patate).. "$ (~g~+" ..math.floor(patatechange).."$~w~)", 255, 255, 255, 255, 6, 1)
        end
  end
end)

Citizen.CreateThread(function()
  --    Citizen.InvokeNative(0x5F5D1665E352A839, Citizen.PointerValueIntInitialized(GetPlayerPed(-1)), GetHashKey("mpbeach_overlays"), GetHashKey("mp_bea_tat_m_013"))
	while true do
		Citizen.Wait(0)
		if showId == true then
			Citizen.Wait(20000)
			showId = false
		end
		if showBourse == true then
      Citizen.Wait(20000)
      showBourse = false
    end
	end
end)

RegisterNetEvent("vmenu:toggleMenu")
AddEventHandler("vmenu:toggleMenu", function()
	-- Update Server avant ouverture
	ClearHelp(true)
	if not VMenu.visible then
		TriggerServerEvent("vmenu:getUpdates", true)
	else
		VMenu.target = -1
		VMenu.visible = false
		VMenu.closedTime = GetGameTimer()
	end
end)

RegisterNetEvent("vmenu:openMenu")
AddEventHandler("vmenu:openMenu", function(menuid)
	ClearHelp(true)
	menuid = menuid or VMenu.rootMenu
	VMenu.rootMenu = menuid
	VMenu.curMenu = menuid
	TriggerServerEvent("vmenu:getUpdates", true)
end)

RegisterNetEvent("vmenu:serverOpenMenu")
AddEventHandler("vmenu:serverOpenMenu", function(Opts)
	for k,v in pairs(Opts) do
		setOpt(k, v)
	end
	if VOpts['openMenu'] then
		VMenu.visible = true
		setOpt('openMenu', false)
	end
end)

RegisterNetEvent("vmenu:setUser")
AddEventHandler("vmenu:setUser", function(infos)
	for k,v in pairs(infos) do
		User[k] = v
	end
end)

RegisterNetEvent("vmenu:setCarUser")
AddEventHandler("vmenu:setCarUser", function(infos)
	User.vehicle = infos
end)

RegisterNetEvent("vmenu:closeMenu")
AddEventHandler("vmenu:closeMenu", function()
	VMenu.target = -1
	VMenu.visible = false
	VMenu.closedTime = GetGameTimer()
end)

function playerSpawned()
	if VMenu.checkUser and (not User.Loaded and User.identifier == nil) then
		User.Spawned = true
		TriggerServerEvent("vmenu:updateUser", false)
		local trig = GetGameTimer()
		while not User.Loaded and User.identifier == nil do
			if GetGameTimer() - trig > 1000 then
				TriggerServerEvent("vmenu:updateUser", false)
				trig = GetGameTimer()
			end
			Wait(20)
		end
	end
	while true do
		Wait(300000)
		TriggerServerEvent("vmenu:sync_s")
	end
end

AddEventHandler("playerSpawned", function()
	playerSpawned()
end)

-------------------------------------------------------------------------------------
------------------------------- CREATION DU MENU ------------------------------------
-------------------------------------------------------------------------------------

-- Voir ReadMe.txt --


function Construct()
	local menu = 0
  VMenu.AddMenu(menu, "Menu Test", "header_bgd")
  if User.group == "superadmin" then VMenu.AddSub(menu, "~r~Administrateur", 99, "Menu Admin") end
  VMenu.AddSub(menu, "Vehicule", 1, "Contrôle du Véhicule")
  VMenu.AddSub(menu, "Outfits", 2, "Menu Vêtements")
  VMenu.AddSub(menu, "Interactions", 3, "Test Default Header")
  VMenu.AddValSub(menu, "Bouteille d'eau", "BottlesNumber", 0, 4, "Test de requête serveur")
  VMenu.AddSub(menu, "Test 2", nil, nil)
  VMenu.AddSub(menu, "Test 3", nil, "Menu Test")
  VMenu.AddSub(menu, "Test 4", nil, nil)
  VMenu.AddSub(menu, "Test 5", nil, nil)
  VMenu.AddSub(menu, "Test 6", nil, nil)
  VMenu.AddSub(menu, "Test 7", nil, nil)
  VMenu.AddSub(menu, "Test 8", nil, nil)
  VMenu.AddSub(menu, "Test 9", nil, nil)
  VMenu.AddSub(menu, "Test 10", nil)

  if User.group == "superadmin" then
    local menu = 99
    VMenu.AddMenu(menu, "Administrateur", "header_bgd")
    VMenu.AddFunc(menu, "Teleporter vers le marqueur", "vmenu:teleport_marker", {}, "")
    VMenu.AddSep(menu, "Véhicules Spawner")
    VMenu.AddSep(menu, "Voitures")
    VMenu.AddFunc(menu, "Adder", "vmenu:spawnVeh", {"adder"}, "")
    VMenu.AddFunc(menu, "Futo", "vmenu:spawnVeh", {"futo"}, "")
    VMenu.AddFunc(menu, "Infernus", "vmenu:spawnVeh", {"infernus"}, "")
    VMenu.AddFunc(menu, "Oracle", "vmenu:spawnVeh", {"oracle2"}, "")
    VMenu.AddFunc(menu, "Oracle XS", "vmenu:spawnVeh", {"oracle"}, "")
    VMenu.AddFunc(menu, "Sultan", "vmenu:spawnVeh", {"sultan"}, "")
    VMenu.AddFunc(menu, "Tampa Drift", "vmenu:spawnVeh", {"tampa2"}, "")
    VMenu.AddFunc(menu, "Windsor Cab", "vmenu:spawnVeh", {"windsor2"}, "")
    VMenu.AddSep(menu, "Motos")
    VMenu.AddFunc(menu, "Akuma", "vmenu:spawnVeh", {"akuma"}, "")
    VMenu.AddFunc(menu, "Cliffhanger", "vmenu:spawnVeh", {"cliffhanger"}, "")
    VMenu.AddFunc(menu, "Gargoyle", "vmenu:spawnVeh", {"gargoyle"}, "")
    VMenu.AddFunc(menu, "Sanchez", "vmenu:spawnVeh", {"sanchez"}, "")
    VMenu.AddSep(menu, "Bateaux")
    VMenu.AddFunc(menu, "Dinghy", "vmenu:spawnVeh", {"dinghy"}, "")
    VMenu.AddFunc(menu, "Jetmax", "vmenu:spawnVeh", {"jetmax"}, "")
    VMenu.AddFunc(menu, "Suntrap", "vmenu:spawnVeh", {"suntrap"}, "")
    VMenu.AddSep(menu, "Hélicos")
    VMenu.AddFunc(menu, "buzzard", "vmenu:spawnVeh", {"buzzard"}, "")
    VMenu.AddFunc(menu, "Cargo Bob", "vmenu:spawnVeh", {"cargobob"}, "")
    VMenu.AddFunc(menu, "Swift Deluxe", "vmenu:spawnVeh", {"swift2"}, "")
    VMenu.AddSep(menu, "Avions")
    VMenu.AddFunc(menu, "Besra", "vmenu:spawnVeh", {"besra"}, "")
    VMenu.AddFunc(menu, "Dodo", "vmenu:spawnVeh", {"dodo"}, "")
    VMenu.AddFunc(menu, "Luxor VIP", "vmenu:spawnVeh", {"luxor2"}, "")
    VMenu.AddFunc(menu, "Stunt Plane", "vmenu:spawnVeh", {"stunt"}, "")
    VMenu.AddSep(menu, "Vélos")
    VMenu.AddFunc(menu, "BMX", "vmenu:spawnVeh", {"bmx"}, "")
    VMenu.AddFunc(menu, "Fixter", "vmenu:spawnVeh", {"fixter"}, "")
    VMenu.AddFunc(menu, "Scorcher", "vmenu:spawnVeh", {"scorcher"}, "")
  end

  local menu = 1
  VMenu.AddMenu(menu, "Vehicule", "carmod")
  VMenu.AddBool(menu, "Moteur", "Engine", false, "Marche/Arrêt Moteur")
  VMenu.AddNum(menu, "Couleur Principale", "VehColor", 0, 160, "Change la couleur principale du véhicule")
  VMenu.AddNum(menu, "Couleur Secondaire", "VehColorS", 0, 160, "Change la couleur secondaire du véhicule")

  local menu = 2
  VMenu.AddMenu(menu, "Outfits (Sans Header)", nil) -- nil = Aucun Header
  VMenu.AddSub(menu, "Outfit 1", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Outfit 2", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Outfit 3", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Outfit 4", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Outfit 5", nil, "Ne fait rien...")

  local menu = 3
  VMenu.AddMenu(menu, "Interactions", "default") -- default = Header "Texte" sur fond bleu
  VMenu.AddSub(menu, "Test 1", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Test 2", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Test 3", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Test 4", nil, "Ne fait rien...")
  VMenu.AddSub(menu, "Test 5", nil, "Ne fait rien...")

  local menu = 4
  VMenu.AddMenu(menu, "Bouteille d'eau", "default") -- default = Header "Texte" sur fond bleu
  VMenu.AddFunc(menu, "Utiliser", "inv:use", {"waterbottle"}, nil)
  VMenu.AddFunc(menu, "Donner", "inv:give", {"waterbottle"}, nil)
  VMenu.AddFunc(menu, "~r~Jeter", "inv:drop", {"waterbottle"}, nil)
  VMenu.AddFunc(menu, "Vendre", "inv:sell", {"waterbottle"}, nil)

  local menu = 5
  VMenu.AddMenu(menu, "", "cloth") -- default = Header "Texte" sur fond bleu
  VMenu.AddFunc(menu, "En service", "vmenu:policeState", {1}, "Être en service")
  VMenu.AddFunc(menu, "En service civil", "vmenu:policeStateCivil", {1}, "Être en service")
  VMenu.AddFunc(menu, "Hors service", "vmenu:policeState", {0}, "Être hors service")

  local menu = 6
  VMenu.AddMenu(menu, "", "armurerie") -- default = Header "Texte" sur fond bleu
  TriggerServerEvent('vmenu:updateUser', 6)
  if User.police >= 1 then
  VMenu.AddFunc(menu, "Arme de cadet",'vmenu:getArmory',{1}, "armurerie") -- default = Header "Texte" sur fond bleu
  end
  if User.police >= 2 then
  VMenu.AddFunc(menu, "Arme de patrouille", "vmenu:getArmory", {2}, "Obtenir cette arme")
  end
  if User.police >= 4 then
  VMenu.AddFunc(menu, "Arme d'assault", "vmenu:getArmory", {3}, "Obtenir cette arme")
  end
  --VMenu.AddFunc(menu, "M4", "vmenu:getArmory", {"WEAPON_CARBINERIFLE"}, "Obtenir cette arme")
  --VMenu.AddFunc(menu, "Fusil à pompe", "vmenu:getArmory", {"WEAPON_PUMPSHOTGUN"}, "Obtenir cette arme")
  --VMenu.AddFunc(menu, "Pistolet", "vmenu:getArmory", {"WEAPON_PISTOL"}, "Obtenir cette arme")
  --VMenu.AddFunc(menu, "Matraque", "vmenu:getArmory", {"WEAPON_NIGHTSTICK"}, "Obtenir cette arme")

  local menu = 7
  VMenu.AddMenu(menu, "", "default") -- default = Header "Texte" sur fond bleu
  TriggerServerEvent('vmenu:updateUser', 7)
  Citizen.Wait(100)
  Citizen.Trace(tostring(User.police))
  if User.vehicle == 0 then
    if User.enService == 1 then
      if User.police >= 1 then
        VMenu.AddFunc(menu, "Crown Victoria police", "vmenu:getGarage", {"police7"}, "Obtenir cette voiture")
        VMenu.AddFunc(menu, "Impala police", "vmenu:getGarage", {"police8"}, "Obtenir cette voiture")
        VMenu.AddFunc(menu, "Charger Sheriff", "vmenu:getGarage", {"sheriff"}, "Obtenir cette voiture")
      end
      if User.police >= 2 then
        VMenu.AddFunc(menu, "Taurus police", "vmenu:getGarage", {"police4"}, "Obtenir cette voiture")
        VMenu.AddFunc(menu, "Suberban Sheriff", "vmenu:getGarage", {"sheriff2"}, "Obtenir cette voiture")
        VMenu.AddFunc(menu, "Crown Victoria Sheriff", "vmenu:getGarage", {"sheriff3"}, "Obtenir cette voiture")
      end
      if User.police >= 2 then
        VMenu.AddFunc(menu, "Charger police", "vmenu:getGarage", {"police2"}, "Obtenir cette voiture")
      end
      if User.police >= 3 then
        VMenu.AddFunc(menu, "Suberban K9", "vmenu:getGarage", {"police6"}, "Obtenir cette voiture")
      end
      if User.police >= 3 then
        VMenu.AddFunc(menu, "Taho banalisée", "vmenu:getGarage", {"fbi2"}, "Obtenir cette voiture")
        VMenu.AddFunc(menu, "Charger banalisée", "vmenu:getGarage", {"fbi"}, "Obtenir cette voiture")
      end
      if User.police >= 5 then
        VMenu.AddFunc(menu, "Police explorer interceptor", "vmenu:getGarage", {"police3"}, "Obtenir cette voiture")
        VMenu.AddFunc(menu, "Interceptor police 2017", "vmenu:getGarage", {"police5"}, "Obtenir cette voiture")
      end
    end
  else
    VMenu.AddFunc(menu, "Ranger votre véhicule", "vmenu:toGarage", {}, "Il doit être devant vous")
  end

  local menu = 8
  VMenu.AddMenu(menu, "Tenues", "cloth") -- default = Header "Texte" sur fond bleu
  if User.gender == "mp_m_freemode_01" then
    VMenu.AddNum(8, "Catégorie", "Tenues", 0, 65, "Changer de catégorie")
  else
    VMenu.AddNum(8, "Catégorie", "Tenues", 66, 66, "Changer de catégorie")
  end
  VMenu.AddSep(menu, OutfitsCat[1])
  VMenu.AddFunc(menu, "Validez catégories tenues", "vmenu:OutfitsValidate", {getOpt("Tenues")}, "Valider")

  local menu = 9
  VMenu.AddMenu(menu, "", "default") -- default = Header "Texte" sur fond bleu
  VMenu.AddNum(menu, "Coiffure", "Hair", 0, 22, "Changer la coiffure")
  VMenu.AddNum(menu, "Coiffure secondaire", "HairSec", 0, 6, "Changer la coiffure")
  VMenu.AddNum(menu, "Couleur", "HairColor", 0, 10, "Changer la couleur des cheveux")
  VMenu.AddNum(menu, "Couleur secondaire", "HairColorSec", 0, 100, "Changer la couleur des cheveux")
  VMenu.AddNum(menu, "Barbe", "Barbe", 0, 28, "Changer la barbe")
  VMenu.AddNum(menu, "Couleur", "BarbeColor", 0, 100, "Changer la couleur de la barbe")
  VMenu.AddNum(menu, "Couleur secondaire", "BarbeSec", 0, 100, "Changer la couleur secondaire")
  VMenu.AddNum(menu, "Eyebrows", "Eyebrows", 0, 33, "Sourcils")
  VMenu.AddNum(menu, "Eyebrows Couleur Primaire", "Eyebrows_Color", 0, 33, "Couleur Primaire")
  VMenu.AddNum(menu, "Eyebrows Couleur Secondaire", "Eyebrows_Color_1", 0, 33, "Couleur Secondaire")
  VMenu.AddFunc(menu, "Valider", "vmenu:getclientHair", {getOpt("Hair"),getOpt("HairSec"),getOpt("HairColor"),getOpt("HairColorSec"),getOpt("Barbe"),getOpt("BarbeColor"),
      getOpt("Eyebrows"),getOpt("Eyebrows_Color"),getOpt("Eyebrows_Color_1")}, "Valider")

  local menu = 10
  VMenu.AddMenu(menu, "", "default") -- default = Header "Texte" sur fond bleu
  VMenu.AddNum(menu, "Sexe", "Sexe", 0, 1, "Changer de sexe")
  VMenu.AddNum(menu, "Face", "Face", 0, 45, "Changer de face")
  VMenu.AddNum(menu, "Couleur", "Couleur", 0, 45, "Changer la couleur")
  VMenu.AddNum(menu, "Yeux", "Yeux", 0, 45, "Changer les yeux")
  VMenu.AddFunc(menu, "Valider", "vmenu:getclientFace", {getOpt("Sexe"),getOpt("Face"),0}, "Obtenir ce changement")

  local menu = 11
  VMenu.AddMenu(menu, "", "default") -- default = Header "Texte" sur fond bleu
  -- for _, item in pairs(inv_array_legal) do
  --  VMenu.AddFunc(menu, item.name, "inventory:buy", {1, item.id, item.price, item.name}, "Acheter")
  -- end
  VMenu.AddNum(menu, "Quantité", "itemBuy", 1, 30, "Sélection")
  for _, item in pairs(inv_array_legal) do
    VMenu.AddFunc(menu, item.name, "inventory:buy", {getOpt("itemBuy"), item.id, item.price, item.name}, "Prix: " .. item.price .. "$")
  end


  local menu = 12
  VMenu.AddMenu(menu, "", "default")
  VMenu.AddSep(menu, "Cadet")

  ------- MENU POUR ENTREPRISE CAMION
  local menu = 13
  VMenu.AddMenu(menu, "", "default")
  VMenu.AddFunc(menu, "Citerne", "transporter:optionMission", {0}, "Choisir")
  VMenu.AddFunc(menu, "Conteneur", "transporter:optionMission", {1}, "Choisir")
  VMenu.AddFunc(menu, "Réfrigéré", "transporter:optionMission", {2}, "Choisir")
  VMenu.AddFunc(menu, "Bois", "transporter:optionMission", {3}, "Choisir")

  local menu = 14
  VMenu.AddMenu(menu, "", "default")
  VMenu.AddFunc(menu, "Acheter des informations", "menudrogue:info_weed", {0}, "Acheter")

  jobs = {
    {name="Sans Emploi", id=1},
    {name="Nettoyeur de piscine", id=2},
    {name="Éboueur", id=3},
    {name="Mineur", id=4},
	{name="Pêcheur", id=22},
    {name="Vigneron", id=23},
    {name="Métallurgiste", id=24},
    {name="Agriculteur", id=25},
    {name="Livreur de bois", id=6},
    {name="Livreur de citerne", id=7},
    {name="Livreur de conteneur", id=8},
    {name="Livreur de médicament", id=9},
    {name="Fossoyeur", id=11},
    {name="Préposé à la morgue", id=12},
  }

  local menu = 15
  VMenu.AddMenu(menu, "", "default")
  TriggerServerEvent('vmenu:updateUser', menu)
  Wait(200)
  VMenu.ResetMenu(menu, "", "default")
  for _, item in pairs(jobs) do
    VMenu.AddFunc(menu, item.name, "vmenu:poleemploi", {item.id}, "Valider")
  end

  local menu = 16
  VMenu.AddMenu(menu, "", "default")
  VMenu.AddFunc(menu, "Laver votre argent sale (30% de retour)", "vmenu:cleanCash", {}, "Valider")

  local menu = 17
  VMenu.AddMenu(menu, "", "default") -- default = Header "Texte" sur fond bleu
  TriggerServerEvent('vmenu:updateUser', 17)
  Citizen.Wait(100)
  if User.enService == 1 then
    if User.police >= 1 then
      VMenu.AddFunc(menu, "Helico de police", "vmenu:getHelicoGarage", {"polmav"}, "Obtenir cet hélicoptère")
    end
    if User.police >= 2 then
    end
    if User.police >= 3 then
    end
    if User.police >= 4 then
    end
    if User.police >= 5 then
    end
    if User.police >= 6 then
    end
  else
    VMenu.AddSep(menu, "Vous devez être en service")
  end

  local menu = 18
  VMenu.AddMenu(menu, "", "default")
  VMenu.AddFunc(menu, "Ouvrir cellule #1", "menupolice:unjail", {1, User.police}, "Ouvrir")
  VMenu.AddFunc(menu, "Ouvrir cellule #2", "menupolice:unjail", {2, User.police}, "Ouvrir")
  VMenu.AddFunc(menu, "Ouvrir cellule #3", "menupolice:unjail", {3, User.police}, "Ouvrir")

  local menu = 19
  VMenu.AddMenu(menu, "", "default")
  TriggerServerEvent('vmenu:updateUser', menu)
  Wait(200)
  VMenu.ResetMenu(menu, "", "default")
  if User.jobs == 13 then
    VMenu.AddFunc(menu, "Helico d'ambulancier", "vmenu:getAmbulanceHelicoGarage", {"polmav"}, "Obtenir cet hélicoptère")
  else
    VMenu.AddSep(menu, "Vous devez être en ambulancier")
  end

  local menu = 20
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddFunc(menu, "Acheter des informations", "menudrogue:info_coke", {0}, "Acheter")

  local menu = 21
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddFunc(menu, "Acheter des informations", "menudrogue:info_meth", {0}, "Acheter")

  local menu = 22
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddFunc(menu, "Acheter des informations", "menudrogue:info_organe", {0}, "Acheter")

  local menu = 23
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddFunc(menu, "Acceder à la porte", "apart:MenuAppartement", {}, "Acheter")

  local menu = 24
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddFunc(menu, "Acceder à la porte", "apart:MenuInsideAppartement", {}, "Acheter")

  local menu = 25
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddFunc(menu, "Acceder à la cache", "apart:MenuCache", {}, "Acheter")

  local menu = 26
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddFunc(menu, "Parler avec l'agent", "apart:MenuAgent", {}, "Acheter")

  local menu = 27
    VMenu.AddMenu(menu, "", "default")

  local menu = 28
    VMenu.AddMenu(menu, "", "default")

  local menu = 29
    VMenu.AddMenu(menu, "", "default")

  local menu = 30
    VMenu.AddMenu(menu, "", "default")

  local menu = 31
    VMenu.AddMenu(menu, "", "default")

  local menu = 32
    VMenu.AddMenu(menu, "", "default")

  local menu = 33
    VMenu.AddMenu(menu, "", "default")

  local menu = 50
    VMenu.AddMenu(menu, "", "default")
    VMenu.AddSep(menu,"Styliste")
    VMenu.AddNum(menu, "Tattoos", "tattoos", 1, 33, "Tattoos")
    --VMenu.AddFunc(menu, "Valider", "vmenu:settattoos", {GetHashKey(Tattoos[getOpt("tattoos")].name)}, "Valider")

	------- MAIN MENU F7
	local menu = 98
	VMenu.AddMenu(menu, "", "default") -- default = Header "Texte" sur fond bleu
	VMenu.AddSep(menu, "Une erreur s'est produite")
end


----- FUNCTION PERSO

function getMainMenu()
	if VMenu.police == false and VMenu.telephone == false and VMenu.animations == false and VMenu.item_menu == false and VMenu.medic == false and VMenu.depan == false and VMenu.taxi == false and VMenu.pres == false and VMenu.garde == false and VMenu.garda == false then
		TriggerServerEvent('vmenu:updateUser', 98)
		TriggerServerEvent("inventory:getItems_s")
		VMenu.ResetMenu(98, "", "default")
		Wait(10)
		-- LE MENU DE LA POLICE
		if User.police > 0 then
			VMenu.AddFunc(98, lang.menu.mainmenu.police, "menupolice:PoliceOG", {User.police}, lang.common.access)
		end

		if User.job == 13 then
			VMenu.AddFunc(98, "Menu ambulancier", "menumedic:MedicOG", {}, lang.common.access)
		end
		if tonumber(User.job) == 15 or tonumber(User.job) == 16 then
			VMenu.AddFunc(98, "Menu dépanneur", "menutow:DepanOG", {User.job}, lang.common.access)
		end
		if tonumber(User.job) == 17 or tonumber(User.job) == 18 then
			VMenu.AddFunc(98, "Menu taxi", "menutaxi:TaxiOG", {User.job}, lang.common.access)
		end
    if tonumber(User.job) == 26 or tonumber(User.job) == 27 or tonumber(User.job) == 28 then
      VMenu.AddFunc(98, "Menu GardaLife", "menugarda:menuOG", {User.job}, lang.common.access)
    end
		if tonumber(User.job) == 14 then
			VMenu.AddFunc(98, "Menu président", "menupres:MayorOG", {}, lang.common.access)
		end
		if tonumber(User.job) == 19 then
			VMenu.AddFunc(98, "Menu FBI", "menugarde:GardeOG", {}, lang.common.access)
		end
		VMenu.AddFunc(98, "~b~Sauvegarder ma position", "vmenu:sync", {}, lang.common.access)
		VMenu.AddFunc(98, "~g~Afficher la bourse", "vmenu:bourse_check", {}, lang.common.access)
		VMenu.AddFunc(98, "Carte d'identité", "vmenu:identity_check", {}, lang.common.access)
		--VMenu.AddFunc(98, "Répertoire", "menutel:PhoneOG", {}, lang.common.access)
		VMenu.AddFunc(98, lang.menu.mainmenu.anim, "menuanim:AnimOG", {}, lang.common.access)
		VMenu.AddFunc(98, lang.menu.mainmenu.givecash, "vmenu:giveCash", {User.money}, lang.common.access)
		VMenu.AddFunc(98, lang.menu.mainmenu.givedcash, "vmenu:giveDCash", {User.dirtymoney}, lang.common.access)
    VMenu.AddFunc(98, "Mettre/Enlever le masque", "vmenu:switchMask", {}, lang.common.access)
		VMenu.AddSep(98, lang.menu.mainmenu.inventory)
		for ind, value in ipairs(ITEMS) do
			Citizen.Wait(1)
			if value.quantity > 0 then
				Citizen.Wait(1)
				VMenu.AddFunc(98, tostring(value.libelle), "inventory:menuItem", {ind, tostring(value.libelle), tostring(value.quantity)}, lang.menu.mainmenu.quantity .. tostring(value.quantity))
			end
		end
	end
end


RegisterNetEvent("vmenu:switchMask")
AddEventHandler("vmenu:switchMask", function()
  if isHaveMask then
      SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
      isHaveMask = false
  else
      TriggerServerEvent("maskshop:reloadOutfits_s")
      isHaveMask = true
  end
end)

RegisterNetEvent("vmenu:sync")
AddEventHandler("vmenu:sync", function()
	TriggerServerEvent("vmenu:sync_s")
end)

function getGaragePolice()
    TriggerServerEvent('vmenu:updateUser', 7)
    Wait(200)
    VMenu.ResetMenu(7, "", "default")
    if User.enService == 1 then
        if User.police >= 1 then
            VMenu.AddFunc(7, "Ranger votre véhicule", "vmenu:toGarage", {}, "Il doit être devant vous")
            VMenu.AddFunc(7, "Crown Victoria police", "vmenu:getGarage", {"police7"}, "Obtenir cette voiture")
            VMenu.AddFunc(7, "VTT Scrocher", "vmenu:getGarage", {"scorcherb"}, "Obtenir cette voiture")
        end
        if User.police >= 2 then
            VMenu.AddFunc(7, "Dodge Charger", "vmenu:getGarage", {"police2"}, "Obtenir cette voiture")
        end
        if User.police >= 3 then
            VMenu.AddFunc(7, "Ford Explorer", "vmenu:getGarage", {"police3"}, "Obtenir cette voiture")
            VMenu.AddFunc(7, "Chevrolet Impala", "vmenu:getGarage", {"police8"}, "Obtenir cette voiture")
			         VMenu.AddFunc(7, "Moto de police", "vmenu:getGarage", {"policebike"}, "Obtenir cette voiture")
               VMenu.AddFunc(7, "Dodge Charger Banalisé", "vmenu:getGarage", {"fbi"}, "Obtenir cette voiture")
               VMenu.AddFunc(7, "Chevrolet Tahoe Banalisé", "vmenu:getGarage", {"fbi2"}, "Obtenir cette voiture")
        end
        if User.police >= 4 then
            VMenu.AddFunc(7, "Ford Raptor", "vmenu:getGarage", {"police"}, "Obtenir ce véhicule")
        end
		if User.police >= 6 then
            VMenu.AddFunc(7, "K9", "vmenu:getGarage", {"police6"}, "Obtenir ce véhicule")
        end
    else
        VMenu.AddSep(7, "Vous n'êtes pas en service")
    end
end

function getArmory()
	TriggerServerEvent('vmenu:updateUser', 6)
	Wait(50)
	Citizen.Trace(tostring(User.police))
	VMenu.ResetMenu(6, "", "default")
	if User.police >= 1 then
	VMenu.AddFunc(6, "Arme de cadet",'vmenu:getArmory',{1}, "armurerie") -- default = Header "Texte" sur fond bleu
	end
	if User.police >= 2 then
	VMenu.AddFunc(6, "Arme de patrouille", "vmenu:getArmory", {2}, "Obtenir cette arme")
	end
	if User.police >= 4 then
	VMenu.AddFunc(6, "Arme d'assault", "vmenu:getArmory", {3}, "Obtenir cette arme")
	end
end

function getGarageHelicoAmbulance()
	TriggerServerEvent('vmenu:updateUser', 19)
	Wait(200)
	VMenu.ResetMenu(19, "", "default")
	if User.job == 13 then
		VMenu.AddFunc(19, "Helico d'ambulancier", "vmenu:getAmbulanceHelicoGarage", {"polmav"}, "Obtenir cet hélicoptère")
	else
		VMenu.AddSep(19, "Vous devez être en ambulancier")
	end
end

function getGarageHelicoPolice()
	TriggerServerEvent('vmenu:updateUser', 17)
	Wait(200)
	VMenu.ResetMenu(17, "", "default")
	if User.enService == 1 then
		if User.police <= 5 then
			VMenu.AddSep(17, "Votre grade est trop bas")
		end
		if User.police >= 3 then
			VMenu.AddFunc(17, "Helico de police", "vmenu:getHelicoGarage", {"polmav"}, "Obtenir cet hélicoptère")
		end
	else
		VMenu.AddSep(17, "Vous devez être en service")
	end
end

function getLockerPolice()
	VMenu.ResetMenu(5, "", "default")
	VMenu.AddMenu(5, "", "default") -- default = Header "Texte" sur fond bleu
	VMenu.AddFunc(5, "En service", "vmenu:policeState", {1}, "Être en service")
	if User.police >= 3 then
		VMenu.AddFunc(5, "En service civil", "vmenu:policeStateCivil", {1}, "Être en service")
	end
	VMenu.AddFunc(5, "Hors service", "vmenu:policeState", {0}, "Être hors service")
end

function getGarageBateauPolice()
  TriggerServerEvent('vmenu:updateUser', 31)
  Wait(200)
  VMenu.ResetMenu(31, "", "default")
  if User.enService == 1 then
    if User.police == 1 then
      VMenu.AddSep(31, "Votre grade est trop bas.")
    end
    if User.police >= 2 then
      VMenu.AddFunc(31, "Bateau de police", "vmenu:getBateauGarage", {"dinghy3"}, "Obtenir ce bateau")
    end
  else
    VMenu.AddSep(31, "Vous devez être en service")
  end
end

function getTankerCompany()
	VMenu.ResetMenu(13, "", "default")
	VMenu.AddMenu(13, "", "default")
	if onJobLegal == 0 then
		VMenu.AddFunc(13, "Citerne", "transporter:optionMission", {0}, "Choisir")
	else
		VMenu.AddFunc(13, "Terminer votre journée de travail", "transporter:optionEnding", {}, "Choisir")
	end
end

function getContainerCompany()
	VMenu.ResetMenu(13, "", "default")
	VMenu.AddMenu(13, "", "default")
	if onJobLegal == 0 then
		VMenu.AddFunc(13, "Conteneur", "transporter:optionMission", {1}, "Choisir")
	else
		VMenu.AddFunc(13, "Terminer votre journée de travail", "transporter:optionEnding", {}, "Choisir")
	end
end

function getFrigorifiqueCompany()
	VMenu.ResetMenu(13, "", "default")
	VMenu.AddMenu(13, "", "default")
	if onJobLegal == 0 then
		VMenu.AddFunc(13, "Réfrigéré", "transporter:optionMission", {2}, "Choisir")
	else
		VMenu.AddFunc(13, "Terminer votre journée de travail", "transporter:optionEnding", {}, "Choisir")
	end
end

function getLogCompany()
	VMenu.ResetMenu(13, "", "default")
	VMenu.AddMenu(13, "", "default")
	if onJobLegal == 0 then
		VMenu.AddFunc(13, "Bois", "transporter:optionMission", {3}, "Choisir")
	else
		VMenu.AddFunc(13, "Terminer votre journée de travail", "transporter:optionEnding", {}, "Choisir")
	end
end

function getVoteMenu()
  TriggerServerEvent('vmenu:updateUser', 28)
  Wait(100)
  VMenu.ResetMenu(28, "", "default")
  VMenu.AddFunc(28, "Une Merde", "vmenu:takevote", {"Une merde"}, lang.common.access)
  VMenu.AddFunc(28, "Shakir Darwish", "vmenu:takevote", {"Shakir"}, lang.common.access)
  VMenu.AddFunc(28, "Montecristo", "vmenu:takevote", {"Monte"}, lang.common.access)
end

RegisterNetEvent("vmenu:takevote")
AddEventHandler("vmenu:takevote", function(target, cand)
  --candidat = --tonumber(cand)
  TriggerServerEvent("vmenu:takevote_s", cand)
end)

function getBarberShop()
  VMenu.AddMenu(9, "", "default") -- default = Header "Texte" sur fond bleu
  VMenu.AddNum(9, "Coiffure", "Hair", 0, 22, "Changer la coiffure")
  VMenu.AddNum(9, "Coiffure secondaire", "HairSec", 0, 6, "Changer la coiffure")
  VMenu.AddNum(9, "Couleur", "HairColor", 0, 10, "Changer la couleur des cheveux")
  VMenu.AddNum(9, "Couleur secondaire", "HairColorSec", 0, 100, "Changer la couleur des cheveux")
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
    VMenu.AddNum(9, "Barbe", "Barbe", 0, 28, "Changer la barbe")
    VMenu.AddNum(9, "Couleur", "BarbeColor", 0, 100, "Changer la couleur de la barbe")
  end
  VMenu.AddNum(9, "Sourcil", "Eyebrows", 0, 33, "Sourcils")
  VMenu.AddNum(9, "Sourcil Couleur Primaire", "Eyebrows_Color", 0, 33, "Couleur Primaire")
  VMenu.AddNum(9, "Sourcil Couleur Secondaire", "Eyebrows_Color_1", 0, 33, "Couleur Secondaire")
  VMenu.AddFunc(9, "Valider", "vmenu:getclientHair", {getOpt("Hair"),getOpt("HairSec"),getOpt("HairColor"),getOpt("HairColorSec"),getOpt("Barbe"),getOpt("BarbeColor"),
      getOpt("Eyebrows"),getOpt("Eyebrows_Color"),getOpt("Eyebrows_Color_1")}, "Valider")
end

function getTatsShop()
  VMenu.AddMenu(50, "", "default")
  VMenu.AddSep(50,"Styliste")
  local sexe
  if(GetEntityModel(GetPlayerPed(-1)) == 1885233650) then
    sexe = Homme
    VMenu.AddNum(50, "Torse", "torso", 1, 36, "Tattoos")
    VMenu.AddNum(50, "Bras Gauche", "bras_g", 1, 10, "Tattoos")
    VMenu.AddNum(50, "Bras Droit", "bras_d", 1, 14, "Tattoos")
    VMenu.AddNum(50, "Jambe Gauche", "jambe_g", 1, 14, "Tattoos")
    VMenu.AddNum(50, "Jambe Droite", "jambe_d", 1, 10, "Tattoos")
    VMenu.AddNum(50, "Tete", "tete", 1, 6, "Tattoos")
    VMenu.AddFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
  else
    sexe = Femme
    VMenu.AddNum(50, "Torse", "torso", 1, 20, "Tattoos")
    VMenu.AddNum(50, "Bras Gauche", "bras_g", 1, 6, "Tattoos")
    VMenu.AddNum(50, "Bras Droit", "bras_d", 1, 4, "Tattoos")
    VMenu.AddNum(50, "Jambe Gauche", "jambe_g", 1, 2, "Tattoos")
    VMenu.AddNum(50, "Jambe Droite", "jambe_d", 1, 3, "Tattoos")
    VMenu.AddNum(50, "Tete", "tete", 1, 3, "Tattoos")
    VMenu.AddFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
  end
end

function getArmoryGouv()
  TriggerServerEvent('vmenu:updateUser', 29)
  Wait(200)
  VMenu.ResetMenu(29, "", "armurerie")
  VMenu.AddFunc(29, "Pistolet", "vmenu:getArmoryGouv", {"WEAPON_PISTOL"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Tazer", "vmenu:getArmoryGouv", {"WEAPON_STUNGUN"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Matraque", "vmenu:getArmoryGouv", {"WEAPON_NIGHTSTICK"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Mitraillette", "vmenu:getArmoryGouv", {"WEAPON_SMG"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Fusil à pompe", "vmenu:getArmoryGouv", {"WEAPON_PUMPSHOTGUN"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Mitraillette d'assaut", "vmenu:getArmoryGouv", {"WEAPON_ASSAULTSMG"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Sniper", "vmenu:getArmoryGouv", {"WEAPON_SNIPERRIFLE"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Pistolet lourd", "vmenu:getArmoryGouv", {"WEAPON_HEAVYPISTOL"}, "Obtenir cette arme")
  VMenu.AddFunc(29, "Fusil d'assaut", "vmenu:getArmoryGouv", {"WEAPON_ADVANCEDRIFLE"}, "Obtenir cette arme")
end

function getGarageGouv()
  TriggerServerEvent('vmenu:updateUser', 30)
  Wait(200)
  VMenu.ResetMenu(30, "", "default")
  VMenu.AddFunc(30, "Ranger votre véhicule", "vmenu:toGarageGouv", {}, "Il doit être devant vous")
  VMenu.AddFunc(30, "Voiture banalisée (cruiser)", "vmenu:getGarageGouv", {"fbi"}, "Obtenir cette voiture")
  VMenu.AddFunc(30, "Voiture banalisée (SUV)", "vmenu:getGarageGouv", {"fbi2"}, "Obtenir cette voiture")
  VMenu.AddFunc(30, "SUV de convoi", "vmenu:getGarageGouv", {"xls2"}, "Obtenir cette voiture")
  VMenu.AddFunc(30, "Voiture du maire (berline)", "vmenu:getGarageGouv", {"cognoscenti2"}, "Obtenir cette voiture")
  VMenu.AddFunc(30, "Voiture du maire (limousine)", "vmenu:getGarageGouv", {"stretch"}, "Obtenir cette voiture")
end

function getGarageHelicoGouv()
  TriggerServerEvent('vmenu:updateUser', 32)
  Wait(200)
  VMenu.ResetMenu(32, "", "default")
  VMenu.AddFunc(32, "Helicoptère du gouvernement", "vmenu:getGouvHelicoGarage", {"frogger2"}, "Obtenir cet hélicoptère")
end

-------------------------------------------------------------
-------------------------- BOUCLE ---------------------------
-------------------------------------------------------------


local talkingTarget = -1
local timerTarget = 0

Citizen.CreateThread(function()
	if VMenu.checkUser then
		local trig = GetGameTimer()
		while not User.Loaded do
			if GetGameTimer() - trig > 5000 then
				playerSpawned()
				trig = GetGameTimer() + 30000
			end
			Wait(500)
		end
	end
	Construct() -- Construction du menu
	VMenu.curMenu = VMenu.rootMenu -- Définition du menu de départ depuis la configuration.

	while true do  ------- Boucle
		Wait(1)
		--[[ -- DEBUG
		if VMenu.debugKeys then
		list_keys()
	end
	]]

	-- Désactivation des touches en jeu ET Anti Cinematic Camera quand on ferme le menu en voiture
	if VMenu.visible or (not VMenu.visible and (GetGameTimer() - VMenu.closedTime < 1000)) then
		VMenu.DisableControls()
	end

	if VMenu.visible then
		if talkingTarget ~= -1 then
			VMenu.target = talkingTarget
			talkingTarget = -1
		end

		timerTarget = timerTarget + 1
		if timerTarget >= 1500 then
			VMenu.target = -1
			timerTarget = 0
			if VMenu.police then
				if VMenu.curMenu == 98 then
					TriggerEvent("vmenu:closeMenu")
					VMenu.notif("Vous n'avez plus de cible")
				end
			end
		end

		if VOpts.toUpdate ~= nil then -- Ne Pas Toucher


			--------------------------------------------------- EDITION A PARTIR D'ICI ---------------------------------------------------



			------------ Options Toggle : Changement des options depuis le menu.

      if VMenu.hospital then
    if VOpts.toUpdate == "Sexe" then
      local model = nil
      if getOpt("Sexe") == 0 then
        model = GetHashKey("mp_m_freemode_01")
      else
        model = GetHashKey("mp_f_freemode_01")
      end

      if model ~= nil then
        TriggerServerEvent("vmenu:lastCharInShop", model)
      end
      VMenu.EditFunc(10, "Valider", "vmenu:getclientFace", {getOpt("Sexe"),getOpt("Face"),0}, "Obtenir ce changement")
    elseif VOpts.toUpdate == "Face" or VOpts.toUpdate == "Face_text" then
      -- local id = getOpt("Face")
      SetPedHeadBlendData(GetPlayerPed(-1), getOpt("Face"), getOpt("Face"), getOpt("Face"), getOpt("Couleur"), getOpt("Couleur"), getOpt("Couleur"), 1.0, 1.0, 1.0, true)
      -- La barbe bientôt
      --SetPedHeadOverlay(playerPed,  1,  Character['beard_1'],  (Character['beard_2'] / 10) + 0.0)    -- Beard
      --SetPedHeadOverlayColor(playerPed,  1,  1,  Character['beard_3'],  Character['beard_4'])        -- Beard Color
      SetPedComponentVariation(GetPlayerPed(-1), 0, getOpt("Face"), 0, 2)
      VMenu.EditFunc(10, "Valider", "vmenu:getclientFace", {getOpt("Sexe"),getOpt("Face"),0}, "Obtenir ce changement")
    elseif VOpts.toUpdate == "Yeux" then
      -- local id = getOpt("Face")
      --SetPedHeadBlendData(GetPlayerPed(-1), getOpt("Face"), getOpt("Face"), getOpt("Face"), getOpt("Couleur"), getOpt("Couleur"), getOpt("Couleur"), 1.0, 1.0, 1.0, true)
      -- La barbe bientôt
      --SetPedHeadOverlay(playerPed,  1,  Character['beard_1'],  (Character['beard_2'] / 10) + 0.0)    -- Beard
      --SetPedHeadOverlayColor(playerPed,  1,  1,  Character['beard_3'],  Character['beard_4'])        -- Beard Color
      SetPedEyeColor(GetPlayerPed(-1), getOpt("Yeux"))
      VMenu.EditFunc(10, "Valider", "vmenu:getclientFace", {getOpt("Sexe"),getOpt("Face"),0}, "Obtenir ce changement")
    end
  end

			if VOpts.toUpdate == "EscortM" then
				if PEscorthandCuffed or PhandCuffed then
					local pname = GetPlayerName(PlayerId())
					PhandCuffed = not PhandCuffed
					PEscorthandCuffed = not PEscorthandCuffed
					--TriggerServerEvent("menupolice:escortcuff_s", GetPlayerServerId(VMenu.target), pname)
					TriggerEvent("menupolice:wescortcuff", VMenu.target)
				else
					TriggerEvent("itinerance:notif", "Aucun civil à proximité n'est menotté")
				end

			end

			if VOpts.toUpdate == "Menotter" then
				if getOpt("Menotter") then
					PhandCuffed = true
					TriggerServerEvent("menupolice:cuff_s", GetPlayerServerId(VMenu.target))
					TriggerEvent("menupolice:wcuff", VMenu.target)
				else
					PhandCuffed = false
					TriggerServerEvent("menupolice:uncuff_s", GetPlayerServerId(VMenu.target))
					TriggerEvent("menupolice:wuncuff", VMenu.target)
				end
			end

			if VOpts.toUpdate == "itemBuy" then
				-- local curUpdate = getOpt("itemBuy")
				-- VMenu.ResetMenu(11, "", "default")
				-- VMenu.AddNum(11, "Quantité", "itemBuy", curUpdate, 30, "Sélection")
				for _, item in pairs(inv_array_legal) do
					VMenu.EditFunc(11, item.name, "inventory:buy", {getOpt("itemBuy"), item.id, item.price, item.name}, "Acheter")
				end
			end

			if VMenu.item_menu then
				if VOpts.toUpdate == "itemQty" then
					VMenu.EditFunc(98, "Donner", "inventory:giveItem", {tonumber(menuitem.id), tostring(menuitem.name), getOpt("itemQty"), tonumber(ITEMS[menuitem.id].quantity)}, lang.common.access)
					VMenu.EditFunc(98, "~r~Jeter", "inventory:dropItem", {tonumber(menuitem.id), tostring(menuitem.name), getOpt("itemQty"), tonumber(ITEMS[menuitem.id].quantity)}, lang.common.access)
				end
			end

			if VMenu.police then
				if VOpts.toUpdate == "Amcon" then
					VMenu.EditFunc(98, "Donner contravention", "menupolice:givecon", {getOpt("Amcon")}, "Accéder")
				elseif VOpts.toUpdate == "AmountP" then
          VMenu.EditFunc(98, "Retirer les points sur le permis", "menupolice:removepp", {getOpt("AmountP")}, "Accéder")
        end
			end

			if VMenu.depan then
				if VOpts.toUpdate == "AmfacTow" then
					VMenu.EditFunc(98, "Donner facture", "menutow:givefac", {getOpt("AmfacTow")}, "Accéder")
				end
			end

			if VMenu.taxi then
				if VOpts.toUpdate == "AmfacTaxi" then
					VMenu.EditFunc(98, "Donner facture", "menutaxi:givefac", {getOpt("AmfacTaxi")}, "Accéder")
				end
			end
      if VMenu.garda then
        if VOpts.toUpdate == "AmfacGarda" then
          VMenu.EditFunc(98, "Donner facture", "menugarda:givefac", {getOpt("AmfacGarda")}, "Accéder")
        end
      end
      if VMenu.barbershop then
      if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
        if VOpts.toUpdate == "Barbe" or VOpts.toUpdate == "BarbeColor" then
          SetPedHeadOverlay(GetPlayerPed(-1), 1, getOpt("Barbe"), 1.0)
          SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, getOpt("BarbeColor"), 0)
          VMenu.EditFunc(9, "Valider", "vmenu:getclientHair", {getOpt("Hair"),getOpt("HairSec"),getOpt("HairColor"),getOpt("HairColorSec"),getOpt("Barbe"),getOpt("BarbeColor"),
              getOpt("Eyebrows"),getOpt("Eyebrows_Color"),getOpt("Eyebrows_Color_1")}, "Valider")
                    end
      end
      if VOpts.toUpdate == "Eyebrows" then
        Citizen.Trace(getOpt("Eyebrows"))
        SetPedHeadOverlay(GetPlayerPed(-1), 2, getOpt("Eyebrows"), 1.0)
        VMenu.EditFunc(9, "Valider", "vmenu:getclientHair", {getOpt("Hair"),getOpt("HairSec"),getOpt("HairColor"),getOpt("HairColorSec"),getOpt("Barbe"),getOpt("BarbeColor"),
            getOpt("Eyebrows"),getOpt("Eyebrows_Color"),getOpt("Eyebrows_Color_1")}, "Valider")
      end
      if VOpts.toUpdate == "Eyebrows_Color" or VOpts.toUpdate == "Eyebrows_Color_1" then
        SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1,getOpt("Eyebrows_Color"), getOpt("Eyebrows_Color_1"))
          VMenu.EditFunc(9, "Valider", "vmenu:getclientHair", {getOpt("Hair"),getOpt("HairSec"),getOpt("HairColor"),getOpt("HairColorSec"),getOpt("Barbe"),getOpt("BarbeColor"),
              getOpt("Eyebrows"),getOpt("Eyebrows_Color"),getOpt("Eyebrows_Color_1")}, "Valider")
      end
        if VOpts.toUpdate == "Hair" or VOpts.toUpdate == "HairSec" or VOpts.toUpdate == "HairColor" or VOpts.toUpdate == "HairColorSec" then
          SetPedComponentVariation(GetPlayerPed(-1), 2, getOpt("Hair"), getOpt("HairSec"), 2)
          SetPedHairColor(GetPlayerPed(-1), getOpt("HairColor"), getOpt("HairColorSec"))
          VMenu.EditFunc(9, "Valider", "vmenu:getclientHair", {getOpt("Hair"),getOpt("HairSec"),getOpt("HairColor"),getOpt("HairColorSec"),getOpt("Barbe"),getOpt("BarbeColor"),
              getOpt("Eyebrows"),getOpt("Eyebrows_Color"),getOpt("Eyebrows_Color_1")}, "Valider")
                    end
        if VOpts.toUpdate == "Hair" then
          if (getOpt("Hair") == 1) or (getOpt("Hair") == 2) or (getOpt("Hair") == 3) or (getOpt("Hair") == 5) or (getOpt("Hair") == 6) or (getOpt("Hair") == 10) or (getOpt("Hair") == 11) or (getOpt("Hair") == 13) or (getOpt("Hair") == 15) then
            VMenu.EditNum(9, "Couleur", "HairSec", 0, 5, "Change la couleur des cheveux")
          elseif (getOpt("Hair") == 4) or (getOpt("Hair") == 7) or (getOpt("Hair") == 9) then
            VMenu.EditNum(9, "Couleur", "HairSec", 0, 6, "Change la couleur des cheveux")
          else
            VMenu.EditNum(9, "Couleur", "HairSec", 0, 4, "Change la couleur des cheveux")
          end
        end
      end
      if VMenu.tattoos then
        local sexe
      if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
         sexe = Homme
      else
         sexe = Femme
       end
        if VOpts.toUpdate == "torso" then
          Citizen.Trace(getOpt("torso"))
            local hash = GetHashKey(sexe.Torso[getOpt("torso")].name)
            local col = GetHashKey(sexe.Torso[getOpt("torso")].col)
            local ped = GetPlayerPed(-1)
            ClearPedDecorations(ped)
            ApplyPedOverlay(ped, col, hash)
            VMenu.EditFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
            end
        if VOpts.toUpdate == "bras_g" then
          Citizen.Trace(getOpt("bras_g"))
          local hash = GetHashKey(sexe.Bras_Gauche[getOpt("bras_g")].name)
          local col = GetHashKey(sexe.Bras_Gauche[getOpt("bras_g")].col)
          local ped = GetPlayerPed(-1)
          ClearPedDecorations(ped)
          ApplyPedOverlay(ped, col, hash)
          VMenu.EditFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
        end
        if VOpts.toUpdate == "bras_d" then
          Citizen.Trace(getOpt("bras_g"))
          local hash = GetHashKey(sexe.Bras_Droit[getOpt("bras_d")].name)
          local col = GetHashKey(sexe.Bras_Droit[getOpt("bras_d")].col)
          local ped = GetPlayerPed(-1)
          ClearPedDecorations(ped)
          ApplyPedOverlay(ped, col, hash)
          VMenu.EditFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
        end
        if VOpts.toUpdate == "jambe_g" then
          Citizen.Trace(getOpt("bras_g"))
          local hash = GetHashKey(sexe.Jambe_Gauche[getOpt("jambe_g")].name)
          local col = GetHashKey(sexe.Jambe_Gauche[getOpt("jambe_g")].col)
          local ped = GetPlayerPed(-1)
          ClearPedDecorations(ped)
          ApplyPedOverlay(ped, col, hash)
          VMenu.EditFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
        end
        if VOpts.toUpdate == "jambe_d" then
          Citizen.Trace(getOpt("bras_g"))
          local hash = GetHashKey(sexe.Jambe_Droite[getOpt("jambe_d")].name)
          local col = GetHashKey(sexe.Jambe_Droite[getOpt("jambe_d")].col)
          local ped = GetPlayerPed(-1)
          ClearPedDecorations(ped)
          ApplyPedOverlay(ped, col, hash)
          VMenu.EditFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
        end
        if VOpts.toUpdate == "tete" then
          Citizen.Trace(getOpt("bras_g"))
          local hash = GetHashKey(sexe.Tete[getOpt("tete")].name)
          local col = GetHashKey(sexe.Tete[getOpt("tete")].col)
          local ped = GetPlayerPed(-1)
          ClearPedDecorations(ped)
          ApplyPedOverlay(ped, col, hash)
          VMenu.EditFunc(50, "Valider", "vmenu:settattoos", {getOpt("torso"),getOpt("bras_g"),getOpt("bras_d"),getOpt("jambe_g"),getOpt("jambe_d"),getOpt("tete")}, "Valider")
        end
      end
			-- Ne Pas Toucher
			VOpts.toUpdate = nil
		end


		------------ Options Toggle : Récupération des valeurs pour les placer dans le menu. (Uniquement si besoin des valeurs en temps réel)

		if (IsNearPoints(LockerPolice, 4.5) == true) then
			VMenu.lockerpolice = true
		elseif (IsNearPoints(Armory, 2) == true) then

    elseif (IsNearPoints(armory_gouv, 2) == true) then
      VMenu.armorygouv = true
    elseif (IsNearPoints(garage_helico_gouv, 5) == true) then
          VMenu.garagehelicogouv = true
    elseif (IsNearPoints(garage_gouv, 5) == true) then
          VMenu.garagegouv = true
    elseif (IsNearPoints(Garage_bateau_police, 5) == true) then
          VMenu.garagebateaupolice = true
    elseif (IsNearPoints(vote, 2) == true) then
          VMenu.vote = true
		elseif (IsNearPoints(informateur_weed, 3) == true) then

		elseif (IsNearPoints(informateur_coke, 3) == true) then

		elseif (IsNearPoints(informateur_meth, 3) == true) then

		elseif (IsNearPoints(informateur_organe, 3) == true) then

    elseif (IsNearPoints(apart_entrer, 1.5) == true) then

    elseif (IsNearPoints(apart_sorti, 1.5) == true) then

    elseif (IsNearPoints(apart_cache, 1.5) == true) then

    elseif (IsNearPoints(apart_agent, 3) == true) then

    elseif (IsNearPoints(job_taxi, 3) == true) then

    elseif (IsNearPoints(job_tow, 3) == true) then

    elseif (IsNearPoints(tattoo, 3) == true) then
        VMenu.tattoos = true
		elseif (IsNearPoints(JailPolice, 1) == true) then

		elseif (IsNearPoints(lavage_argent, 3) == true) then

		elseif (IsNearPoints(changeYourJob, 3) == true) then
      VMenu.changeYourJob = true
		elseif (IsNearPoints(Tanker_company, 3) == true) then
			VMenu.Tanker_company = true
		elseif (IsNearPoints(Container_company, 3) == true) then
			VMenu.Container_company = true
		elseif (IsNearPoints(Frigorifique_company, 3) == true) then
			VMenu.Frigorifique_company = true
		elseif (IsNearPoints(Log_company, 3) == true) then
			VMenu.Log_company = true
		elseif (IsNearPoints(Garage_police, 5) == true) then
			VMenu.garagepolice = true
		elseif (IsNearPoints(Garage_helico_police, 5) == true) then
			VMenu.garagehelicopolice = true
		elseif (IsNearPoints(Garage_helico_ambulance, 5) == true) then
			VMenu.garagehelicoambulance = true
		elseif (IsNearPoints(OutfitsShop, 4) == true) then
			VMenu.outfitshop = true
		elseif (IsNearPoints(BarberShop, 4) == true) then
			VMenu.barbershop = true
		elseif (IsNearPoints(Hospital, 4) == true) then
			VMenu.hospital = true
		elseif (IsNearPoints(Store, 4) == true) then
			VMenu.store = true
		else
			if VMenu.curMenu ~= 98 then
				TriggerEvent("vmenu:toggleMenu")
			end
		end

		if IsControlPressed(0, 322) then

		end
		-------------------------------- FIN EDITION ---------------------------------

		-- elseif VMenu.voiceTarget then
		--       for i = 0,64 do
		--           if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(i))) < 3.0001) then
		--           	if NetworkIsPlayerTalking(i) then
		--                 	talkingTarget = i
		--                 	break
		--                 end
		--           end
		--       end
	else
		for i = 0,31 do
			if NetworkIsPlayerConnected(i) then
				if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= nil then
					if GetPlayerServerId(i) ~= GetPlayerServerId(PlayerId()) then
						if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(i))) < 2.5001) then
							talkingTarget = i

							break
						end
						talkingTarget = -1
					end
				end
			end
		end

		if HandCuffed == true then
			Citizen.Trace("Disabled")
			Wait(1000)
			VMenu.DisableControlsHandCuffed()
		end

		-- if IsControlPressed(0, 167) then
		-- 	Wait(100)
		-- 	local player = GetPlayerPed(-1)
		-- 	local v = GetVehiclePedIsIn(GetPlayerPed(-1), true)
		-- 	SetVehicleLivery(v, 3)
		-- 	VMenu.notif(tostring(livery))
		-- 	livery = livery + 1
		-- end



		if IsControlPressed(0, 311) then
			if User.police >= 1 then
				if talkingTarget ~= -1 then
					if not kpress then
						PhandCuffed = true
						TriggerServerEvent("menupolice:cuff_s", GetPlayerServerId(talkingTarget))
						TriggerEvent("menupolice:wcuff", talkingTarget)
						kpress = not kpress
					else
						PhandCuffed = false
						TriggerServerEvent("menupolice:uncuff_s", GetPlayerServerId(talkingTarget))
						TriggerEvent("menupolice:wuncuff", talkingTarget)
						kpress = not kpress
					end
				else
					TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de cible")
				end
			end
		end

		if IsControlPressed(0, VMenu.mopenKey) then
			timerTarget = 0
			VMenu.curItem = 1
			--TriggerEvent("vmenu:anim", "cellphone@", "text_in")
			TriggerEvent("vmenu:openMenu", 98)
			VMenu.mainMenu = true
			-- 	TriggerServerEvent("vmenu:updateUser", true)
			if VMenu.police == false and VMenu.telephone == false and VMenu.animations == false and VMenu.item_menu == false and VMenu.medic == false and VMenu.depan == false and VMenu.taxi == false and VMenu.pres == false and VMenu.garde == false and VMenu.garda == false then
        Wait(300)
        getMainMenu()
			end
			Wait(100)
		end

		if IsControlPressed(0, VMenu.openKey) then
			VMenu.curItem = 1
			if (IsNearPoints(LockerPolice, 4.5) == true and User.police >= 1)  then
				TriggerEvent("vmenu:openMenu", 5)
				if VMenu.lockerpolice == false then
					getLockerPolice()
				end
			elseif (IsNearPoints(Armory, 2) == true and User.police >= 1) then
				TriggerEvent("vmenu:openMenu", 6)
				getArmory()
			elseif (IsNearPoints(Garage_police, 4) == true and User.police >= 1) then
				TriggerEvent("vmenu:openMenu", 7)
				if VMenu.garagepolice == false then
					getGaragePolice()
				end
			elseif (IsNearPoints(Garage_helico_police, 4) == true and User.police >= 1) then
				TriggerEvent("vmenu:openMenu", 17)
				if VMenu.garagehelicopolice == false then
					getGarageHelicoPolice()
				end
			elseif (IsNearPoints(armory_gouv, 2) == true and User.job == 14) or (IsNearPoints(armory_gouv, 2) == true and User.job == 19) then
        TriggerEvent("vmenu:openMenu", 29)
        if VMenu.armorygouv == false then
          getArmoryGouv()
        end
      elseif (IsNearPoints(garage_gouv, 4) == true and User.job == 14) or (IsNearPoints(garage_gouv, 4) == true and User.job == 19) then
              TriggerEvent("vmenu:openMenu", 30)
              if VMenu.garagegouv == false then
                getGarageGouv()
              end
      elseif (IsNearPoints(Garage_bateau_police, 4) == true and User.police >= 1) then
              TriggerEvent("vmenu:openMenu", 31)
              if VMenu.garagebateaupolice == false then
                getGarageBateauPolice()
              end
      elseif (IsNearPoints(garage_helico_gouv, 4) == true and User.job == 14) or (IsNearPoints(garage_helico_gouv, 4) == true and User.job == 19) then
              TriggerEvent("vmenu:openMenu", 32)
              if VMenu.garagehelicogouv == false then
                getGarageHelicoGouv()
              end
      elseif (IsNearPoints(vote, 2) == true) then
              TriggerEvent("vmenu:openMenu", 28)
              if VMenu.vote == false then
                getVoteMenu()
              end
			elseif (IsNearPoints(Garage_helico_ambulance, 5) == true) then
				TriggerEvent("vmenu:openMenu", 19)
				if VMenu.garagehelicoambulance == false then
					getGarageHelicoAmbulance()
				end
			elseif (IsNearPoints(Tanker_company, 3) == true) then
				if User.job == 7 then
					TriggerEvent("job:getJobInfos")
					Wait(200)
					TriggerEvent("vmenu:openMenu", 13)
					if VMenu.TankerCompany == false then
						getTankerCompany()
					end
				else
					ShowMsgtime.msg = '~r~ Vous devez être livreur de citerne !'
					ShowMsgtime.time = 150
				end
			elseif (IsNearPoints(Container_company, 3) == true) then
				if User.job == 8 then
					TriggerEvent("job:getJobInfos")
					Wait(200)
					TriggerEvent("vmenu:openMenu", 13)
					if VMenu.ContainerCompany == false then
						getContainerCompany()
					end
				else
					ShowMsgtime.msg = '~r~ Vous devez être livreur de conteneur !'
					ShowMsgtime.time = 150
				end
			elseif (IsNearPoints(Frigorifique_company, 3) == true) then
				if User.job == 9 then
					TriggerEvent("job:getJobInfos")
					Wait(200)
					TriggerEvent("vmenu:openMenu", 13)
					if VMenu.FrigorifiqueCompany == false then
						getFrigorifiqueCompany()
					end
				else
					ShowMsgtime.msg = '~r~ Vous devez être livreur de médicament !'
					ShowMsgtime.time = 150
				end
			elseif (IsNearPoints(Log_company, 3) == true) then
				if User.job == 6 then
					TriggerEvent("job:getJobInfos")
					Wait(200)
					TriggerEvent("vmenu:openMenu", 13)
					if VMenu.LogCompany == false then
						getLogCompany()
					end
				else
					ShowMsgtime.msg = '~r~ Vous devez être livreur de bois !'
					ShowMsgtime.time = 150
				end
			elseif (IsNearPoints(OutfitsShop, 4) == true) then
				VMenu.updatedChar = false
				TriggerEvent("vmenu:openMenu", 8)
			elseif (IsNearPoints(BarberShop, 4) == true) then
				VMenu.updatedChar = false
				TriggerEvent("vmenu:openMenu", 9)
				if VMenu.barbershop == false then
          getBarberShop()
        end
      elseif (IsNearPoints(Hospital, 4) == true) then
        VMenu.updatedChar = false
        TriggerEvent("vmenu:openMenu", 10)
			elseif (IsNearPoints(Store, 4) == true) then
				TriggerEvent("vmenu:openMenu", 11)
			elseif (IsNearPoints(informateur_weed, 3) == true) then
				TriggerEvent("vmenu:openMenu", 14)
			elseif (IsNearPoints(informateur_coke, 3) == true) then
				TriggerEvent("vmenu:openMenu", 20)
        local menu = 25
      elseif (IsNearPoints(tattoo, 3) == true) then
        VMenu.updatedChar = false
        TriggerEvent("vmenu:openMenu", 50)
        if VMenu.tattoos == false then
          getTatsShop()
        end
      elseif (IsNearPoints(apart_entrer, 1.5) == true) then
        TriggerEvent("vmenu:openMenu",23)
        VMenu.ResetMenu(23, "", "default")
        VMenu.AddFunc(23, "Acceder à la porte", "apart:MenuAppartement", {}, "Acheter")
      elseif (IsNearPoints(apart_sorti, 1.5) == true) then
        TriggerEvent("vmenu:openMenu",24)
        VMenu.ResetMenu(24, "", "default")
        VMenu.AddFunc(24, "Acceder à la porte", "apart:MenuInsideAppartement", {}, "Acheter")
      elseif (IsNearPoints(apart_cache, 1.5) == true) then
        TriggerEvent("vmenu:openMenu",25)
        VMenu.ResetMenu(25, "", "default")
        VMenu.AddFunc(25, "Acceder à la cache", "apart:MenuCache", {}, "Acheter")
      elseif (IsNearPoints(apart_agent, 3) == true) then
        TriggerEvent("vmenu:openMenu",26)
        --VMenu.ResetMenu(26, "", "default")
        --TriggerEvent("apart:MenuAgent")
      elseif (IsNearPoints(job_taxi, 3) == true) then
        TriggerEvent("vmenu:openMenu",28)
        VMenu.ResetMenu(28, "", "default")
        VMenu.AddFunc(28, "Acceder au coffre", "job:MenuJob", {}, "Acheter")
      elseif (IsNearPoints(job_tow, 3) == true) then
        TriggerEvent("vmenu:openMenu",28)
        VMenu.ResetMenu(28, "", "default")
        VMenu.AddFunc(28, "Acceder au coffre", "job:MenuJob", {}, "Acheter")
			elseif (IsNearPoints(informateur_meth, 3) == true) then
				TriggerEvent("vmenu:openMenu", 21)
			elseif (IsNearPoints(informateur_organe, 3) == true) then
				TriggerEvent("vmenu:openMenu", 22)
			elseif (IsNearPoints(changeYourJob, 3) == true) then
				TriggerEvent("vmenu:openMenu", 15)
			elseif (IsNearPoints(lavage_argent, 3) == true) then
				TriggerEvent("vmenu:openMenu", 16)
			elseif (IsNearPoints(JailPolice, 1) == true) then
				TriggerEvent("vmenu:openMenu", 18)
			else

			end
		end

		if (IsNearPoints(LockerPolice, 4.5) == true and User.police >= 1) then
			VMenu.lockerpolice = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder aux casiers', false)
		elseif (IsNearPoints(Armory, 2) == true and User.police >= 1) then
			VMenu.Info("Appuyer sur ~g~F6~s~ pour accéder à l'armurerie", false)
		elseif (IsNearPoints(Garage_police, 5) == true and User.police >= 1) then
			VMenu.garagepolice = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au garage', false)
	  elseif (IsNearPoints(armory_gouv, 2) == true and User.job == 14) or (IsNearPoints(armory_gouv, 2) == true and User.job == 19) then
      VMenu.armorygouv = false
      VMenu.Info("Appuyez sur ~g~F6~s~ pour ~b~accéder à l'armurerie~w~.", false)
    elseif (IsNearPoints(garage_gouv, 5) == true and User.job == 14) or (IsNearPoints(garage_gouv, 5) == true and User.job == 19) then
          VMenu.garagegouv = false
          VMenu.Info('Appuyez sur ~g~F6~s~ pour ~b~accéder au garage~w~.', false)
    elseif (IsNearPoints(garage_helico_gouv, 5) == true and User.job == 14) or (IsNearPoints(garage_helico_gouv, 5) == true and User.job == 19) then
          VMenu.garagehelicogouv = false
          VMenu.Info('Appuyez sur ~g~F6~s~ pour ~b~accéder au garage~w~.', false)
    elseif (IsNearPoints(Garage_bateau_police, 5) == true and User.police >= 1) then
          VMenu.garagebateaupolice = false
          VMenu.Info('Appuyez sur ~g~F6~s~ pour ~b~accéder au garage~w~.', false)
    elseif (IsNearPoints(vote, 2) == true) then
          VMenu.vote = false
          VMenu.Info('~w~Appuyez sur ~g~F6~w~ pour ~o~voter~w~.', false)
		elseif (IsNearPoints(Garage_helico_police, 5) == true and User.police >= 1) then
			VMenu.garagehelicopolice = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au garage', false)
		elseif (IsNearPoints(Garage_helico_ambulance, 5) == true and User.job == 13) then
			VMenu.garagehelicoambulance = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au garage', false)
		elseif (IsNearPoints(informateur_weed, 3) == true) then
			VMenu.Info("Appuyer sur ~g~F6~s~ pour parler avec l'informateur", false)
		elseif (IsNearPoints(informateur_coke, 3) == true) then
			VMenu.Info("Appuyer sur ~g~F6~s~ pour parler avec l'informateur", false)
		elseif (IsNearPoints(informateur_meth, 3) == true) then
			VMenu.Info("Appuyer sur ~g~F6~s~ pour parler avec l'informateur", false)
		elseif (IsNearPoints(informateur_organe, 3) == true) then
			VMenu.Info("Appuyer sur ~g~F6~s~ pour parler avec l'informateur", false)
    elseif (IsNearPoints(tattoo, 3) == true) then
      VMenu.tattoos = false
      VMenu.Info("Appuyer sur ~g~F6~s~ pour voir le magasin", false)
    elseif (IsNearPoints(apart_entrer, 1.5) == true) then
      VMenu.Info("Appuyer sur ~g~F6~s~ accéder à votre porte d'entrer", false)
    elseif (IsNearPoints(apart_sorti, 1.5) == true) then
      VMenu.Info("Appuyer sur ~g~F6~s~ accéder à votre porte d'entrer", false)
    elseif (IsNearPoints(apart_cache, 1.5) == true) then
      VMenu.Info("Appuyer sur ~g~F6~s~ accéder à votre cache", false)
    elseif (IsNearPoints(apart_agent, 3) == true) then
      VMenu.Info("Appuyer sur ~g~F6~s~ pour parler à l'agent", false)
    elseif (IsNearPoints(job_tow, 3) == true) then
      VMenu.Info("Appuyer sur ~g~F6~s~ pour voir votre coffre", false)
    elseif (IsNearPoints(job_taxi, 3) == true) then
      VMenu.Info("Appuyer sur ~g~F6~s~ pour voir votre coffre", false)
		elseif (IsNearPoints(changeYourJob, 3) == true) then
			VMenu.Info("Appuyer sur ~g~F6~s~ pour accéder au pôle emploi", false)
		elseif (IsNearPoints(Tanker_company, 4) == true and User.job == 7) then
			VMenu.TankerCompany = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder à la compagnie de livraison', false)
		elseif (IsNearPoints(Container_company, 4) == true and User.job == 8) then
			VMenu.ContainerCompany = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder à la compagnie de livraison', false)
		elseif (IsNearPoints(Frigorifique_company, 4) == true and User.job == 9) then
			VMenu.FrigorifiqueCompany = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder à la compagnie de livraison', false)
		elseif (IsNearPoints(Log_company, 4) == true and User.job == 6) then
			VMenu.LogCompany = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder à la compagnie de livraison', false)
		elseif (IsNearPoints(OutfitsShop, 4) == true) then
			VMenu.outfitshop = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au shop', false)
		elseif (IsNearPoints(BarberShop, 4) == true) then
			VMenu.barbershop = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au coiffeur', false)
		elseif (IsNearPoints(Hospital, 4) == true) then
			VMenu.hospital = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au menu', false)
		elseif (IsNearPoints(Store, 4) == true) then
			VMenu.store = false
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au magasin', false)
		elseif (IsNearPoints(lavage_argent, 3) == true) then
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au menu', false)
		elseif (IsNearPoints(JailPolice, 1) == true) then
			VMenu.Info('Appuyer sur ~g~F6~s~ pour accéder au menu', false)
		else
			if (VMenu.updatedChar == false) then
				if not IsEntityDead(PlayerPedId()) then
					Wait(1200)
					TriggerServerEvent("vmenu:lastChar")
					Wait(200)
				end
			end
		end
	end
	VMenu.Show()
end
end)


VMenu.test_keys() -- Capture de touches
