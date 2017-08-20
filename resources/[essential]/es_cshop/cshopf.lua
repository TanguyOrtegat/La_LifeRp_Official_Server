--NOTE: Dans l attente de la suppression des armes à la mort du joueur pour activer les armes du DLC. Si vous voulez ajouter une arme, vous n'avez qu'à enlever les "--" et pour les prix "costs = 'PRIX'"
local cshopf = {
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
        {title = "T-Shirt", torso = 236, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Class Of 98", torso = 235, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40}, 
        {title = "Veste en cuir", torso = 234, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 6, three_text = 0, costs = 40}, 
        {title = "Veste sans manche", torso = 233, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40}, 
        {title = "Veste militaire", torso = 232, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 2, three_text = 0, costs = 40}, 
        {title = "Veste militaire", torso = 231, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 15, three_text = 0, costs = 40}, 
        {title = "Veste militaire", torso = 230, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 2, shirt_text = {0}, three= 15, three_text = 0, costs = 40},  
        {title = "Debardeur militaire", torso = 229, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Manteau", torso = 227, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Manteau", torso = 226, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, shirt = 15, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
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
        {title = "Veste", torso = 194, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 20, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, Alex
        {title = "Blouson", torso = 193, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 1, shirt_text = {0, 1, 2}, three= 1, three_text = 0, costs = 40}, 
        {title = "Pull", torso = 192, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}, shirt = 3, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 191, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 20, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 190, torso_text = {0}, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, shirt = 20, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40}, 
        {title = "Veste", torso = 189, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Veste", torso = 187, torso_text = {0, 1, 2, 3}, shirt = 20, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},
        {title = "Veste", torso = 186, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Smoking", torso = 185, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 59, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40},
        {title = "Hoodie", torso = 184, torso_text = {0, 1}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Veste", torso = 183, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 61, shirt_text = {0, 1, 2, 3}, three= 4, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 182, torso_text = {0, 1, 2}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},  
        {title = "Veste sans manches", torso = 181, torso_text = {0, 1, 2, 3}, shirt = 60, shirt_text = {0, 1, 2}, three= 4, three_text = 0, costs = 40},  
        {title = "Veste sans manches", torso = 179, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 15, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Veste sans manches", torso = 178, torso_text = {0}, shirt = 46, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, three= 15, three_text = 0, costs = 40}, 
        {title = "Veste sans manches", torso = 177, torso_text = {0, 1, 2, 3}, shirt = 46, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, three= 15, three_text = 0, costs = 40}, 
        {title = "Veste en cuir", torso = 176, torso_text = {0, 1, 2, 3}, shirt = 69, shirt_text = {0, 1, 2}, three= 15, three_text = 0, costs = 40}, 
        {title = "Veste sans manches", torso = 175, torso_text = {0, 1, 2, 3}, shirt = 123, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, three= 15, three_text = 0, costs = 40}, 
        {title = "Veste en cuir", torso = 174, torso_text = {0, 1, 2, 3}, shirt = 123, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}, three= 15, three_text = 0, costs = 40}, 
        {title = "Haut", torso = 173, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40}, 
        {title = "Hoodie", torso = 172, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40}, 
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
        {title = "Veste", torso = 144, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 2, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
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
          
        ------------------- PLUS LES BONS NOMS
         
        {title = "Chemise", torso = 118, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 117, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 116, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 115, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 114, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 113, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 112, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 111, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 110, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, shirt = 2, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 109, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 1, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 108, torso_text = {0, 1, 2}, shirt = 21, shirt_text = {0, 1, 2}, three= 6, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 107, torso_text = {0}, shirt = 20, shirt_text = {0, 1, 2}, three= 6, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 106, torso_text = {0, 1, 2, 3}, shirt = 20, shirt_text = {0}, three= 6, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 105, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 2, shirt_text = {0}, three= 15, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 104, torso_text = {0}, shirt = 59, shirt_text = {0, 1, 2}, three= 3, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 103, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 15, shirt_text = {0}, three= 3, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 102, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 3, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 101, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 2, shirt_text = {0}, three= 15, three_text = 0, costs = 40}, 
        {title = "Haut", torso = 99, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 40, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, three= 15, three_text = 0, costs = 40}, 
        {title = "Haut", torso = 98, torso_text = {0, 1, 2, 3, 4}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40}, Bill
        {title = "Haut", torso = 97, torso_text = {0}, shirt = 39, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, three= 6, three_text = 0, costs = 40}, 
        {title = "Haut", torso = 96, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},     
        {title = "Haut", torso = 95, torso_text = {0}, shirt = 39, shirt_text = {8}, three= 5, three_text = 0, costs = 40}, 
        {title = "Haut", torso = 94, torso_text = {0}, shirt = 39, shirt_text = {8}, three= 5, three_text = 0, costs = 40}, 
        {title = "Haut", torso = 93, torso_text = {0, 1, 2, 3}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 6, three_text = 0, costs = 40}, 
        {title = "Haut", torso = 92, torso_text = {0, 1, 2, 3}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 6, three_text = 0, costs = 40},     
        {title = "Haut", torso = 91, torso_text = {0, 1, 2, 3, 4}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 6, three_text = 0, costs = 40},   
        {title = "Haut", torso = 90, torso_text = {0, 1, 2, 3, 4}, shirt = 16, shirt_text = {0, 1, 2, 3, 4, 5, 6}, three= 6, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 89, torso_text = {0, 1}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 88, torso_text = {0, 1}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 87, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 86, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Chemise", torso = 85, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 84, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 83, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 2, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 81, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Chemise", torso = 80, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Chemise", torso = 79, torso_text = {0, 1, 2, 3}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 78, torso_text = {0, 1, 2, 3, 4, 5, 6, 7}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 77, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 76, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Chemise", torso = 75, torso_text = {0, 1, 2, 3}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 74, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 71, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 14, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 70, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 69, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 5, three_text = 0, costs = 40},
        {title = "Chemise", torso = 68, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}, shirt = 14, shirt_text = {0}, three= 14, three_text = 0, costs = 40},
        {title = "Chemise", torso = 67, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 11, three_text = 0, costs = 40},
        {title = "Chemise", torso = 66, torso_text = {0, 1, 2, 3}, shirt = 14, shirt_text = {0}, three= 5, three_text = 0, costs = 40},
        {title = "Chemise", torso = 65, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 14, shirt_text = {0}, three= 6, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 64, torso_text = {0, 1, 2, 3, 4}, shirt = 27, shirt_text = {0, 1, 2}, three= 0, three_text = 0, costs = 40},
        {title = "Chemise", torso = 63, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Chemise", torso = 62, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 0, three_text = 0, costs = 40},
        {title = "Chemise", torso = 58, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, shirt = 39, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 14, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 57, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, shirt = 39, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 14, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 56, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 9, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 55, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 9, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 54, torso_text = {0, 1, 2, 3}, shirt = 9, shirt_text = {0}, three= 9, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 53, torso_text = {0, 1, 2, 3}, shirt = 78, shirt_text = {0, 1, 2, 3, 4, 5}, three= 15, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 52, torso_text = {0, 1, 2, 3}, shirt = 78, shirt_text = {0, 1, 2, 3, 4, 5}, three= 15, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 51, torso_text = {0}, shirt = 78, shirt_text = {0, 1, 2, 3, 4, 5}, three= 15, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 50, torso_text = {0}, shirt = 78, shirt_text = {0, 1, 2, 3, 4, 5}, three= 15, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 49, torso_text = {0, 1}, shirt = 15, shirt_text = {0}, three= 14, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 46, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 45, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 44, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 43, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 42, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 3, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 40, torso_text = {0, 1}, shirt = 14, shirt_text = {0}, three= 2, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 39, torso_text = {0}, shirt = 2, shirt_text = {0}, three= 1, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 38, torso_text = {0, 1, 2, 3}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Chemise", torso = 37, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 36, torso_text = {0, 1, 2, 3, 4}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 35, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 28, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, three= 5, three_text = 0, costs = 40},
        {title = "Chemise", torso = 34, torso_text = {0}, shirt = 11, shirt_text = {0, 1, 2, 10, 15}, three= 6, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 33, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 32, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 4, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 31, torso_text = {0, 1, 2, 3, 4, 5, 6}, shirt = 0, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 30, torso_text = {0, 1, 2}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40},
        {title = "Chemise", torso = 27, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 20, three_text = 0, costs = 40},
        {title = "Chemise", torso = 26, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, shirt = 14, shirt_text = {0}, three= 12, three_text = 0, costs = 40},
        {title = "Chemise", torso = 25, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, shirt = 13, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 6, three_text = 0, costs = 40},
        {title = "Chemise", torso = 24, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 13, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 23, torso_text = {0, 1, 2}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 22, torso_text = {0, 1, 2, 3, 4}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 21, torso_text = {0, 1, 2, 3, 4, 5}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 20, torso_text = {0, 1}, shirt = 21, shirt_text = {0, 1, 2}, three= 5, three_text = 0, costs = 40},
        {title = "Chemise", torso = 19, torso_text = {0, 1, 2, 3}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 18, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 17, torso_text = {0}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 16, torso_text = {0}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 15, torso_text = {0, 3, 10, 11}, shirt = 14, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 14, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 13, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 12, torso_text = {7, 8, 9}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 11, torso_text = {0, 1, 2, 10, 11, 15}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 10, torso_text = {0, 1, 2, 7, 10, 11, 13, 15}, shirt = 59, shirt_text = {0, 1, 2, 3}, three= 15, three_text = 0, costs = 40},
        {title = "Chemise", torso = 9, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, shirt = 14, shirt_text = {0}, three= 9, three_text = 0, costs = 40},
        {title = "Chemise", torso = 8, torso_text = {0, 1, 2}, shirt = 13, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 7, torso_text = {0, 1, 2}, shirt = 13, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Chemise", torso = 6, torso_text = {0, 1, 2}, shirt = 38, shirt_text = {0}, three= 1, three_text = 0, costs = 40},
        {title = "Chemise", torso = 5, torso_text = {0, 1, 7, 9}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 4, torso_text = {13, 14}, shirt = 14, shirt_text = {0}, three= 4, three_text = 0, costs = 40},
        {title = "Chemise", torso = 3, torso_text = {0, 1, 2, 3, 4}, shirt = 2, shirt_text = {0}, three= 3, three_text = 0, costs = 40},
        {title = "Chemise", torso = 2, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 2, shirt_text = {0}, three= 2, three_text = 0, costs = 40}, 
        {title = "Chemise", torso = 1, torso_text = {0, 1, 2, 4, 5, 6, 9, 11, 14}, shirt = 1, shirt_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, three= 5, three_text = 0, costs = 40},
        {title = "Chemise", torso = 0, torso_text = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, shirt = 15, shirt_text = {0}, three= 15, three_text = 0, costs = 40},
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

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
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
  local menu = cshopf.menu
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

function drawMenuRightF(txt,x,y,selected)
  local menu = cshopf.menu
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

function drawMenuTitleF(txt,x,y)
local menu = cshopf.menu
  SetTextFont(2)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawRect(x,y,menu.width,menu.height,0,0,0,150)
  DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuTitleColorsF(txt,x,y)
  local menu = cshopfcolors.menu
  SetTextFont(2)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextEntry("STRING")
  AddTextComponentString(txt)
  DrawRect(x,y,menu.width,menu.height,0,0,0,150)
  DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function DoesPlayerHaveClothF(button,y,selected, source)
  drawMenuRightF(button.costs.." $",cshopf.menu.x, y, selected)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if cshopf.opened then
      local ped = LocalPed()
      local menu = cshopf.menu[cshopf.currentmenu]
      drawTxtF(cshopf.title,1,1,cshopf.menu.x,cshopf.menu.y,1.0, 255,255,255,255)
      drawMenuTitleF(menu.title, cshopf.menu.x,cshopf.menu.y + 0.08)
      drawTxtF(cshopf.selectedbutton.."/"..tablelength(menu.buttons),0,0,cshopf.menu.x + cshopf.menu.width/2 - 0.0385,cshopf.menu.y + 0.067,0.4, 255,255,255,255)
      local y = cshopf.menu.y + 0.12
      buttoncount = tablelength(menu.buttons)
      local selected = false

      for i,button in pairs(menu.buttons) do
        if i >= cshopf.menu.from and i <= cshopf.menu.to then

          if i == cshopf.selectedbutton then
            selected = true
          else
            selected = false
          end
          drawMenuButtonF(button,cshopf.menu.x,y,selected)
          if button.costs ~= nil then
            DoesPlayerHaveClothF(button,y,selected,ped)
          end
          y = y + 0.04
          if cshopf.currentmenu == "Chapeaux" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 0, button.hat, button.hat_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Lunettes" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 1, button.glass, button.glass_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Hauts" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 8, button.shirt, button.shirt_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text[1], 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
            end
          end
          if cshopf.currentmenu == "Cravates" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 7, button.seven, button.seven_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Montres" then
            if selected then
                SetPedPropIndex(GetPlayerPed(-1), 6, button.watch, button.watch_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Pantalons" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 4, button.pants, button.pants_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Chaussures" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 6, button.shoes, button.shoes_text[1], 0)
            end
          end
          if cshopf.currentmenu == "Couleurs" then
            if selected then
              if button.type_str == "Haut" then
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, button.three, button.three_text, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, button.torso, button.torso_text, 0)
              elseif button.type_str == "Montre" or "Lunettes" or "Chapeaux" then
                SetPedPropIndex(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              else
                SetPedComponentVariation(GetPlayerPed(-1), button.type, button.slot, button.text, 0)
              end
            end
          end
          if selected and IsControlJustPressed(1,201) then
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
          if buttoncount > 10 and cshopf.selectedbutton < cshopf.menu.from then
            cshopf.menu.from = cshopf.menu.from -1
            cshopf.menu.to = cshopf.menu.to - 1
          end
        end
      end
      if IsControlJustPressed(1,187)then
        if cshopf.selectedbutton < buttoncount then
          cshopf.selectedbutton = cshopf.selectedbutton +1
          if buttoncount > 10 and cshopf.selectedbutton > cshopf.menu.to then
            cshopf.menu.to = cshopf.menu.to + 1
            cshopf.menu.from = cshopf.menu.from + 1
          end
        end
      end
    end
  end
end)

function ButtonSelectedF(button)
  local ped = GetPlayerPed(-1)
  local this = cshopf.currentmenu
  local btn = button.name
  if this == "main" then
    if btn == "Chapeaux" then
      OpenMenuF('Chapeaux')
    elseif btn == "Lunettes" then
      OpenMenuF('Lunettes')
    elseif btn == "Hauts" then
      OpenMenuF('Hauts')
    elseif btn == "Cravates" then
      OpenMenuF('Cravates')
    elseif btn == "Montres" then
      OpenMenuF('Montres')
    elseif btn == "Pantalons" then
      OpenMenuF('Pantalons')
    elseif btn == "Chaussures" then
      OpenMenuF('Chaussures')
    end
  elseif this == "Chapeaux" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.hat_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chapeau", type = 0, slot = button.hat, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif this == "Lunettes" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.glass_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Lunettes", type = 1, slot = button.glass, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif this == "Hauts" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.torso_text) do
     for j, w in ipairs(button.shirt_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i.."-"..j, type_str = "Haut", type = 8, torso = button.torso, torso_text = v, slot = button.shirt, text = w, three = button.three, three_text = button.three_text, costs = button.costs})
     end
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif this == "Cravates" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.seven_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Cravate", type = 7, slot = button.seven, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif this == "Montres" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.watch_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Montre", type = 6, slot = button.watch, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif this == "Pantalons" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.pants_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Pantalon", type = 4, slot = button.pants, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif this == "Chaussures" then
    cshopf.menu.Couleurs.buttons = {}
    for i, v in ipairs(button.shoes_text) do
      table.insert(cshopf.menu.Couleurs.buttons, {title = "Couleur "..i, type_str = "Chaussure", type = 6, slot = button.shoes, text = v, costs = button.costs})
    end
    Wait(100)
    OpenMenuF('Couleurs')
  elseif this == "Couleurs" then
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
    TriggerEvent("cshopf:reloadOutfits_f")
  else
    OpenMenuF("main")
    TriggerEvent("cshopf:reloadOutfits_f")
  end
end

RegisterNetEvent("cshop:OpenCreatorF")
AddEventHandler("cshop:OpenCreatorF", function()
  if cshopf.opened then
    CloseCreatorF()
  else
    Citizen.Trace("SUUUR")
    OpenCreatorF()
  end
end)

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
