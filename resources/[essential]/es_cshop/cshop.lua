--NOTE: Dans l attente de la suppression des armes à la mort du joueur pour activer les armes du DLC. Si vous voulez ajouter une arme, vous n'avez qu'à enlever les "--" et pour les prix "costs = 'PRIX'"
local cshop = {}
local cshopf = {}
cshop = {
	opened = false,
	title = "Vêtements",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 1,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.9,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
			  {title = "Chapeaux", name = "Chapeaux", description = ""},
			  {title = "Lunettes", name = "Lunettes", description = ""},
				{title = "Hauts", name = "Hauts", description = ""},
				{title = "Cravates/Écharpes", name = "Cravates", description = ""},
				--{title = "Montres/Bracelets", name = "Montres", description = ""},
				{title = "Pantalons", name = "Pantalons", description = ""},
				{title = "Chaussures", name = "Chaussures", description = ""},
			}
		},
		["Chapeaux"] = {
      title = "Chapeaux",
      name = "Chapeaux",
      buttons = {
        {title = "Rien", hat= 8, hat_text = {0}, costs = 0},
        {title = "Bonnet d’âne", hat= 1, hat_text = {0}, costs = 50},
        {title = "Bonnet", hat= 2, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bob", hat= 3, hat_text = {1, 2}, costs = 50},
        {title = "Casquette", hat= 4, hat_text = {0, 1}, costs = 50},
        {title = "Bonnet", hat= 5, hat_text = {0, 1}, costs = 50},
        {title = "Casquette militaire", hat= 6, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Beret", hat= 7, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casquette", hat= 9, hat_text = {5, 7}, costs = 50},
        {title = "Casquette", hat= 10, hat_text = {5, 7}, costs = 50},
        {title = "Chapeau", hat= 12, hat_text = {0, 1, 2, 4, 6, 7}, costs = 50},
        {title = "Chapeau", hat= 13, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bandana", hat= 14, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casque beats", hat= 15, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bob", hat= 20, hat_text = {0, 1, 2, 3, 4, 5}, costs = 50},
        {title = "Chapeau", hat= 21, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bonnet de Noël", hat= 22, hat_text = {0, 1}, costs = 50},
        {title = "Bonnet de Lutin", hat= 23, hat_text = {0}, costs = 50},
        {title = "Cornes de renne", hat= 24, hat_text = {0}, costs = 50},
        {title = "Chapeau", hat= 25, hat_text = {0, 1, 2}, costs = 50},
        {title = "Chapeau melon", hat= 26, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, costs = 50},
        {title = "Chapeau Haut", hat= 27, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},  costs = 50},
        {title = "Bonnet", hat= 28, hat_text = {0, 1, 2, 3, 4, 5}, costs = 50},
        {title = "Chapeau", hat= 29, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Chapeau", hat= 30, hat_text = {0, 1}, costs = 50},
        {title = "Chapeau Américain", hat= 31, hat_text = {0}, costs = 50},
        {title = "Chapeau Américain", hat= 32, hat_text = {0}, costs = 50},
        {title = "Chapeau Américain", hat= 33, hat_text = {0}, costs = 50},
        {title = "Bonnet Américain", hat= 34, hat_text = {0}, costs = 50},
        {title = "Serre-tête Américain", hat= 35, hat_text = {0}, costs = 50},
        {title = "Serre-tête Américain", hat= 36, hat_text = {0}, costs = 50},
        {title = "Casquette porte bière", hat= 37, hat_text = {0, 1, 2, 3, 4, 5}, costs = 50},
        {title = "Bonnet Lutin", hat= 40, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bonnet Noël", hat= 41, hat_text = {0}, costs = 50},
        {title = "Bonnet Noël", hat= 42, hat_text = {0, 1, 2, 3}, costs = 50},
        {title = "Bonnet Noël", hat= 43, hat_text = {0, 1, 2, 3}, costs = 50},
        {title = "Casquette", hat= 44, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casquette", hat= 45, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casquette", hat= 54, hat_text = {0, 1}, costs = 50},
        {title = "Casquette", hat= 55, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Casquette", hat= 56, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 58, hat_text = {0, 1, 2}, costs = 50},
        {title = "Casquette", hat= 56, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette Militaire", hat= 60, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Chapeau", hat= 61, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 63, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Chapeau", hat= 64, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 50},
        {title = "Casquette", hat= 65, hat_text = {0}, costs = 50},
        {title = "Casquette", hat= 66, hat_text = {0}, costs = 50},
        {title = "Casquette", hat= 76, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}, costs = 50},
        {title = "Casquette", hat= 77, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}, costs = 50},
        {title = "Bandana", hat= 83, hat_text = {0, 1, 2, 3, 4, 5, 6}, costs = 50},
        {title = "Bob", hat= 94, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Chapeau", hat= 95, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 96, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 50},
        {title = "Bonnet de Noël", hat= 97, hat_text = {0, 1, 2, 3}, costs = 50},
        {title = "Bonnet de Noël", hat= 98, hat_text = {0}, costs = 50},
        {title = "Bonnet de Noël", hat= 99, hat_text = {0}, costs = 50},
        {title = "Bonnet de Noël", hat= 100, hat_text = {0}, costs = 50},
        {title = "Cornes de Noël", hat= 101, hat_text = {0}, costs = 50},
        {title = "Casquette", hat= 102, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 103, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, costs = 50},
        {title = "Casquette", hat= 104, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Chapeau", hat= 105, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Béret", hat= 106, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Casquette", hat= 107, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Bonnet", hat= 108, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Casquette", hat= 109, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Casquette", hat= 110, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
      }
    },
    ["Lunettes"] = {
      title = "Lunettes",
      name = "Lunettes",
      buttons = {
        {title = "Rien", glass= 0, glass_text = {0}, costs = 0},
        {title = "Lunettes", glass= 1, glass_text = {1}, costs = 0},
        {title = "Lunettes", glass= 2, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 3, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 4, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 5, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 7, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 8, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 9, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 10, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 12, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 12, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 13, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 15, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 16, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 17, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 18, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 19, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 20, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes America", glass= 21, glass_text = {0}, costs = 50},
        {title = "Lunettes America", glass= 22, glass_text = {0}, costs = 50},
        {title = "Lunettes", glass= 23, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Lunettes de Ski", glass= 25, glass_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
      }
    },
    ["Hauts"] = {
      title = "Hauts",
      name = "Hauts",
      buttons = {
		{title = "Torse nu", torso = 15, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 0},
        {title = "T-Shirt", torso = 226, torso_text = {0}, shirt = 107, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 225, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 8, three_text = 0, costs = 40},
        {title = "Blouson", torso = 224, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Gilet", torso = 223, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Blouson", torso = 221, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Chemise sans manches", torso = 219, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Blouson à Capuche", torso = 218, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Blouson sans Capuche", torso = 217, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise sans manches", torso = 216, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 8, shirt_text = {0, 10, 13, 14}, three= 2, three_text = 0, costs = 40}, 
        {title = "Blouson", torso = 215, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 8, shirt_text = {0, 1, 2, 4, 5, 7, 8, 11}, three= 1, three_text = 0, costs = 40},
        {title = "Blouson", torso = 214, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Blouson", torso = 212, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 23, shirt_text = {0, 1, 2}, three= 6, three_text = 0, costs = 40},
        {title = "Blouson à capuche", torso = 211, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Blouson", torso = 210, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 14, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Manteau", torso = 209, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 208, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Blouson sans Manches", torso = 207, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Sweet", torso = 206, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 2, three_text = 0, costs = 40}, 
        {title = "Sweet à capuche", torso = 204, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 24, shirt_text = {0, 1, 2}, three= 6, three_text = 0, costs = 40},
        {title = "Sweet à capuche", torso = 203, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Sweet à capuche", torso = 202, torso_text = {0, 1, 2, 3, 4}, shirt = 2, shirt_text = {3}, three= 2, three_text = 0, costs = 40},
        {title = "Sweet", torso = 200, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Veste de Noël", torso = 199, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 80},
        {title = "Pull de Noël", torso = 198, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40}, 
        {title = "Pull de Noël", torso = 197, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40}, 
        {title = "Pull de Noël", torso = 196, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Pull de Noël", torso = 195, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Pull de Noël", torso = 194, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 193, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 192, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 3, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 192, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 21, shirt_text = {0, 1, 2, 3, 4}, three= 4, three_text = 0, costs = 40},
        {title = "Manteau", torso = 191, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 76, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, three= 1, three_text = 0, costs = 40},
        {title = "Manteau", torso = 190, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 189, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 38, shirt_text = {0, 1}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 188, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Manteau", torso = 187, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 15, shirt_text = {0, 10, 13, 14}, three= 4, three_text = 0, costs = 40},
        {title = "Manteau", torso = 185, torso_text = {0, 1, 2, 3}, shirt = 76, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, three= 4, three_text = 0, costs = 40},
        {title = "Manteau", torso = 184, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Manteau", torso = 183, torso_text = {0, 1, 2, 3}, shirt = 69, shirt_text = {0, 1, 2, 3, 4}, three= 14, three_text = 0, costs = 40},
        {title = "Manteau", torso = 182, torso_text = {0, 1}, shirt = 15, shirt_text = {0, 10, 13, 14}, three= 1, three_text = 0, costs = 40},
        {title = "Manteau", torso = 181, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 38, shirt_text = {0, 1}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 179, torso_text = {0, 1, 2, 3}, shirt = 13, shirt_text = {0, 1, 2, 3, 8, 13}, three= 2, three_text = 0, costs = 40},
        {title = "Veste biker sans manches", torso = 176, torso_text = {0}, shirt = 81, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 175, torso_text = {0, 1, 2, 3}, shirt = 24, shirt_text = {0, 1, 2}, three= 2, three_text = 0, costs = 40},
        {title = "Blouson Biker", torso = 174, torso_text = {0, 1, 2, 3}, shirt = 24, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Blouson Biker", torso = 173, torso_text = {0, 1, 2, 3}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 7,  8, 11}, three= 2, three_text = 0, costs = 40},
        {title = "Veste", torso = 171, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 170, torso_text = {0, 1, 2, 3}, shirt = 38, shirt_text = {0, 1}, three= 2, three_text = 0, costs = 40},
        {title = "Veste en jeans", torso = 169, torso_text = {0, 1, 2, 3}, shirt = 76, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 168, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 167, torso_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, shirt = 1, shirt_text = {}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 166, torso_text = {0, 1, 2}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 2, three_text = 0, costs = 40},
        {title = "Veste de Sport", torso = 165, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Veste de Sport", torso = 164, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Blouson", torso = 163, torso_text = {0}, shirt = 1, shirt_text = {0, 2, 3, 4, 5, 6, 7, 8, 11, 12, 14}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 161, torso_text = {0, 1, 2, 3}, shirt = 2, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 11}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 160, torso_text = {0, 1}, shirt = 16, shirt_text = {0, 1, 2}, three= 2, three_text = 0, costs = 40},
        {title = "Veste", torso = 159, torso_text = {0, 1}, shirt = 7, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Veste", torso = 158, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {}, three= 2, three_text = 0, costs = 40},
        {title = "Veste", torso = 157, torso_text = {0, 1, 2, 3}, shirt = 10, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 2, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 156, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 16, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 154, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 18, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 153, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Chandail de Moto", torso = 152, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 151, torso_text = {0, 2, 3, 4, 5}, shirt = 23, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 150, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 15, shirt_text = {0}, three=4 , three_text = 0, costs = 40},
        {title = "Gilet de Moto", torso = 148, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 147, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 15, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "T-shirt", torso = 146, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 143, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 142, torso_text = {0, 1, 2}, shirt = 4, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 141, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 140, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12, 14}, shirt = 72, shirt_text = {0, 1, 2, 3, 4, 5}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 139, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste de Cuir", torso = 138, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Pull", torso = 137, torso_text = {0, 1, 2}, shirt = 73, shirt_text = {0, 1, 2, 3}, three= 1, three_text = 0, costs = 40},
        {title = "Gilet", torso = 136, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 10, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 135, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Hoodies", torso = 134, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 133, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Veste", torso = 132, torso_text = {}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Polo", torso = 131, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Gilet", torso = 130, torso_text = {0}, shirt = 23, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 129, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "T-Shirt", torso = 128, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 127, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 11}, three= 1, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 126, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 15, shirt_text = {0}, three=1 , three_text = 0, costs = 40},
        {title = "Manteau", torso = 125, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 124, torso_text = {0}, shirt = 23, shirt_text = {0, 1, 2, 3}, three= 81, three_text = 0, costs = 40},
        {title = "Polo", torso = 123, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 122, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, shirt = 23, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 121, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 2, shirt_text = {7}, three=1 , three_text = 0, costs = 40},
        {title = "Chemise", torso = 120, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 50, shirt_text = {0, 1}, three= 81, three_text = 0, costs = 40},
        {title = "Veste", torso = 119, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 4, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 118, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 1, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 117, torso_text = {0, 1, 2}, shirt = 75, shirt_text = {0, 1, 2, 3, 4, 5, 7}, three= 1, three_text = 0, costs = 40},
        {title = "Veste du père noël", torso = 116, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Veste", torso = 115, torso_text = {0}, shirt = 4, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 113, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 112, torso_text = {0,1}, shirt = 36, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 4, three_text = 0, costs = 40},
        {title = "Pull", torso = 111, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste de Cuir", torso = 110, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Polo", torso = 109, torso_text = {}, shirt = 73, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 108, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 107, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 106, torso_text = {0}, shirt = 23, shirt_text = {0, 1, 2}, three=1 , three_text = 0, costs = 40},
        {title = "Chemise", torso = 105, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Veste motifs", torso = 104, torso_text = {0}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste motifs", torso = 103, torso_text = {0}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 102, torso_text = {0, 1, 2, 3}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 4, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 101, torso_text = {0, 1, 2, 3}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 4, three_text = 0, costs = 40}, 
        {title = "Costard", torso = 100, torso_text = {0, 1, 2, 3, 4}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 12, three_text = 0, costs = 40},
        {title = "Costard", torso = 99, torso_text = {0, 1, 2, 3, 4}, shirt = 32, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 12, three_text = 0, costs = 40},
        {title = "Veste", torso = 98, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "T-shirt", torso = 97, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Sweat", torso = 96, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 95, torso_text = {0, 1 ,2}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Polo", torso = 94, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Polo", torso = 93, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Gilet", torso = 92, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Sweat", torso = 90, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 89, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "Sweat", torso = 88, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 23, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Blouson", torso = 87, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 86, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 85, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 2, three_text = 4, costs = 40}, 
        {title = "Veste", torso = 84, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Sweet", torso = 83, torso_text = {0, 1 ,2, 3, 4}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "T-shirt", torso = 82, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "T-shirt", torso = 81, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Pull", torso = 79, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 78, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "Manteau", torso = 77, torso_text = {0, 1, 2, 3}, shirt = 11, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Manteau", torso = 76, torso_text = {0, 1, 2, 3, 4}, shirt = 3, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 75, torso_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 74, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 11, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 73, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Manteau", torso = 72, torso_text = {0, 1, 2, 3}, shirt = 1, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 71, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Blouson", torso = 70, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 76, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, three= 1, three_text = 0, costs = 40}, 
        {title = "T-Shirt", torso = 69, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 2, shirt_text = {0, 1, 3, 4, 5}, three= 4 , three_text = 0, costs = 40},
        {title = "Veste à capuche", torso = 68, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 2, shirt_text = {0, 1, 2, 3, 4, 5}, three= 2, three_text = 1, costs = 40}, 
        {title = "Veste en cuir", torso = 64, torso_text = {0}, shirt = 2, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 11}, three= 17, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 63, torso_text = {0}, shirt = 20, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste en cuir", torso = 62, torso_text = {0}, shirt = 1, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, three= 1, three_text = 1, costs = 40}, 
        {title = "Veste", torso = 61, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 60, torso_text = {0, 1, 2, 3}, shirt = 13, shirt_text = {0, 1, 2, 3, 8, 13}, three= 8, three_text = 0, costs = 40},
        {title = "Veste", torso = 59, torso_text = {0, 1, 2, 3}, shirt = 4, shirt_text = {0, 1, 2}, three= 14, three_text = 0, costs = 40}, 
        {title = "Hoodie", torso = 57, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 56, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 53, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Pull de Noël", torso = 52, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "Pull de Noël", torso = 51, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 50, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 49, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 47, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Costard", torso = 46, torso_text = {0, 1, 2}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 7, 8, 11}, three= 1, three_text = 0, costs = 40}, 
        {title = "Chemise Americaine", torso = 45, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 44, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "T-Shirt", torso = 43, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 42, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 41, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Gilet", torso = 40, torso_text = {0,1}, shirt = 7, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 39, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Pull", torso = 38, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 8, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 37, torso_text = {0}, shirt = 11, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, three= 1, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 36, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 5, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 35, torso_text = {0}, shirt = 1, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12 ,14}, three= 1, three_text = 0, costs = 40},
        {title = "Hawkiin", torso = 34, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 33, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 31, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 31, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12 ,14, 15}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 30, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 31, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 4, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 29, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt =31, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 28, torso_text = {0, 1, 2}, shirt = 11, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12 ,14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 27, torso_text = {0, 1, 2}, shirt = 11, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12 ,14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 26, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Gillet", torso = 25, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 6, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 14}, three= 11, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 24, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 4, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 23, torso_text = {0, 1, 2}, shirt = 11, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12 ,14, 15}, three= 4, three_text = 0, costs = 40},
        {title = "T-shirt", torso = 22, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 21, torso_text = {0, 1, 2, 3}, shirt = 6, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 26, three_text = 1, costs = 40},
        {title = "Veste", torso = 20, torso_text = {0, 1, 2, 3}, shirt = 4, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 19, torso_text = {0, 1}, shirt = 4, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 18, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 19, three_text = 1, costs = 40},
        {title = "Veste", torso = 17, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 5, three_text = 0, costs = 40}, 
        {title = "T-shirt", torso = 16, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 14, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 13, torso_text = {0, 1, 2, 3, 5}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 12, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veston", torso = 11, torso_text = {0, 1, 2, 3}, shirt = 50, shirt_text = {0, 1}, three= 11, three_text = 1, costs = 40},
        {title = "Veste", torso = 10, torso_text = {0, 1, 2}, shirt = 4, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Polo", torso = 9, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 8, torso_text = {0, 10, 13, 14}, shirt = 15, shirt_text = {0}, three= 8, three_text = 0, costs = 40}, 
        {title = "Hoodies", torso = 7, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 1, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 6, torso_text = {0, 1, 3, 4, 5, 6, 11}, shirt = 11, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 5, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 5, three_text = 0, costs = 40},
        {title = "Costard", torso = 4, torso_text = {0, 2, 3, 11, 14}, shirt = 1, shirt_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 3, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 16, shirt_text = {0, 1, 2}, three= 12, three_text = 0, costs = 40},
        {title = "Veste", torso = 2, torso_text = {9}, shirt = 15, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Veste", torso = 1, torso_text = {0, 1, 3, 4, 5, 6, 7, 8, 11, 12, 14}, shirt = 15, shirt_text = {0}, three= 19, three_text = 1, costs = 40},
        {title = "Veste", torso = 0, torso_text = {0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12}, shirt = 15, shirt_text = {0}, three= 19, three_text = 1, costs = 40}, 
      }
    },
     ["Cravates"] = {
      title = "Cravates",
      name = "Cravates",
      buttons = {
        {title = "Rien", seven = 0, seven_text = {0}, costs = 0},
        {title = "Cravate", seven = 10, seven_text = {0, 1, 2}, costs = 30},
        {title = "Noeud Papillon", seven = 11, seven_text = {2}, costs = 30},
        {title = "Cravate Fine", seven = 12, seven_text = {0, 1, 2}, costs = 30},
        {title = "Chaîne", seven = 16, seven_text = {0, 1, 2}, costs = 30},
        {title = "Chaîne", seven = 17, seven_text = {0, 1, 2}, costs = 30},
        {title = "Cravate rouge", seven = 18, seven_text = {0}, costs = 30},
        {title = "Cravate fine Rouge", seven = 19, seven_text = {0}, costs = 30},
        {title = "Cravate (Costume)", seven = 20, seven_text = {0, 1, 2, 3, 4}, costs = 30},
        {title = "Cravate", seven = 21, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, costs = 30},
        {title = "Noeud Papillon", seven = 22, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, costs = 30},
        {title = "Cravate Fine", seven = 23, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, costs = 30},
        {title = "Cravate (Costume)", seven = 24, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate Fine (Costume)", seven = 25, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate (Costume)", seven = 26, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate Fine (Costume)", seven = 27, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate Costume", seven = 28, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate Fine (Costume)", seven = 29, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Echarpe", seven = 30, seven_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Echarpe V2", seven = 31, seven_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Noeud Papillon", seven = 32, seven_text = {0, 1, 2}, costs = 30},
        {title = "Echarpe Noël", seven = 34, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Echarpe Noël V2", seven = 35, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Noeud Papillon", seven = 36, seven_text = {0}, costs = 30},
        {title = "Cravate", seven = 37, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate", seven = 38, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate", seven = 39, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Chaîne", seven = 42, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 43, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 44, seven_text = {0}, costs = 30},
        {title = "Chaîne", seven = 45, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 46, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 47, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 48, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 49, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 50, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 51, seven_text = {0}, costs = 30},
        {title = "Chaîne", seven = 52, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 53, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 54, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 55, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 74, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 75, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 76, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 77, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 78, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 79, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 80, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 81, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 82, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 84, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 85, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 86, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 87, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 88, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 89, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 90, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 91, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 92, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 93, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 94, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 110, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 111, seven_text = {0, 1}, costs = 30},
        {title = "Echarpe", seven = 112, seven_text = {0, 1, 2}, costs = 30},
        {title = "Colier", seven = 113, seven_text = {0, 1}, costs = 30},
        {title = "Casque Beat", seven = 114, seven_text = {0}, costs = 30},
        {title = "Cravate Fine (Costume)", seven = 116, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 30},
        {title = "Cravate Fine (Costume)", seven = 117, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 30},
        {title = "Noeud Papillon", seven = 118, seven_text = {0}, costs = 30},
        {title = "Chaîne", seven = 119, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 120, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 121, seven_text = {0, 1}, costs = 30},
        {title = "Chaîne", seven = 122, seven_text = {0, 1}, costs = 30},
        {title = "Colier", seven = 123, seven_text = {0, 1}, costs = 30},
        {title = "Casque Beat", seven = 124, seven_text = {0, 1}, costs = 30},
      }
    },
    ["Montres"] = {
      title = "Montres",
      name = "Montres",
      buttons = {
        {title = "Rien", watch= -1, watch_text = {}, costs = 0},
        {title = "Montre ", watch= 0, watch_text = {0}, costs = 100},
        {title = "Montre", watch= 1, watch_text = {0}, costs = 100},
        {title = "Montre", watch= 3, watch_text = {0, 1, 2, 3, 4}, costs = 100},
        {title = "Montre", watch= 4, watch_text = {0, 1, 2, 3}, costs = 100},
        {title = "Montre", watch= 5, watch_text = {0, 1, 2, 3}, costs = 100},
        {title = "Montre", watch= 6, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 7, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 8, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 9, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 10, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 11, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 12, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 13, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 14, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 15, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 16, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 17, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 18, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 19, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 20, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 21, watch_text = {0, 1, 2}, costs = 100},
        {title = "Bracelet", watch= 22, watch_text = {0}, costs = 50},
        {title = "Bracelet", watch= 23, watch_text = {0}, costs = 50},
        {title = "Bracelet", watch= 24, watch_text = {0}, costs = 50},
        {title = "Bracelet", watch= 25, watch_text = {0}, costs = 50},
        {title = "Bracelet", watch= 26, watch_text = {0}, costs = 50},
        {title = "Bracelet", watch= 27, watch_text = {0}, costs = 50},
        {title = "Bracelet", watch= 28, watch_text = {0}, costs = 50},
        {title = "Bracelet", watch= 29, watch_text = {0}, costs = 50},
      }
    },
    ["Pantalons"] = {
      title = "Pantalons",
      name = "Pantalons",
      buttons = {
        {title = "Jeans", pants = 0, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Jeans baissé", pants = 1, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Short", pants = 2, pants_text = {11}, costs = 20},
        {title = "Survêtement 1 bandes", pants = 3, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Slim", pants = 4, pants_text = {0, 1, 2, 4} , costs = 20},
        {title = "Survêtement 2 bandes", pants = 5, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Short", pants = 6, pants_text = {0, 1, 2 ,10} , costs = 20},
        {title = "Pantalon", pants = 7, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Pantalon", pants = 8, pants_text = {3, 4, 14} , costs = 20},
        {title = "Pantalon", pants = 9, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Pantalon", pants = 10, pants_text = {0, 1, 2} , costs = 20},
        {title = "Short", pants = 12, pants_text = {0, 4, 5, 7, 12} , costs = 20},
        {title = "Pantalon", pants = 13, pants_text = {0, 1, 2} , costs = 20},
        {title = "Mini-Short", pants = 14, pants_text = {0, 1, 3, 12} , costs = 20},
        {title = "Short", pants = 15, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Short", pants = 16, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Short", pants = 17, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10} , costs = 20},
        {title = "Mini-Short", pants = 18, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Pantalon", pants = 19, pants_text = {0, 1} , costs = 20},
        {title = "Pantalon", pants = 20, pants_text = {0, 1, 2 ,3} , costs = 20},
        {title = "Caleçon", pants = 21, pants_text = {0} , costs = 20},
        {title = "Pantalon", pants = 22, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12} , costs = 20},
        {title = "Pantalon", pants = 23, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12} , costs = 20},
        {title = "Pantalon", pants = 24, pants_text = {0, 1, 2 ,3, 4, 5, 6} , costs = 20},
        {title = "Pantalon", pants = 25, pants_text = {0, 1, 2 ,3, 4, 5, 6} , costs = 20},
        {title = "Slim", pants = 26, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Pantalon", pants = 27, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Pantalon", pants = 28, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}  , costs = 20},
        {title = "Pantalon", pants = 29, pants_text = {0, 1, 2} , costs = 20},
        {title = "Pantalon de pilote d’avion", pants = 30, pants_text = {0} , costs = 20},
        {title = "Pantalon militaire", pants = 31, pants_text = {0, 1, 2 ,3, 4}  , costs = 20},
        {title = "Pantalon festif", pants = 32, pants_text = {0, 1, 2 ,3}  , costs = 20},
        {title = "Pantalon", pants = 34, pants_text = {0} , costs = 20},
        {title = "Pantalon", pants = 37, pants_text = {0, 1, 2 ,3} , costs = 20},
        {title = "Pantalon de pilote d’avion", pants = 41, pants_text = {0} , costs = 20},
        {title = "Long short", pants = 42, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7} , costs = 20},
        {title = "Pantalon", pants = 43, pants_text = {0, 1} , costs = 20},
        {title = "Pantalon", pants = 45, pants_text = {0, 1, 2 ,3, 4, 5, 6} , costs = 20},
        {title = "Pantalon", pants = 46, pants_text = {0, 1} , costs = 20},
        {title = "Pantalon", pants = 47, pants_text = {0, 1} , costs = 20},
        {title = "Pantalon", pants = 48, pants_text = {0, 1, 2 ,3, 4} , costs = 20},
        {title = "Pantalon", pants = 49, pants_text = {0, 1, 2 ,3, 4} , costs = 20},
        {title = "Pantalon", pants = 50, pants_text = {0, 1, 2 ,3} , costs = 20},
        {title = "Pantalon", pants = 51, pants_text = {0} , costs = 20},
        {title = "Pantalon", pants = 52, pants_text = {0, 1, 2 ,3} , costs = 20},
        {title = "Pantalon", pants = 53, pants_text = {0} , costs = 20},
        {title = "Short", pants = 54, pants_text = {0, 1, 2 ,3, 4, 5, 6} , costs = 20},
        {title = "Pantalon", pants = 55, pants_text = {0, 1, 2 ,3} , costs = 20},
        {title = "Kimono", pants = 56, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7} , costs = 20},
        {title = "Pyjama", pants = 58, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Pantalon", pants = 60, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Caleçon", pants = 61, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13} , costs = 20},
        {title = "Short", pants = 62, pants_text = {0, 1, 2 ,3} , costs = 20},
        {title = "Pantalon", pants = 63, pants_text = {0} , costs = 20},
        {title = "Pantalon", pants = 64, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10} , costs = 20},
        {title = "Pantalon", pants = 65, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13} , costs = 20},
        {title = "Pantalon", pants = 69, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17} , costs = 20},
        {title = "Pantalon", pants = 71, pants_text = {0, 1, 2 ,3, 4, 5} , costs = 20},
        {title = "Pantalon", pants = 73, pants_text = {0, 1, 2 ,3, 4, 5} , costs = 20},
        {title = "Pantalon", pants = 75, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7} , costs = 20},
        {title = "Pantalon", pants = 76, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7} , costs = 20},
        {title = "Pantalon", pants = 78, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7} , costs = 20},
        {title = "Pantalon", pants = 79, pants_text = {0, 1, 2} , costs = 20},
        {title = "Short", pants = 80, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7} , costs = 20},
        {title = "Short", pants = 81, pants_text = {0, 1, 2} , costs = 20},
        {title = "Pantalon", pants = 82, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9} , costs = 20},
        {title = "Pantalon", pants = 83, pants_text = {0, 1, 2 ,3} , costs = 20},
        {title = "Pantalon", pants = 85, pants_text = {0, 1, 2} , costs = 20},
        {title = "Pantalon", pants = 86, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23} , costs = 20},
        {title = "Short", pants = 88, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23} , costs = 20},
        {title = "Pantalon", pants = 89, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23} , costs = 20},
        {title = "Pantalon", pants = 90, pants_text = {0, 1, 2 ,3, 4, 5, 6, 7, 8, 9} , costs = 20},
      }
    },
    ["Chaussures"] = {
      title = "Chaussures",
      name = "Chaussures",
      buttons = {
        {title = "Pied Nu", shoes = 34, shoes_text = {0}, costs = 0},
        {title = "Chaussure", shoes = 0, shoes_text = {10}, costs = 30},
        {title = "Vans", shoes = 1, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Basket", shoes = 2, shoes_text = {13, 6}, costs = 30},
        {title = "Chaussure", shoes = 3, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Chaussure", shoes = 4, shoes_text = {0, 1, 2, 4}, costs = 30},
        {title = "Tongues", shoes = 5, shoes_text = {0, 1, 2, 3}, costs = 30},
        {title = "Claquette et chaussette", shoes = 6, shoes_text = {0, 1}, costs = 30},
        {title = "Chaussure", shoes = 7, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Chaussure", shoes = 8, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Chaussure", shoes = 9, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Chaussure de Costume", shoes = 10, shoes_text = {0, 7, 12, 14,}, costs = 30},
        {title = "Chaussure de Costume", shoes = 11, shoes_text = {9, 12, 14, 15}, costs = 30},
        {title = "Chaussure", shoes = 12, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Chaussure", shoes = 14, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Chaussure", shoes = 15, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Tongues", shoes = 16, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 30},
        {title = "Chaussure de Lutin", shoes = 17, shoes_text = {0}, costs = 30},
        {title = "Chaussure de Costume", shoes = 18, shoes_text = {0, 1}, costs = 30},
        {title = "Chaussure de Costume", shoes = 19, shoes_text = {0}, costs = 30},
        {title = "Chaussure de Costume", shoes = 20, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 30},
        {title = "Chaussure de Costume", shoes = 21, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 30},
        {title = "Converse", shoes = 22, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 30},
        {title = "Chaussure", shoes = 23, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15}, costs = 30},
        {title = "Bottes", shoes = 24, shoes_text = {0}, costs = 30},
        {title = "Bottes", shoes = 25, shoes_text = {0}, costs = 30},
        {title = "Converse", shoes = 26, shoes_text = {0, 1, 2, 3, 4, 5, 6}, costs = 30},
        {title = "Bottes", shoes = 27, shoes_text = {0}, costs = 30},
        {title = "Chaussure", shoes = 28, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Chaussure", shoes = 29, shoes_text = {0}, costs = 30},
        {title = "Chaussure", shoes = 30, shoes_text = {0, 1}, costs = 30},
        {title = "Basket", shoes = 31, shoes_text = {0, 1, 2, 3, 4}, costs = 30},
        {title = "Chaussure", shoes = 32, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15}, costs = 30},
        {title = "Bottes", shoes = 35, shoes_text = {0, 1}, costs = 30},
        {title = "Chaussure", shoes = 36, shoes_text = {0, 1, 2, 3}, costs = 30},
        {title = "Bottes", shoes = 37, shoes_text = {0, 1, 2, 3, 4}, costs = 30},
        {title = "Chaussure", shoes = 38, shoes_text = {0, 1, 2, 3, 4}, costs = 30},
        {title = "Chaussure de Costume", shoes = 40, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 30},
        {title = "Chaussure", shoes = 41, shoes_text = {0}, costs = 30},
        {title = "Chaussure", shoes = 42, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 30},
        {title = "Chaussure", shoes = 43, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 30},
        {title = "Bottes", shoes = 44, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 30},
        {title = "Chaussure", shoes = 45, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 30},
        {title = "Chaussure", shoes = 46, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 30},
        {title = "Chaussure", shoes = 48, shoes_text = {0, 1}, costs = 30},
        {title = "Chaussure", shoes = 49, shoes_text = {0, 1}, costs = 30},
        {title = "Bottes", shoes = 50, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Chaussure", shoes = 51, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Bottes", shoes = 52, shoes_text = {0, 1}, costs = 30},
        {title = "Bottes", shoes = 53, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Chaussure", shoes = 54, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Chaussure Néon", shoes = 55, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 200},
        {title = "Chaussure de Costume", shoes = 56, shoes_text = {0, 1}, costs = 30},
        {title = "Chaussure", shoes = 57, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 30},
        {title = "Chaussure", shoes = 58, shoes_text = {0, 1, 2}, costs = 30},
        {title = "Chaussure", shoes = 59, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 30},
        {title = "Bottes", shoes = 60, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 30},
        {title = "Basket", shoes = 61, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 30},
        {title = "Bottes", shoes = 62, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 30},
      }
    },
    ["Couleurs"] = {
      title = "Couleurs",
      name = "Couleurs",
      buttons = {
      }
    },
  }
}

cshopf = {
  opened = false,
  title = "Vêtements",
  currentmenu = "main",
  lastmenu = nil,
  currentpos = nil,
  selectedbutton = 1,
  marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
  menu = {
    x = 0.9,
    y = 0.08,
    width = 0.2,
    height = 0.04,
    buttons = 10,
    from = 1,
    to = 10,
    scale = 0.4,
    font = 0,
    ["main"] = {
      title = "CATEGORIES",
      name = "main",
      buttons = {
        {title = "Chapeaux", name = "Chapeaux", description = ""},
        {title = "Lunettes", name = "Lunettes", description = ""},
        {title = "Hauts", name = "Hauts", description = ""},
        {title = "Cravates/Écharpes", name = "Cravates", description = ""},
        --{title = "Montres/Bracelets", name = "Montres", description = ""},
        {title = "Pantalons", name = "Pantalons", description = ""},
        {title = "Chaussures", name = "Chaussures", description = ""},
      }
    },
    ["Chapeaux"] = {
      title = "Chapeaux",
      name = "Chapeaux",
      buttons = {
        {title = "Rien", hat= (-1), hat_text = {0}, costs = 0},
        {title = "Bonnet d'Ane", hat= 1, hat_text = {0}, costs = 50},
        {title = "Chapeau", hat= 2, hat_text = {1}, costs = 50},
        {title = "Bob", hat= 3, hat_text = {7}, costs = 50},
        {title = "Casquette", hat= 4, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bonnet", hat= 5, hat_text = {0, 1, 2, 3, 4, 5, 6 ,7}, costs = 50},
        {title = "Casquette", hat= 6, hat_text = {0, 1, 2, 3, 4, 5, 6 ,7}, costs = 50},
        {title = "Béret", hat= 7, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Chapeau", hat= 8, hat_text = {4}, costs = 50},
        {title = "Casquette", hat= 9, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casquette", hat= 10, hat_text = {7}, costs = 50},
        {title = "Chapeau", hat= 11, hat_text = {1}, costs = 50},
        {title = "Bonnet", hat= 12, hat_text = {0, 7}, costs = 50},
        {title = "Chapeau", hat= 13, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Béret", hat= 14, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casque Beat", hat= 15, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 500},
        {title = "Chapeau", hat= 20, hat_text = {0, 1, 2, 3, 4, 5, 6}, costs = 50},
        {title = "Bob", hat= 21, hat_text = {0, 1, 2, 3, 4, 5, 6}, costs = 50},
        {title = "Chapeau", hat= 22, hat_text = {0, 1, 2, 3, 4, 5, 6}, costs = 50},
        {title = "Bonnet de Noël", hat= 23, hat_text = {0, 1}, costs = 50},
        {title = "Bonnet de Lutin", hat= 24, hat_text = {0}, costs = 50},
        {title = "Corne de Rennes", hat= 25, hat_text = {0}, costs = 50},
        {title = "Chapeau Rond", hat= 26, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, costs = 50},
        {title = "Chapeau Long", hat= 27, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, costs = 50},
        {title = "Chapeau", hat= 28, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bonnet", hat= 29, hat_text = {0, 1, 2, 3, 4}, costs = 50},
        {title = "Chapeau Amérique", hat= 30, hat_text = {0}, costs = 50},
        {title = "Chapeau Amérique", hat= 31, hat_text = {0}, costs = 50},
        {title = "Chapeau Amérique", hat= 32, hat_text = {0, 1}, costs = 50},
        {title = "Bonnet Amérique", hat= 33, hat_text = {0}, costs = 50},
        {title = "Couronne Amérique", hat= 34, hat_text = {0}, costs = 50},
        {title = "Etoile Amérique", hat= 35, hat_text = {0}, costs = 50},
        {title = "Casque Bière", hat= 36, hat_text = {0, 1, 2, 3, 4, 5}, costs = 50},
        {title = "Bonnet de Noël", hat= 39, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bonnet de Noël", hat= 40, hat_text = {0}, costs = 50},
        {title = "Bonnet de Noël", hat= 41, hat_text = {0, 1, 2, 3}, costs = 50},
        {title = "Bonnet de Noël", hat= 42, hat_text = {0, 1, 2, 3}, costs = 50},
        {title = "Casquette de Noël", hat= 43, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Bonnet de Noël", hat= 44, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casquette", hat= 53, hat_text = {0, 1}, costs = 50},
        {title = "Chapeau", hat= 54, hat_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Casquette", hat= 55, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Casquette", hat= 56, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 58, hat_text = {0, 1, 2}, costs = 50},
        {title = "Casquette", hat= 60, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Chapeau", hat= 61, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Chapeau", hat= 63, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 64, hat_text = {0}, costs = 50},
        {title = "Casquette", hat= 65, hat_text = {0}, costs = 50},
        {title = "Casquette", hat= 75, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}, costs = 50},
        {title = "Casquette", hat= 76, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}, costs = 50},
        {title = "Bonnet", hat= 82, hat_text = {0, 1, 2, 3, 4, 5, 6}, costs = 50},
        {title = "Bob", hat= 93, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Chapeau", hat= 94, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 95, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 50},
        {title = "Bonnet de Noël", hat= 96, hat_text = {0, 1, 2, 3}, costs = 50},
        {title = "Bonnet de Noël", hat= 97, hat_text = {0}, costs = 50},
        {title = "Bonnet de Noël", hat= 98, hat_text = {0}, costs = 50},
        {title = "Bonnet de Noël", hat= 99, hat_text = {0}, costs = 50},
        {title = "Cornes de Noël", hat= 100, hat_text = {0}, costs = 50},
        {title = "Casquette", hat= 101, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Casquette", hat= 102, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, costs = 50},
        {title = "Chapeau", hat= 103, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Chapeau", hat= 104, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Béret", hat= 105, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Casquette", hat= 106, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Casquette", hat= 107, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 50},
        {title = "Casquette", hat= 108, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Casquette", hat= 109, hat_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
      }
    },
    ["Lunettes"] = {
      title = "Lunettes",
      name = "Lunettes",
      buttons = {
        {title = "Lunettes", glass= 0, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 1, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 2, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 3, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 4, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 6, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 7, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 8, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 9, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 10, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 11, glass_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Lunettes", glass= 14, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Rien", glass= 15, glass_text = {0}, costs = 0},
        {title = "Lunettes", glass= 16, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Lunettes", glass= 17, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Lunettes", glass= 18, glass_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Lunettes", glass= 19, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 20, glass_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Lunettes", glass= 21, glass_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
        {title = "Lunettes Etoiles", glass= 22, glass_text = {0}, costs = 50},
        {title = "Lunettes", glass= 23, glass_text = {0}, costs = 50},
        {title = "Lunettes", glass= 24, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 50},
        {title = "Lunettes", glass= 25, glass_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 50},
        {title = "Lunettes d'Avion", glass= 26, glass_text = {0, 1, 2, 3, 4, 5}, costs = 50},
        {title = "Lunettes de Ski", glass= 27, glass_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 50},
      }
    },
    ["Hauts"] = {
      title = "Hauts",
      name = "Hauts",
      buttons = {
        {title = "Rien", torso = 15, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 0},
        {title = "T-Shirt", torso = 236, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Class Of 98", torso = 235, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste en cuir", torso = 234, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Veste sans manche", torso = 233, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Veste militaire", torso = 232, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Veste militaire", torso = 231, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste militaire", torso = 230, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Debardeur militaire", torso = 229, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Manteau", torso = 227, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Manteau", torso = 226, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "T-Shirt militaire", torso = 225, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "T-Shirt militaire", torso = 223, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "T-Shirt militaire", torso = 222, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "T-Shirt militaire", torso = 221, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste militaire", torso = 220, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 13, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 4, three_text = 0, costs = 40},
        {title = "Veste militaire", torso = 219, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 5, three_text = 0, costs = 40},
        {title = "Veste militaire", torso = 218, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste militaire", torso = 217, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 1, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Manteau militaire", torso = 216, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 20, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Manteau militaire", torso = 215, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 20, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Manteau militaire", torso = 214, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 20, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Manteau militaire", torso = 213, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 20, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "T-shirt militaire", torso = 212, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Hoodies militaire", torso = 210, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 18, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 0, shirt_text = {0}, three= 12, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 209, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 208, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, shirt = 108, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Sweat sans manches", torso = 207, torso_text = {0, 1, 2, 3, 4}, shirt = 0, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Manteau", torso = 206, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 0, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Sweat", torso = 205, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Pull de noël", torso = 201, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 0, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Pull de noël", torso = 199, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40},
        {title = "Pull de noël", torso = 198, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Pull de noël", torso = 197, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Pull de noël", torso = 196, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "T-Shirt nombril", torso = 195, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 3, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 194, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 20, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Blouson", torso = 193, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 1, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 4, three_text = 0, costs = 40},
        {title = "Pull", torso = 192, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 3, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 191, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 20, shirt_text = {0, 1, 2}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 190, torso_text = {0}, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, shirt = 20, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40},
        {title = "Veste", torso = 189, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 15, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Veste", torso = 187, torso_text = {0, 1, 2, 3}, shirt = 20, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 186, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Smoking", torso = 185, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 59, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 184, torso_text = {0, 1}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Veste", torso = 183, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 20, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 182, torso_text = {0, 1, 2}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 181, torso_text = {0, 1, 2, 3}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 179, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 178, torso_text = {0}, shirt = 46, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, three= 15, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 177, torso_text = {0, 1, 2, 3}, shirt = 46, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, three= 15, three_text = 0, costs = 40},
        {title = "Veste en cuir", torso = 176, torso_text = {0, 1, 2, 3}, shirt = 69, shirt_text = {0, 1, 2}, three= 15, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 175, torso_text = {0, 1, 2, 3}, shirt = 123, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, three= 15, three_text = 0, costs = 40},
        {title = "Veste en cuir", torso = 174, torso_text = {0, 1, 2, 3}, shirt = 123, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, three= 15, three_text = 0, costs = 40},
        {title = "Haut", torso = 173, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 172, torso_text = {0, 1}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Haut en jeans", torso = 171, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Débardeur court", torso = 170, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "T-Shirt déchiré court", torso = 169, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Débardeur déchiré", torso = 168, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Débardeur en jeans", torso = 167, torso_text = {0}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste en jeans", torso = 166, torso_text = {0}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 165, torso_text = {0, 1, 2}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Blouson", torso = 164, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 163, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste en cuir", torso = 162, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 161, torso_text = {0, 1, 2,}, shirt = 14, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Veste", torso = 160, torso_text = {0}, shirt = 29, shirt_text = {0, 1, 2, 3, 4}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 159, torso_text = {0, 1, 2, 3}, shirt = 0, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 158, torso_text = {0, 1, 2, 3}, shirt = 0, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 157, torso_text = {0, 1}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 4, three_text = 0, costs = 40},
        {title = "Veste sans manche", torso = 156, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste sans manche", torso = 155, torso_text = {0, 1, 2}, shirt = 1, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste sans manche", torso = 154, torso_text = {0, 1, 2, 3}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 153, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 0, three_text = 0, costs = 40},
        {title = "Veste pays", torso = 151, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 1, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 150, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 148, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 147, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 2, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 143, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, shirt = 11, shirt_text = {0, 1, 2, 10, 11, 15}, three= 5, three_text = 0, costs = 40},
        {title = "Chemise", torso = 142, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 141, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Haut College", torso = 140, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 139, torso_text = {0, 1, 2}, shirt = 69, shirt_text = {0, 1, 2}, three= 15, three_text = 0, costs = 40},
        {title = "Survetement", torso = 138, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 69, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40},
        {title = "Veste", torso = 137, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 66, shirt_text = {0, 1, 2, 3, 4, 5}, three= 5, three_text = 0, costs = 40},
        {title = "Pull", torso = 136, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Blouson", torso = 135, torso_text = {0, 1, 2}, shirt = 3, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Veste", torso = 133, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 27, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 132, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 14, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 131, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Chemise", torso = 130, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Chemise", torso = 129, torso_text = {0}, shirt = 1, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 128, torso_text = {0}, shirt = 1, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Veste", torso = 127, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 126, torso_text = {0, 1, 2}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 125, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Poncho", torso = 123, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 122, torso_text = {0}, shirt = 7, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Chemise", torso = 121, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16}, shirt = 15, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Chemise ouverte", torso = 120, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 118, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 117, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Robe", torso = 116, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Robe", torso = 115, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Robe", torso = 114, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Robe", torso = 113, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Robe", torso = 112, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Haut", torso = 111, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 110, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 2, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 109, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 1, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste de Noël", torso = 108, torso_text = {0, 1, 2}, shirt = 21, shirt_text = {0, 1, 2}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 107, torso_text = {0}, shirt = 20, shirt_text = {0, 1, 2}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 106, torso_text = {0, 1, 2, 3}, shirt = 20, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Haut", torso = 105, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 2, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 104, torso_text = {0}, shirt = 59, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40},
        {title = "Pull", torso = 103, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Veste", torso = 102, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Bikini", torso = 101, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 2, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 99, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 40, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 98, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 97, torso_text = {0}, shirt = 39, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, three= 6, three_text = 0, costs = 40},
        {title = "Chemise", torso = 96, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 95, torso_text = {0}, shirt = 39, shirt_text = {8}, three= 5, three_text = 0, costs = 40},
        {title = "Veste", torso = 94, torso_text = {0}, shirt = 39, shirt_text = {8}, three= 5, three_text = 0, costs = 40},
        {title = "Veste", torso = 93, torso_text = {0, 1, 2, 3}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 5, three_text = 0, costs = 40},
        {title = "Veste", torso = 92, torso_text = {0, 1, 2, 3}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 5, three_text = 0, costs = 40},
        {title = "Veste", torso = 91, torso_text = {0, 1, 2, 3, 4}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 90, torso_text = {0, 1, 2, 3, 4}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 6, three_text = 0, costs = 40},
        {title = "Pull", torso = 89, torso_text = {0, 1}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Tshirt", torso = 88, torso_text = {0, 1}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 87, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 86, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Chemise", torso = 85, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 84, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 83, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Veste", torso = 81, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 80, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Pull", torso = 79, torso_text = {0, 1, 2, 3}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 78, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 77, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 76, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Pull", torso = 75, torso_text = {0, 1, 2, 3}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Crop top", torso = 74, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Pull", torso = 71, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 70, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Veste", torso = 69, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 5, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 68, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, shirt = 14, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 67, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Veste", torso = 66, torso_text = {0, 1, 2, 3}, shirt = 14, shirt_text = {0}, three= 5, three_text = 0, costs = 40},
        {title = "Veste", torso = 65, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 14, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 64, torso_text = {0, 1, 2, 3, 4}, shirt = 27, shirt_text = {0, 1, 2}, three= 0, three_text = 0, costs = 40},
        {title = "Pull à capuche", torso = 63, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Pull à capuche", torso = 62, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Veste", torso = 58, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, shirt = 39, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 14, three_text = 0, costs = 40},
        {title = "Veste", torso = 57, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, shirt = 39, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 14, three_text = 0, costs = 40},
        {title = "Veste", torso = 55, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Veste", torso = 54, torso_text = {0, 1, 2, 3}, shirt = 9, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 53, torso_text = {0, 1, 2, 3}, shirt = 78, shirt_text = {0, 1, 2, 3, 4, 5}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 52, torso_text = {0, 1, 2, 3}, shirt = 78, shirt_text = {0, 1, 2, 3, 4, 5}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 51, torso_text = {0}, shirt = 37, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 50, torso_text = {0}, shirt = 14, shirt_text = {0, 1, 2, 3, 4, 5}, three= 3, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 49, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Pull", torso = 46, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Pull", torso = 45, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Pull de Noël", torso = 44, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Pull", torso = 43, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Pull militaire", torso = 42, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 40, torso_text = {0, 1}, shirt = 14, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Haut", torso = 39, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 38, torso_text = {0, 1, 2, 3}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Robe", torso = 37, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 36, torso_text = {0, 1, 2, 3, 4}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 35, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 28, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, three= 5, three_text = 0, costs = 40},
        {title = "Veste", torso = 34, torso_text = {0}, shirt = 11, shirt_text = {0, 1, 2, 10, 15}, three= 6, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 33, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 32, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 31, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 30, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Chemise", torso = 27, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 20, three_text = 0, costs = 40},
        {title = "Haut", torso = 26, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 14, shirt_text = {0}, three= 12, three_text = 0, costs = 40},
        {title = "Veste", torso = 25, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 13, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 24, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 13, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 23, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Haut", torso = 22, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Robe", torso = 21, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 20, torso_text = {0, 1}, shirt = 21, shirt_text = {0, 1, 2}, three= 5, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 19, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Bikini", torso = 18, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 17, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 16, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Bikini", torso = 15, torso_text = {0, 3, 10, 11}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Polo", torso = 14, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Haut", torso = 13, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Haut", torso = 12, torso_text = {7, 8, 9}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 11, torso_text = {0, 1, 2, 10, 11, 15}, shirt = 2, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 10, torso_text = {0, 1, 2, 7, 10, 11, 13, 15}, shirt = 59, shirt_text = {0, 1, 2, 3}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 9, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 14, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Veste", torso = 8, torso_text = {0, 1, 2}, shirt = 13, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Veste", torso = 7, torso_text = {0, 1, 2}, shirt = 13, shirt_text = {0}, three= 6, three_text = 0, costs = 40},
        {title = "Veste", torso = 6, torso_text = {0, 1, 2}, shirt = 38, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 5, torso_text = {0, 1, 7, 9}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Débardeur", torso = 4, torso_text = {13, 14}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 3, torso_text = {0, 1, 2, 3, 4}, shirt = 2, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 2, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Veste", torso = 1, torso_text = {0, 1, 2, 4, 5, 6, 9, 11, 14}, shirt = 1, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 5, three_text = 0, costs = 40},
        {title = "T-Shirt", torso = 0, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
      }
    },
    ["Cravates"] = {
      title = "Cravates",
      name = "Cravates",
      buttons = {
        {title = "Rien", seven = 0, seven_text = {0}, costs = 30},
        {title = "Boucles d'oreilles", seven = 1, seven_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Boucles d'oreilles", seven = 2, seven_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Bracelet", seven = 3, seven_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Bracelet", seven = 4, seven_text = {3}, costs = 69},
        {title = "Bracelet", seven = 5, seven_text = {4, 5}, costs = 30},
        {title = "Collier", seven = 6, seven_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Collier", seven = 7, seven_text = {0, 1}, costs = 30},
        {title = "Echarpe", seven = 9, seven_text = {0}, costs = 30},
        {title = "Bracelet", seven = 10, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Collier", seven = 11, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Collier", seven = 12, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Echarpe", seven = 13, seven_text = {0, 1, 2, 3, 4, 5}, costs = 30},
        {title = "Bracelet", seven = 14, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Echarpe", seven = 15, seven_text = {0, 1, 2, 3, 4}, costs = 30},
        {title = "Echarpe", seven = 17, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Echarpe", seven = 18, seven_text = {0, 1, 2, 3}, costs = 30},
        {title = "Noeud papillon", seven = 19, seven_text = {0}, costs = 30},
        {title = "Cravate", seven = 20, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate", seven = 21, seven_text = {0, 1, 2}, costs = 30},
        {title = "Cravate", seven = 22, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Noeud papillon", seven = 23, seven_text = {0, 1, 2}, costs = 30},
        {title = "Cravate", seven = 26, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Cravate", seven = 27, seven_text = {0, 1, 2}, costs = 30},
        {title = "Cravate", seven = 28, seven_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 30},
        {title = "Collier", seven = 29, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 30, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 31, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 33, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 34, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 35, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 36, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 37, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 38, seven_text = {0}, costs = 30},
        {title = "Collier", seven = 39, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 41, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 42, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 43, seven_text = {0}, costs = 30},
        {title = "Collier", seven = 53, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 54, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 55, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 56, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 57, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 58, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 59, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 60, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 61, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 62, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 63, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 64, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 65, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 66, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 67, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 68, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 69, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 70, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 71, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 72, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 73, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 81, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 82, seven_text = {0, 1}, costs = 30},
        {title = "Echarpe", seven = 83, seven_text = {0, 1, 2}, costs = 30},
        {title = "Collier", seven = 84, seven_text = {0}, costs = 30},
        {title = "Casque Beat", seven = 85, seven_text = {0}, costs = 300},
        {title = "Cravate", seven = 86, seven_text = {0, 1}, costs = 30},
        {title = "Cravate", seven = 87, seven_text = {0, 1, 2, 3, 4, 5, 6 ,7, 8 ,9}, costs = 30},
        {title = "Bretelles", seven = 88, seven_text = {0, 1, 2}, costs = 30},
        {title = "Collier", seven = 89, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 90, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 91, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 92, seven_text = {0, 1}, costs = 30},
        {title = "Collier", seven = 93, seven_text = {0, 1}, costs = 30},
        {title = "Casque", seven = 94, seven_text = {0, 1}, costs = 300},
      }
    },
    ["Montres"] = {
      title = "Montres",
      name = "Montres",
      buttons = {
        {title = "Montre", watch= 0, watch_text = {0}, costs = 100},
        {title = "Rien", watch= 1, watch_text = {0}, costs = 0},
        {title = "Montre", watch= 2, watch_text = {0, 1, 2, 3}, costs = 100},
        {title = "Montre", watch= 3, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 4, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 5, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 6, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 7, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 8, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 9, watch_text = {0, 1, 2}, costs = 100},
        {title = "Montre", watch= 10, watch_text = {0, 1, 2}, costs = 100},
        {title = "Bracelet", watch= 11, watch_text = {0,}, costs = 100},
        {title = "Bracelet", watch= 12, watch_text = {0}, costs = 100},
        {title = "Bracelet", watch= 13, watch_text = {0}, costs = 100},
        {title = "Bracelet", watch= 14, watch_text = {0}, costs = 100},
        {title = "Bracelet", watch= 15, watch_text = {0}, costs = 100},
        {title = "Bracelet", watch= 16, watch_text = {0}, costs = 100},
        {title = "Bracelet à Pic", watch= 17, watch_text = {0}, costs = 100},
        {title = "Bracelet en Cuir", watch= 18, watch_text = {0, 1, 2, 3}, costs = 100},
      }
    },
    ["Pantalons"] = {
      title = "Pantalons",
      name = "Pantalons",
      buttons = {
        {title = "Rien", pants = 15, pants_text = {0} , costs = 0},
        {title = "Jeans", pants = 0, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Jeans", pants = 1, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Pantacourt", pants = 2, pants_text = {0, 1, 2} , costs = 20},
        {title = "Pantalon", pants = 3, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Pantalon", pants = 4, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Short", pants = 5, pants_text = {8, 14, 15} , costs = 20},
        {title = "Pantalon", pants = 6, pants_text = {0, 1, 2} , costs = 20},
        {title = "Jupe", pants = 7, pants_text = {0, 1, 2} , costs = 20},
        {title = "Mini-Jupe", pants = 8, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15} , costs = 20},
        {title = "Mini-Jupe", pants = 9, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Mini-Short", pants = 10, pants_text = {0, 1, 2} , costs = 20},
        {title = "Pantalon", pants = 11, pants_text = {0, 1, 2, 3, 4, 6, 7} , costs = 20},
        {title = "Mini-Jupe", pants = 12, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Mini-Short", pants = 14, pants_text = {0, 1, 8, 9} , costs = 20},
        {title = "Mini-Short", pants = 16, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Culotte", pants = 17, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Jupe", pants = 18, pants_text = {0, 1} , costs = 20},
        {title = "Culotte", pants = 19, pants_text = {0, 1, 2, 3, 4} , costs = 20},
        {title = "Bas", pants = 20, pants_text = {0, 1, 2} , costs = 20},
        {title = "Culotte", pants = 21, pants_text = {0} , costs = 20},
        {title = "Bas", pants = 22, pants_text = {0, 1, 2} , costs = 20},
        {title = "Pantalon", pants = 23, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12} , costs = 20},
        {title = "Jupe", pants = 24, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12} , costs = 20},
        {title = "Short", pants = 25, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12} , costs = 20},
        {title = "Jupe", pants = 26, pants_text = {0} , costs = 20},
        {title = "Slim", pants = 27, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Jupe", pants = 28, pants_text = {0} , costs = 20},
        {title = "Pantalon", pants = 30, pants_text = {0, 1, 2, 3, 4} , costs = 20},
        {title = "Slim", pants = 31, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Pantalon", pants = 33, pants_text = {0} , costs = 20},
        {title = "Pantalon", pants = 34, pants_text = {0} , costs = 20},
        {title = "Jupe", pants = 36, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Jeans", pants = 37, pants_text = {0, 1, 2, 3, 4, 5, 6} , costs = 20},
        {title = "Pantalon", pants = 41, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Jeans", pants = 43, pants_text = {0, 1, 2, 3, 4} , costs = 20},
        {title = "Jeans", pants = 44, pants_text = {0, 1, 2, 3, 4} , costs = 20},
        {title = "Pantalon", pants = 45, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Pantalon", pants = 47, pants_text = {0, 1, 2, 3, 4, 5, 6} , costs = 20},
        {title = "Pantalon", pants = 48, pants_text = {0, 1} , costs = 20},
        {title = "Pantalon", pants = 49, pants_text = {0, 1} , costs = 20},
        {title = "Pantalon", pants = 50, pants_text = {0, 1, 2, 3, 4} , costs = 20},
        {title = "Pantalon", pants = 51, pants_text = {0, 1, 2, 3, 4} , costs = 20},
        {title = "Pantalon", pants = 52, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Pantalon", pants = 53, pants_text = {0} , costs = 20},
        {title = "Pantalon", pants = 54, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Pantalon", pants = 55, pants_text = {0} , costs = 20},
        {title = "Culotte", pants = 56, pants_text = {0, 1, 2, 3, 4, 5} , costs = 20},
        {title = "Survêtement", pants = 58, pants_text = {0, 1, 2, 3, 4} , costs = 20},
        {title = "Pantalon", pants = 60, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Culotte", pants = 62, pants_text = {00, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Bas", pants = 63, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11} , costs = 20},
        {title = "Pantalon", pants = 64, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Survêtement", pants = 66, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10} , costs = 20},
        {title = "Pantalon", pants = 67, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13} , costs = 20},
        {title = "Pantalon", pants = 71, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17} , costs = 20},
        {title = "Jeans", pants = 73, pants_text = {0, 1, 2, 3, 4, 5} , costs = 20},
        {title = "Jeans", pants = 74, pants_text = {0, 1, 2, 3, 4, 5} , costs = 20},
        {title = "Jeans", pants = 75, pants_text = {0, 1, 2} , costs = 20},
        {title = "Jeans", pants = 76, pants_text = {0, 1, 2} , costs = 20},
        {title = "Jeans", pants = 77, pants_text = {0, 1, 2} , costs = 20},
        {title = "Short", pants = 78, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Pantalon", pants = 80, pants_text = {0, 1, 2, 3, 4, 5, 6, 7} , costs = 20},
        {title = "Pantalon", pants = 81, pants_text = {0, 1, 2} , costs = 20},
        {title = "Pantacourt", pants = 82, pants_text = {0, 1, 2, 3, 4, 5, 6, 7} , costs = 20},
        {title = "Pantacourt", pants = 83, pants_text = {0, 1, 2} , costs = 20},
        {title = "Jeans", pants = 84, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9} , costs = 20},
        {title = "Jeans", pants = 85, pants_text = {0, 1, 2, 3} , costs = 20},
        {title = "Jeans", pants = 87, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15} , costs = 20},
        {title = "Pantalon", pants = 89, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23} , costs = 20},
        {title = "Pantalon", pants = 90, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23} , costs = 20},
        {title = "Short", pants = 91, pants_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23} , costs = 20},
      }
    },
    ["Chaussures"] = {
      title = "Chaussures",
      name = "Chaussures",
      buttons = {
        {title = "Pied Nu", shoes = 35, shoes_text = {0}, costs = 0},
        {title = "Talons", shoes = 0, shoes_text = {0, 1, 2, 3}, costs = 40},
        {title = "Baskets", shoes = 1, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Bottes", shoes = 2, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Baskets", shoes = 3, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Baskets", shoes = 4, shoes_text = {0, 1, 2, 3}, costs = 40},
        {title = "Tongues", shoes = 5, shoes_text = {0, 1, 10, 13}, costs = 40},
        {title = "Talons", shoes = 6, shoes_text = {0, 1, 2, 3}, costs = 40},
        {title = "Talons", shoes = 7, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Talons", shoes = 8, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Bottes", shoes = 9, shoes_text = {0, 1, 2, 3}, costs = 40},
        {title = "Baskets", shoes = 10, shoes_text = {0, 1, 2, 3}, costs = 40},
        {title = "Baskets", shoes = 11, shoes_text = {0, 1, 2, 3}, costs = 40},
        {title = "Ballerines", shoes = 13, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Talons", shoes = 14, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Sandales", shoes = 15, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Tongues", shoes = 16, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 40},
        {title = "Chaussures de lutin", shoes = 17, shoes_text = {0}, costs = 40},
        {title = "Talons", shoes = 18, shoes_text = {0, 1, 2}, costs = 40},
        {title = "Talons", shoes = 19, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 40},
        {title = "Talons", shoes = 20, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 40},
        {title = "Bottes", shoes = 21, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 40},
        {title = "Talons", shoes = 22, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, costs = 40},
        {title = "Talons", shoes = 23, shoes_text = {0, 1, 2}, costs = 40},
        {title = "Bottes", shoes = 24, shoes_text = {0}, costs = 40},
        {title = "Bottes", shoes = 25, shoes_text = {0}, costs = 40},
        {title = "Bottes", shoes = 26, shoes_text = {0}, costs = 40},
        {title = "Chaussures", shoes = 27, shoes_text = {0}, costs = 40},
        {title = "Chaussures", shoes = 28, shoes_text = {0}, costs = 40},
        {title = "Chaussures de ville", shoes = 29, shoes_text = {0, 1, 2}, costs = 40},
        {title = "Talons", shoes = 30, shoes_text = {0}, costs = 40},
        {title = "Baskets", shoes = 31, shoes_text = {0}, costs = 40},
        {title = "Baskets", shoes = 32, shoes_text = {0, 1, 2, 3, 4}, costs = 40},
        {title = "Converses", shoes = 33, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 40},
        {title = "Bottes", shoes = 36, shoes_text = {0, 1}, costs = 40},
        {title = "Chaussures", shoes = 37, shoes_text = {0, 1, 2, 3}, costs = 40},
        {title = "Bottes", shoes = 38, shoes_text = {0, 1, 2, 3, 4}, costs = 40},
        {title = "Bottes", shoes = 39, shoes_text = {0, 1, 2, 3, 4}, costs = 40},
        {title = "Talons", shoes = 41, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 40},
        {title = "Talons", shoes = 42, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 40},
        {title = "Talons", shoes = 43, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 40},
        {title = "Talons", shoes = 44, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 40},
        {title = "Bottes", shoes = 45, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 40},
        {title = "Chaussures", shoes = 46, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 40},
        {title = "Baskets", shoes = 47, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, costs = 40},
        {title = "Bottes", shoes = 48, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 200},
        {title = "Converses", shoes = 49, shoes_text = {0, 1}, costs = 40},
        {title = "Converses", shoes = 50, shoes_text = {0, 1}, costs = 40},
        {title = "Bottes", shoes = 51, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 40},
        {title = "Bottes", shoes = 53, shoes_text = {0, 1}, costs = 40},
        {title = "Bottes", shoes = 54, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 40},
        {title = "Chaussures", shoes = 55, shoes_text = {0, 1, 2, 3, 4, 5}, costs = 40},
        {title = "Bottes", shoes = 56, shoes_text = {0, 1, 2}, costs = 40},
        {title = "Chaussures", shoes = 57, shoes_text = {0, 1, 2}, costs = 40},
        {title = "Chaussures", shoes = 58, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, costs = 400},
        {title = "Chaussures", shoes = 59, shoes_text = {0, 1}, costs = 40},
        {title = "Chaussures", shoes = 60, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, costs = 40},
        {title = "Chaussures", shoes = 61, shoes_text = {0, 1, 2}, costs = 400},
        {title = "Chaussures", shoes = 62, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, costs = 40},
        {title = "Bottes", shoes = 63, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 40},
        {title = "Chaussures de montagne", shoes = 64, shoes_text = {0, 1, 2, 3, 4, 5, 6 ,7}, costs = 40},
        {title = "Chaussures de montagne", shoes = 65, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 40},
        {title = "Chaussures de montagne", shoes = 66, shoes_text = {0, 1, 2, 3, 4, 5, 6, 7}, costs = 40},
      }
    },
    ["Couleurs"] = {
      title = "Couleurs",
      name = "Couleurs",
      buttons = {
      }
    },
  }
}



local cshop_locations = {
  {entering = {1696.5310058594, 4828.109375, 42.063121795654}, inside = {1696.5310058594, 4828.109375, 42.063121795654}, outside = {1696.5310058594, 4828.109375, 42.063121795654}},
  {entering = {-162.85632324219, -303.03753662109, 39.733276367188}, inside = {-162.85632324219, -303.03753662109, 39.733276367188}, outside = {-162.85632324219, -303.03753662109, 39.733276367188}},
  {entering = {72.531211853027, -1396.3240966797, 29.376146316528}, inside = {72.531211853027, -1396.3240966797, 29.376146316528}, outside = {72.531211853027, -1396.3240966797, 29.376146316528}},
}

local cshop_blips = {}
local inrangeofcshop = false
local currentlocation = nil

function LocalPed()
  return GetPlayerPed(-1)
end

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

function IsPlayerInRangeOfcshop()
  return inrangeofcshop
end

function ShowCshopBlips(bool)
  if bool and #cshop_blips == 0 then
    for station,pos in pairs(cshop_locations) do
      local loc = pos
      pos = pos.entering
      local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
      -- 60 58 137
      SetBlipSprite(blip, 73)
      SetBlipColour(blip, 3)
      SetBlipScale(blip, 0.9)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Magasin de vêtements')
      EndTextCommandSetBlipName(blip)
      SetBlipAsShortRange(blip,true)
      SetBlipAsMissionCreatorBlip(blip,true)
      table.insert(cshop_blips, {blip = blip, pos = loc})
    end
    Citizen.CreateThread(function()
      while #cshop_blips > 0 do
        Citizen.Wait(0)
        local inrange = false
        for i,b in ipairs(cshop_blips) do
          if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and cshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 2 then
            ShowInfoP("Appuyez sur ~INPUT_CONTEXT~ ~w~pour ~b~acheter des habits~w~.", 0)
            currentlocation = b
            inrange = true
          end
        end
        inrangeofcshop = inrange
      end
    end)
  elseif bool == false and #cshop_blips > 0 then
    for i,b in ipairs(cshop_blips) do
      if DoesBlipExist(b.blip) then
        SetBlipAsMissionCreatorBlip(b.blip,false)
        Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
      end
    end
    cshop_blips = {}
  end
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
  ShowCshopBlips(true)
  firstspawn = 1
end
end)


function ShowInfoP(text, state)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function f(n)
	return n + 0.0001
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

--local veh = nil
function OpenCreator()
	cshop.currentmenu = "main"
	cshop.opened = true
	cshop.selectedbutton = 1
end

function CloseCreator()
	Citizen.CreateThread(function()
		cshop.opened = false
	  cshop.menu.from = 1
	  cshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = cshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.title)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = cshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
	local menu = cshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
local menu = cshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuTitleColors(txt,x,y)
  local menu = cshopcolors.menu
  SetTextFont(2)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawRect(x,y,menu.width,menu.height,0,0,0,150)
  DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function DoesPlayerHaveCloth(button,y,selected, source)
	drawMenuRight(button.costs.." $",cshop.menu.x, y, selected)
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if(cshop.opened) then
			FreezeEntityPosition(GetPlayerPed(-1), true)
		else
			FreezeEntityPosition(GetPlayerPed(-1), false)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,38) and IsPlayerInRangeOfcshop() then
		if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			if cshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
	  end
	  if GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
      if cshopf.opened then
        CloseCreatorF()
      else
        OpenCreatorF()
      end
    end
			if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			 Citizen.Trace("HOMME")
			elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
			 Citizen.Trace("FEMME")
			end
		end
		if cshop.opened then
			local ped = LocalPed()
			local menu = cshop.menu[cshop.currentmenu]
			drawTxt(cshop.title,1,1,cshop.menu.x,cshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, cshop.menu.x,cshop.menu.y + 0.08)
			drawTxt(cshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,cshop.menu.x + cshop.menu.width/2 - 0.0385,cshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = cshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= cshop.menu.from and i <= cshop.menu.to then

					if i == cshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,cshop.menu.x,y,selected)
					if button.costs ~= nil then
						DoesPlayerHaveCloth(button,y,selected,ped)
					end
					y = y + 0.04
					if cshop.currentmenu == "Chapeaux" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 0, button.hat, button.hat_text[1], 0)
            end
          end
          if cshop.currentmenu == "Lunettes" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 1, button.glass, button.glass_text[1], 0)
            end
          end
					if cshop.currentmenu == "Hauts" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 8, button.shirt, button.shirt_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
            end
          end
          if cshop.currentmenu == "Cravates" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 7, button.seven, button.seven_text[1], 0)
            end
          end
          if cshop.currentmenu == "Montres" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 6, button.watch, button.watch_text[1], 0)
            end
          end
          if cshop.currentmenu == "Pantalons" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 4, button.pants, button.pants_text[1], 0)
            end
          end
          if cshop.currentmenu == "Chaussures" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 6, button.shoes, button.shoes_text[1], 0)
            end
          end
          if cshop.currentmenu == "Couleurs" then
            if selected then
              if button.type_str == "Haut" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text, 0)
              end
              if button.type_str == "Montre" or "Lunettes" or "Chapeaux" then
                SetPedPropIndex(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
              if button.type_str == "Pantalon" or "Chaussure" or "Cravate" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
            end
          end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if cshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustPressed(1,188) then
				if cshop.selectedbutton > 1 then
					cshop.selectedbutton = cshop.selectedbutton -1
					if buttoncount > 10 and cshop.selectedbutton < cshop.menu.from then
						cshop.menu.from = cshop.menu.from -1
						cshop.menu.to = cshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if cshop.selectedbutton < buttoncount then
					cshop.selectedbutton = cshop.selectedbutton +1
					if buttoncount > 10 and cshop.selectedbutton > cshop.menu.to then
						cshop.menu.to = cshop.menu.to + 1
						cshop.menu.from = cshop.menu.from + 1
					end
				end
			end
    end
	end
end)

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

local Tab = {}

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = cshop.currentmenu
	local btn = button.name
	if this == "main" then
	  if btn == "Chapeaux" then
      OpenMenu('Chapeaux')
    elseif btn == "Lunettes" then
      OpenMenu('Lunettes')
		elseif btn == "Hauts" then
			OpenMenu('Hauts')
		elseif btn == "Cravates" then
			OpenMenu('Cravates')
	  elseif btn == "Montres" then
      OpenMenu('Montres')
		elseif btn == "Pantalons" then
      OpenMenu('Pantalons')
    elseif btn == "Chaussures" then
      OpenMenu('Chaussures')
		end
	elseif this == "Chapeaux" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.hat_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chapeau", type = 0, slot = button.hat, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Lunettes" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.glass_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Lunettes", type = 1, slot = button.glass, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
	elseif this == "Hauts" then
	  cshop.menu.Couleurs.buttons = {}
	  for i, v in ipairs(button.torso_text) do
	   for j, w in ipairs(button.shirt_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i.."-"..j, type_str = "Haut", type = 8, torso = button.torso, torso_text = v, slot = button.shirt, text = w, three = button.three, three_text = button.three_text, costs = button.costs})
     end
    end
    Wait(100)
    OpenMenu('Couleurs')
	elseif this == "Cravates" then
	  cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.seven_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Cravate", type = 7, slot = button.seven, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Montres" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.watch_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Montre", type = 6, slot = button.watch, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Pantalons" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.pants_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Pantalon", type = 4, slot = button.pants, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Chaussures" then
    cshop.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.shoes_text) do
      table.insert(cshop.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chaussure", type = 6, slot = button.shoes, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenu('Couleurs')
  elseif this == "Couleurs" then
    if button.type == 8 then
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text, button.torso, button.torso_text, button.three, button.three_text})
    else
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text})
    end
	end
end

function OpenMenu(menu)
	cshop.lastmenu = cshop.currentmenu
	cshop.menu.from = 1
	cshop.menu.to = 10
	cshop.selectedbutton = 1
	cshop.currentmenu = menu
end

function Back()
  if cshop.currentmenu == "main" then
    CloseCreator()
    TriggerServerEvent("cshop:reloadOutfits_s")
  else
    OpenMenu("main")
    TriggerServerEvent("cshop:reloadOutfits_s")
  end
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

-----------------------------------------------------------------------------------
-----------------------------------------FEMME-------------------------------------
-----------------------------------------------------------------------------------

function drawTxtF(text,font,centre,x,y,scale,r,g,b,a)
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

--local veh = nil
function OpenCreatorF()
  cshopf.currentmenu = "main"
  cshopf.opened = true
  cshopf.selectedbutton = 1
end

function CloseCreatorF()
  Citizen.CreateThread(function()
    cshopf.opened = false
    cshopf.menu.from = 1
    cshopf.menu.to = 10
  end)
end

function drawMenuButtonF(button,x,y,selected)
  local menuf = cshopf.menu
  SetTextFont(menuf.font)
  SetTextProportional(0)
  SetTextScale(menuf.scale, menuf.scale)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(button.title)
  if selected then
    DrawRect(x,y,menuf.width,menuf.height,255,255,255,255)
  else
    DrawRect(x,y,menuf.width,menuf.height,0,0,0,150)
  end
  DrawText(x - menuf.width/2 + 0.005, y - menuf.height/2 + 0.0028)
end

function drawMenuRightF(txt,x,y,selected)
  local menuf = cshopf.menu
  SetTextFont(menuf.font)
  SetTextProportional(0)
  SetTextScale(menuf.scale, menuf.scale)
  SetTextRightJustify(1)
  if selected then
    SetTextColour(0, 0, 0, 255)
  else
    SetTextColour(255, 255, 255, 255)
  end
  SetTextCentre(0)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawText(x + menuf.width/2 - 0.03, y - menuf.height/2 + 0.0028)
end

function drawMenuTitleF(txt,x,y)
local menuf = cshopf.menu
  SetTextFont(2)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawRect(x,y,menuf.width,menuf.height,0,0,0,150)
  DrawText(x - menuf.width/2 + 0.005, y - menuf.height/2 + 0.0028)
end

function DoesPlayerHaveClothF(button,y,selected, source)
  drawMenuRightF(button.costs.." $",cshopf.menu.x, y, selected)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if cshopf.opened then
      local ped = LocalPed()
      local menuf = cshopf.menu[cshopf.currentmenu]
      drawTxtF(cshopf.title,1,1,cshopf.menu.x,cshopf.menu.y,1.0, 255,255,255,255)
      drawMenuTitleF(menuf.title, cshopf.menu.x,cshopf.menu.y + 0.08)
      drawTxtF(cshopf.selectedbutton.."/"..tablelength(menuf.buttons),0,0,cshopf.menu.x + cshopf.menu.width/2 - 0.0385,cshopf.menu.y + 0.067,0.4, 255,255,255,255)
      local y = cshopf.menu.y + 0.12
      buttoncountf = tablelength(menuf.buttons)
      local selectedf = false

      for i,button in pairs(menuf.buttons) do
        if i >= cshopf.menu.from and i <= cshopf.menu.to then

          if i == cshopf.selectedbutton then
            selectedf = true
          else
            selectedf = false
          end
          drawMenuButtonF(button,cshopf.menu.x,y,selectedf)
          if button.costs ~= nil then
            DoesPlayerHaveClothF(button,y,selectedf,ped)
          end
          y = y + 0.04
          if cshopf.currentmenu == "Chapeaux" then
            if selectedf then
                SetPedPropIndex(GetPlayerPed(-1), 0, button.hat, button.hat_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Lunettes" then
            if selectedf then
                SetPedPropIndex(GetPlayerPed(-1), 1, button.glass, button.glass_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Hauts" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 8, button.shirt, button.shirt_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
            end
          end
          if cshopf.currentmenu == "Cravates" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 7, button.seven, button.seven_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Montres" then
            if selectedf then
                SetPedPropIndex(GetPlayerPed(-1), 6, button.watch, button.watch_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Pantalons" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 4, button.pants, button.pants_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Chaussures" then
            if selectedf then
                SetPedComponentVariation(GetPlayerPed(-1), 6, button.shoes, button.shoes_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Couleurs" then
            if selectedf then
             if button.type_str == "Haut" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text, 0)
              end
              if button.type_str == "Montre" or "Lunettes" or "Chapeaux" then
                SetPedPropIndex(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
              if button.type_str == "Pantalon" or "Chaussure" or "Cravate" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
            end
          end
          if selectedf and IsControlJustPressed(1,201) then
            ButtonSelectedF(button)
          end
        end
      end
    end
    if cshopf.opened then
      if IsControlJustPressed(1,202) then
        BackF()
      end
      if IsControlJustPressed(1,188) then
        if cshopf.selectedbutton > 1 then
          cshopf.selectedbutton = cshopf.selectedbutton -1
          if buttoncountf > 10 and cshopf.selectedbutton < cshopf.menu.from then
            cshopf.menu.from = cshopf.menu.from -1
            cshopf.menu.to = cshopf.menu.to - 1
          end
        end
      end
      if IsControlJustPressed(1,187)then
        if cshopf.selectedbutton < buttoncountf then
          cshopf.selectedbutton = cshopf.selectedbutton +1
          if buttoncountf > 10 and cshopf.selectedbutton > cshopf.menu.to then
            cshopf.menu.to = cshopf.menu.to + 1
            cshopf.menu.from = cshopf.menu.from + 1
          end
        end
      end
    end
  end
end)

function ButtonSelectedF(button)
  local pedf = GetPlayerPed(-1)
  local thisf = cshopf.currentmenu
  local btnf = button.name
  if thisf == "main" then
    if btnf == "Chapeaux" then
      OpenMenuF('Chapeaux')
    elseif btnf == "Lunettes" then
      OpenMenuF('Lunettes')
    elseif btnf == "Hauts" then
      OpenMenuF('Hauts')
    elseif btnf == "Cravates" then
      OpenMenuF('Cravates')
    elseif btnf == "Montres" then
      OpenMenuF('Montres')
    elseif btnf == "Pantalons" then
      OpenMenuF('Pantalons')
    elseif btnf == "Chaussures" then
      OpenMenuF('Chaussures')
    end
  elseif thisf == "Chapeaux" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.hat_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chapeau", type = 0, slot = button.hat, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Lunettes" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.glass_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Lunettes", type = 1, slot = button.glass, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Hauts" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.torso_text) do
     for j, w in ipairs(button.shirt_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i.."-"..j, type_str = "Haut", type = 8, torso = button.torso, torso_text = v, slot = button.shirt, text = w, three = button.three, three_text = button.three_text, costs = button.costs})
     end
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Cravates" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.seven_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Cravate", type = 7, slot = button.seven, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Montres" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.watch_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Montre", type = 6, slot = button.watch, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Pantalons" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.pants_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Pantalon", type = 4, slot = button.pants, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Chaussures" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.shoes_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chaussure", type = 6, slot = button.shoes, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif thisf == "Couleurs" then
    if button.type == 8 then
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text, button.torso, button.torso_text, button.three, button.three_text})
    else
      TriggerServerEvent("BuyCloth", {button.type_str, button.costs, button.slot, button.text})
    end
  end
end

function OpenMenuF(menu)
  cshopf.lastmenu = cshopf.currentmenu
  cshopf.menu.from = 1
  cshopf.menu.to = 10
  cshopf.selectedbutton = 1
  cshopf.currentmenu = menu
end

function BackF()
  if cshopf.currentmenu == "main" then
    CloseCreatorF()
    TriggerServerEvent("cshop:reloadOutfits_s")
  else
    OpenMenuF("main")
    TriggerServerEvent("cshop:reloadOutfits_s")
  end
end

RegisterNetEvent("cshop:reloadOutfits")
AddEventHandler("cshop:reloadOutfits", function(pants, pants_text, shoes, shoes_text, torso, torso_text, shirt, shirt_text, three, three_text, seven, seven_text, hat, hat_text, glass, glass_text, watch, watch_text)
  SetPedComponentVariation(GetPlayerPed(-1), 3, three, three_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 7, seven, seven_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 4, pants, pants_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 6, shoes, shoes_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 8, shirt, shirt_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 11, torso, torso_text, 0)
  SetPedPropIndex(GetPlayerPed(-1), 0, hat, hat_text, 0)
  SetPedPropIndex(GetPlayerPed(-1), 1, glass, glass_text, 0)
  --SetPedComponentVariation(GetPlayerPed(-1), 6, watch, watch_text, 0)
end)
