local maskshop = {
  opened = false,
  title = "Masques",
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
        {title = "Animaux", name = "Animaux", description = ""},
        {title = "Horreur", name = "Horreur", description = ""},
        {title = "Hockey", name = "Hockey", description = ""},
        {title = "Normal", name = "Normal", description = ""},
        {title = "Noël", name = "Noel", description = ""},
        {title = "Cartoon", name = "Cartoon", description = ""},
        {title = "Armée", name = "Armee", description = ""},
        {title = "Cagoule", name = "Cagoule", description = ""},
        {title = "Sac troué", name = "Sac", description = ""},
        {title = "Foulard", name = "Foulard", description = ""},
        {title = "Autre", name = "Autre", description = ""},
      }
    },
    ["Animaux"] = {
      title = "Animaux",
      name = "Animaux",
      buttons = {
        {title = "Cochon rose", mask = 1, mask_text = 0 , costs = 500},
        {title = "Cochon marron", mask = 1, mask_text = 1 , costs = 500},
        {title = "Cochon beige", mask = 1, mask_text = 2 , costs = 530},
        {title = "Cochon noir", mask = 1, mask_text = 3 , costs = 500},
        {title = "Singe avec un cigar", mask = 3, mask_text = 0 , costs = 600},
        {title = "Singe marron", mask = 5, mask_text = 0 , costs = 500},
        {title = "Singe noir", mask = 5, mask_text = 1 , costs = 500},
        {title = "Singe vert", mask = 5, mask_text = 2 , costs = 530},
        {title = "Singe blanc", mask = 5, mask_text = 3 , costs = 500},
        {title = "Renne", mask = 9, mask_text = 0 , costs = 500},
        {title = "Chat gris", mask = 17, mask_text = 0 , costs = 500},
        {title = "Chat marron", mask = 17, mask_text = 1 , costs = 500},
        {title = "Chat roux", mask = 18, mask_text = 0 , costs = 500},
        {title = "Chat marron", mask = 18, mask_text = 1 , costs = 500},
        {title = "Hiboux roux", mask = 19, mask_text = 0 , costs = 500},
        {title = "Hiboux blanc", mask = 19, mask_text = 1 , costs = 500},
        {title = "Raton laveur gris", mask = 20, mask_text = 0 , costs = 500},
        {title = "Raton laveur gris brun", mask = 20, mask_text = 1 , costs = 500},
        {title = "Ours marron", mask = 21, mask_text = 0 , costs = 1000},
        {title = "Ours blanc", mask = 21, mask_text = 1 , costs = 1000},
        {title = "Buffle marron", mask = 22, mask_text = 0 , costs = 1000},
        {title = "Buffle roux", mask = 22, mask_text = 1 , costs = 1000},
        {title = "Taureau noir", mask = 23, mask_text = 0 , costs = 1000},
        {title = "Taureau marron", mask = 23, mask_text = 1 , costs = 1000},
        {title = "Aigle marron", mask = 24, mask_text = 0 , costs = 1000},
        {title = "Aigle blanc", mask = 24, mask_text = 1 , costs = 1000},
        {title = "Dindon rouge", mask = 25, mask_text = 0 , costs = 1000},
        {title = "Dindon noir", mask = 25, mask_text = 1 , costs = 1000},
        {title = "Loup beige", mask = 26, mask_text = 0 , costs = 1000},
        {title = "Loup noir", mask = 26, mask_text = 1 , costs = 1000},
        {title = "Loup garrou 1", mask = 59, mask_text = 0 , costs = 1000},
        {title = "Loup garrou 2", mask = 65, mask_text = 0 , costs = 1000},
        {title = "Loup garrou 3", mask = 65, mask_text = 1 , costs = 1000},
        {title = "Loup garrou 4", mask = 65, mask_text = 2 , costs = 1000},
        {title = "Loup garrou 5", mask = 79, mask_text = 0 , costs = 1000},
        {title = "Loup garrou 6", mask = 79, mask_text = 1 , costs = 1000},
        {title = "Loup garrou 7", mask = 79, mask_text = 2 , costs = 1000},
        {title = "Loup garrou Casquette 1", mask = 80, mask_text = 0 , costs = 1050},
        {title = "Loup garrou Casquette 2", mask = 80, mask_text = 1 , costs = 1050},
        {title = "Loup garrou Casquette 3", mask = 80, mask_text = 2 , costs = 1050},
        {title = "Loup garrou Casquette 4", mask = 81, mask_text = 0 , costs = 1050},
        {title = "Loup garrou Casquette 5", mask = 81, mask_text = 1 , costs = 1050},
        {title = "Loup garrou Casquette 6", mask = 81, mask_text = 2 , costs = 1050},
        {title = "Loup garrou Bandeau 1", mask = 82, mask_text = 0 , costs = 1050},
        {title = "Loup garrou Bandeau 2", mask = 82, mask_text = 1 , costs = 1050},
        {title = "Loup garrou Bandeau 3", mask = 82, mask_text = 2 , costs = 1050},
        {title = "Insecte vert", mask = 66, mask_text = 0 , costs = 1000},
        {title = "Insecte rouge", mask = 66, mask_text = 1 , costs = 1000},
        {title = "Insecte rose", mask = 66, mask_text = 2 , costs = 1000},
        {title = "Yeti", mask = 84, mask_text = 0 , costs = 1000},
        {title = "Dino 1", mask = 93, mask_text = 0 , costs = 5500},
        {title = "Dino 2", mask = 93, mask_text = 1 , costs = 5500},
        {title = "Dino 3", mask = 93, mask_text = 2 , costs = 5500},
        {title = "Dino 4", mask = 93, mask_text = 3 , costs = 5500},
        {title = "Dino 5", mask = 93, mask_text = 4 , costs = 5500},
        {title = "Dino 6", mask = 93, mask_text = 5, costs = 5500},
        {title = "Singe 1", mask = 96, mask_text = 0 , costs = 1000},
        {title = "Singe 2", mask = 96, mask_text = 1 , costs = 1000},
        {title = "Singe 3", mask = 96, mask_text = 2 , costs = 1000},
        {title = "Singe 4", mask = 96, mask_text = 3 , costs = 1000},
        {title = "Cheval 1", mask = 97, mask_text = 0 , costs = 2500},
        {title = "Cheval 2", mask = 97, mask_text = 1 , costs = 2500},
        {title = "Cheval 3", mask = 97, mask_text = 2 , costs = 2500},
        {title = "Cheval 4", mask = 97, mask_text = 3 , costs = 2500},
        {title = "Cheval 4", mask = 97, mask_text = 4 , costs = 2500},
        {title = "Zèbre", mask = 97, mask_text = 5 , costs = 2500},
        {title = "Licorne", mask = 98, mask_text = 5 , costs = 10000},
        {title = "Chien 1", mask = 100, mask_text = 0 , costs = 1000},
        {title = "Chien 2", mask = 100, mask_text = 1 , costs = 1000},
        {title = "Chien 3", mask = 100, mask_text = 2 , costs = 1000},
        {title = "Chien 4", mask = 100, mask_text = 3 , costs = 1000},
        {title = "Chien 5", mask = 100, mask_text = 4 , costs = 1000},
        {title = "Chien 6", mask = 100, mask_text = 5 , costs = 1000},
      }
    },
    ["Horreur"] = {
      title = "Horreur",
      name = "Horreur",
      buttons = {
        {title = "Tête de mort grise", mask = 2, mask_text = 0 , costs = 600},
        {title = "Tête de mort marron", mask = 2, mask_text = 1 , costs = 600},
        {title = "Tête de mort beige", mask = 2, mask_text = 2 , costs = 600},
        {title = "Tête de mort noire", mask = 2, mask_text = 3 , costs = 600},
        {title = "Monstre beige", mask = 7, mask_text = 0 , costs = 700},
        {title = "Monstre rouge", mask = 7, mask_text = 1 , costs = 700},
        {title = "Monstre noir", mask = 7, mask_text = 2 , costs = 700},
        {title = "Monstre gris", mask = 7, mask_text = 3 , costs = 700},
        {title = "Monstre bleu", mask = 41, mask_text = 0 , costs = 850},
        {title = "Monstre blanc", mask = 41, mask_text = 1 , costs = 850},
        {title = "Masque tête de mort noir", mask = 29, mask_text = 0 , costs = 850},
        {title = "Masque tête de mort gris", mask = 29, mask_text = 1 , costs = 850},
        {title = "Masque tête de mort gris foncé", mask = 29, mask_text = 2 , costs = 850},
        {title = "Masque tête de mort beige", mask = 29, mask_text = 3 , costs = 850},
        {title = "Masque tête de mort vert", mask = 29, mask_text = 4 , costs = 850},
        {title = "Masque zombie blanc", mask = 39, mask_text = 0 , costs = 850},
        {title = "Masque zombie guerre 1", mask = 103, mask_text = 0 , costs = 1050},
        {title = "Masque zombie guerre 2", mask = 103, mask_text = 1 , costs = 1050},
        {title = "Masque zombie guerre 3", mask = 103, mask_text = 2 , costs = 1050},
        {title = "Masque zombie guerre 4", mask = 103, mask_text = 3 , costs = 1050},
        {title = "Masque zombie guerre 5", mask = 103, mask_text = 4 , costs = 1050},
        {title = "Masque zombie guerre 6", mask = 103, mask_text = 5 , costs = 1050},
        {title = "Masque zombie guerre 7", mask = 103, mask_text = 6 , costs = 1050},
        {title = "Masque zombie guerre 8", mask = 103, mask_text = 7 , costs = 1050},
        {title = "Masque zombie guerre 9", mask = 103, mask_text = 8 , costs = 1050},
        {title = "Masque zombie guerre 10", mask = 103, mask_text = 9 , costs = 1050},
        {title = "Masque zombie guerre 11", mask = 103, mask_text = 10 , costs = 1050},
        {title = "Masque zombie guerre 12", mask = 103, mask_text = 11 , costs = 1050},
        {title = "Masque zombie guerre 13", mask = 103, mask_text = 12 , costs = 1050},
        {title = "Masque zombie guerre 14", mask = 103, mask_text = 13 , costs = 1050},
        {title = "Masque zombie guerre 15", mask = 103, mask_text = 14 , costs = 1050},
        {title = "Masque zombie guerre 16", mask = 103, mask_text = 15 , costs = 1050},
        {title = "Masque zombie guerre 17", mask = 103, mask_text = 16 , costs = 1050},
        {title = "Masque zombie guerre 18", mask = 103, mask_text = 17 , costs = 1050},
        {title = "Masque zombie guerre 19", mask = 103, mask_text = 18 , costs = 1050},
        {title = "Masque zombie guerre 20", mask = 103, mask_text = 19 , costs = 1050},
        {title = "Masque zombie guerre 21", mask = 103, mask_text = 20 , costs = 1050},
        {title = "Masque zombie guerre 22", mask = 103, mask_text = 21 , costs = 1050},
        {title = "Masque zombie guerre 23", mask = 103, mask_text = 22 , costs = 1050},
        {title = "Masque zombie guerre 24", mask = 103, mask_text = 23 , costs = 1050},
        {title = "Masque zombie guerre 25", mask = 103, mask_text = 24 , costs = 1050},
        {title = "Masque zombie guerre 26", mask = 103, mask_text = 25 , costs = 1050},
        {title = "Masque zombie noir", mask = 39, mask_text = 1 , costs = 850},
        {title = "Masque momie blanche", mask = 39, mask_text = 0 , costs = 850},
        {title = "Masque momie verte", mask = 39, mask_text = 1 , costs = 850},
        {title = "Masque frankenstein", mask = 42, mask_text = 0 , costs = 850},
        {title = "Masque frankenstein", mask = 42, mask_text = 1 , costs = 850},
        {title = "Citrouille", mask = 60, mask_text = 0 , costs = 700},
        {title = "Citrouille 2", mask = 60, mask_text = 1 , costs = 700},
        {title = "Pasteque", mask = 60, mask_text = 2 , costs = 700},
        {title = "Monstre beige", mask = 61, mask_text = 0 , costs = 700},
        {title = "Monstre blanc", mask = 61, mask_text = 1 , costs = 700},
        {title = "Monstre vert", mask = 61, mask_text = 2 , costs = 700},
        {title = "Monstre cramé 1", mask = 62, mask_text = 0 , costs = 700},
        {title = "Monstre cramé 2", mask = 62, mask_text = 1 , costs = 700},
        {title = "Monstre cramé 3", mask = 62, mask_text = 2 , costs = 700},
        {title = "Humain muscles", mask = 63, mask_text = 0 , costs = 700},
        {title = "Humain morve", mask = 63, mask_text = 1 , costs = 700},
        {title = "Humain muscles gris", mask = 63, mask_text = 2 , costs = 700},
        {title = "Tête qui sort 1", mask = 64, mask_text = 0 , costs = 1150},
        {title = "Tête qui sort 2", mask = 64, mask_text = 1 , costs = 1150},
        {title = "Tête qui sort 3", mask = 64, mask_text = 2 , costs = 1150},
        {title = "Monstre 1", mask = 67, mask_text = 0 , costs = 1000},
        {title = "Monstre 2", mask = 67, mask_text = 1 , costs = 1000},
        {title = "Monstre 3", mask = 67, mask_text = 2 , costs = 1000},
        {title = "Diable rouge", mask = 68, mask_text = 0 , costs = 666},
        {title = "Diable orange", mask = 68, mask_text = 1 , costs = 666},
        {title = "Diable noir", mask = 68, mask_text = 2 , costs = 666},
        {title = "Diable rouge V2", mask = 72, mask_text = 0 , costs = 666},
        {title = "Diable orange V2", mask = 72, mask_text = 1 , costs = 666},
        {title = "Diable noir V2", mask = 72, mask_text = 2 , costs = 666},
        {title = "Diable punk 1", mask = 94, mask_text = 0 , costs = 6666},
        {title = "Diable punk 2", mask = 94, mask_text = 1 , costs = 6666},
        {title = "Diable punk 3", mask = 94, mask_text = 2 , costs = 6666},
        {title = "Diable punk 4", mask = 94, mask_text = 3 , costs = 6666},
        {title = "Diable punk 5", mask = 94, mask_text = 4 , costs = 6666},
        {title = "Diable punk 6", mask = 94, mask_text = 5 , costs = 6666},
        {title = "Cagoule horreur 1", mask = 69, mask_text = 0 , costs = 1000},
        {title = "Cagoule horreur 2", mask = 69, mask_text = 1 , costs = 1000},
        {title = "Cagoule horreur 3", mask = 69, mask_text = 2 , costs = 1000},
        {title = "Bonhomme horreur 1", mask = 70, mask_text = 0 , costs = 1000},
        {title = "Bonhomme horreur 2", mask = 70, mask_text = 1 , costs = 1000},
        {title = "Bonhomme horreur 3", mask = 70, mask_text = 2 , costs = 1000},
        {title = "Monstre horreur 1", mask = 71, mask_text = 0 , costs = 1000},
        {title = "Monstre horreur 2", mask = 71, mask_text = 1 , costs = 1000},
        {title = "Monstre horreur 3", mask = 71, mask_text = 2 , costs = 1000},
        {title = "Monstre horreur 4", mask = 92, mask_text = 0 , costs = 5500},
        {title = "Monstre horreur 5", mask = 92, mask_text = 1 , costs = 5500},
        {title = "Monstre horreur 6", mask = 92, mask_text = 2 , costs = 5500},
        {title = "Monstre horreur 7", mask = 92, mask_text = 3 , costs = 5500},
        {title = "Monstre horreur 8", mask = 92, mask_text = 4 , costs = 5500},
        {title = "Monstre horreur 9", mask = 92, mask_text = 5 , costs = 5500},
        {title = "Clown 1", mask = 95, mask_text = 0 , costs = 1350},
        {title = "Clown 2", mask = 95, mask_text = 1 , costs = 1350},
        {title = "Clown 3", mask = 95, mask_text = 2 , costs = 1350},
        {title = "Clown 4", mask = 95, mask_text = 3 , costs = 1350},
        {title = "Clown 5", mask = 95, mask_text = 4 , costs = 1350},
        {title = "Clown 6", mask = 95, mask_text = 5 , costs = 1350},
        {title = "Clown 5", mask = 95, mask_text = 6 , costs = 1350},
        {title = "Clown 6", mask = 95, mask_text = 7 , costs = 1350},
        {title = "Crane 1", mask = 99, mask_text = 0 , costs = 600},
        {title = "Crane 2", mask = 99, mask_text = 1 , costs = 600},
        {title = "Crane 3", mask = 99, mask_text = 2 , costs = 600},
        {title = "Crane 4", mask = 99, mask_text = 3 , costs = 600},
        {title = "Crane 5", mask = 99, mask_text = 4 , costs = 600},
        {title = "Crane 6", mask = 99, mask_text = 5 , costs = 600},
      }
    },
    ["Hockey"] = {
      title = "Hockey",
      name = "Hockey",
      buttons = {
        {title = "Casque de hockey blanc", mask = 4, mask_text = 0 , costs = 450},
        {title = "Casque de hockey rouge", mask = 4, mask_text = 1 , costs = 450},
        {title = "Casque de hockey noir et rouge", mask = 4, mask_text = 2 , costs = 450},
        {title = "Casque de hockey blanc et rouge", mask = 4, mask_text = 3 , costs = 450},
        {title = "Casque de hockey bleu", mask = 14, mask_text = 0 , costs = 450},
        {title = "Casque de hockey vinewood", mask = 14, mask_text = 1 , costs = 450},
        {title = "Casque de hockey motifs", mask = 14, mask_text = 2 , costs = 450},
        {title = "Casque de hockey animal 1", mask = 14, mask_text = 3 , costs = 450},
        {title = "Casque de hockey animal 2", mask = 14, mask_text = 4 , costs = 450},
        {title = "Casque de hockey animal 3", mask = 14, mask_text = 5 , costs = 450},
        {title = "Casque de hockey animal 4", mask = 14, mask_text = 6 , costs = 450},
        {title = "Casque de hockey blanc gris et rouge", mask = 14, mask_text = 7 , costs = 450},
        {title = "Casque de hockey blanc gris et jaune", mask = 14, mask_text = 8 , costs = 450},
        {title = "Casque de hockey courge et courrone", mask = 14, mask_text = 9 , costs = 450},
        {title = "Casque de hockey marron", mask = 14, mask_text = 10 , costs = 450},
        {title = "Casque de hockey jaune", mask = 14, mask_text = 11 , costs = 450},
        {title = "Casque de hockey bleu et jaune", mask = 14, mask_text = 12 , costs = 450},
        {title = "Casque de hockey flamme rouge", mask = 14, mask_text = 13 , costs = 450},
        {title = "Casque de hockey flamme verte", mask = 14, mask_text = 14 , costs = 450},
        {title = "Casque de hockey flamme bleu", mask = 14, mask_text = 15 , costs = 450},
        {title = "Casque de hockey jaune", mask = 14, mask_text = 11 , costs = 450},
        {title = "Casque de hockey tête de mort", mask = 15, mask_text = 0 , costs = 450},
        {title = "Casque de hockey marron 2", mask = 15, mask_text = 1 , costs = 450},
        {title = "Casque de hockey beige", mask = 15, mask_text = 2 , costs = 450},
        {title = "Casque de hockey blanc gris et jaune 2", mask = 15, mask_text = 3 , costs = 450},
        {title = "Casque de hockey jaune et rouge", mask = 30, mask_text = 0 , costs = 450},
        {title = "Casque de hockey V2 Gris", mask = 16, mask_text = 0 , costs = 450},
        {title = "Casque de hockey V2 Vert", mask = 16, mask_text = 1 , costs = 450},
        {title = "Casque de hockey V2 Orange et marron", mask = 16, mask_text = 2 , costs = 450},
        {title = "Casque de hockey V2 Rose", mask = 16, mask_text = 3 , costs = 450},
        {title = "Casque de hockey V2 Noir", mask = 16, mask_text = 4 , costs = 450},
        {title = "Casque de hockey V2 Orange et noir", mask = 16, mask_text = 5 , costs = 450},
        {title = "Casque de hockey V2 Blanc", mask = 16, mask_text = 6 , costs = 450},
        {title = "Casque de hockey V2 Éclair", mask = 16, mask_text = 7 , costs = 450},
        {title = "Casque de hockey V2 Bois", mask = 16, mask_text = 8 , costs = 450},
      }
    },
    ["Normal"] = {
      title = "Normal",
      name = "Normal",
      buttons = {
        {title = "Masque avec des motifs 1", mask = 6, mask_text = 0 , costs = 450},
        {title = "Masque avec des motifs 2", mask = 6, mask_text = 1 , costs = 450},
        {title = "Masque avec des motifs 3", mask = 6, mask_text = 2 , costs = 450},
        {title = "Masque avec des motifs 4", mask = 6, mask_text = 3 , costs = 450},
        {title = "Masque carnaval blanc", mask = 11, mask_text = 0 , costs = 300},
        {title = "Masque carnaval rouge", mask = 11, mask_text = 1 , costs = 300},
        {title = "Masque carnaval noir", mask = 11, mask_text = 2 , costs = 300},
        {title = "Masque carnaval long nez beige", mask = 12, mask_text = 0 , costs = 320},
        {title = "Masque carnaval long nez blanc", mask = 12, mask_text = 1 , costs = 320},
        {title = "Masque carnaval long nez noir", mask = 12, mask_text = 2 , costs = 320},
        {title = "Masque théâtre 1", mask = 50, mask_text = 0 , costs = 450},
        {title = "Masque théâtre 2", mask = 50, mask_text = 1 , costs = 450},
        {title = "Masque théâtre 3", mask = 50, mask_text = 2 , costs = 450},
        {title = "Masque théâtre 4", mask = 50, mask_text = 3 , costs = 450},
        {title = "Masque théâtre 5", mask = 50, mask_text = 4 , costs = 450},
        {title = "Masque théâtre 6", mask = 50, mask_text = 5 , costs = 450},
        {title = "Masque théâtre 7", mask = 50, mask_text = 6 , costs = 450},
        {title = "Masque théâtre 8", mask = 50, mask_text = 7 , costs = 450},
        {title = "Masque théâtre 9", mask = 50, mask_text = 8 , costs = 450},
        {title = "Masque théâtre 10", mask = 50, mask_text = 9 , costs = 450},
        {title = "Masque peinture 1", mask = 102, mask_text = 0 , costs = 3000},
        {title = "Masque peinture 2", mask = 102, mask_text = 1 , costs = 3000},
        {title = "Masque peinture 3", mask = 102, mask_text = 2 , costs = 3000},
        {title = "Masque 1", mask = 105, mask_text = 0 , costs = 500},
        {title = "Masque 2", mask = 105, mask_text = 1 , costs = 500},
        {title = "Masque 3", mask = 105, mask_text = 2 , costs = 500},
        {title = "Masque 4", mask = 105, mask_text = 3 , costs = 500},
        {title = "Masque 5", mask = 105, mask_text = 4 , costs = 500},
        {title = "Masque 6", mask = 105, mask_text = 5 , costs = 500},
        {title = "Masque 7", mask = 105, mask_text = 6 , costs = 500},
        {title = "Masque 8", mask = 105, mask_text = 7 , costs = 500},
        {title = "Masque 9", mask = 105, mask_text = 8 , costs = 500},
        {title = "Masque 10", mask = 105, mask_text = 9 , costs = 500},
        {title = "Masque 11", mask = 105, mask_text = 10 , costs = 500},
        {title = "Masque 12", mask = 105, mask_text = 11 , costs = 500},
        {title = "Masque 13", mask = 105, mask_text = 12 , costs = 500},
        {title = "Masque 14", mask = 105, mask_text = 13 , costs = 500},
        {title = "Masque 15", mask = 105, mask_text = 14 , costs = 500},
        {title = "Masque 16", mask = 105, mask_text = 15 , costs = 500},
        {title = "Masque 17", mask = 105, mask_text = 16 , costs = 500},
        {title = "Masque 18", mask = 105, mask_text = 17 , costs = 500},
        {title = "Masque 19", mask = 105, mask_text = 18 , costs = 500},
        {title = "Masque 20", mask = 105, mask_text = 19 , costs = 500},
        {title = "Masque 21", mask = 105, mask_text = 20 , costs = 500},
        {title = "Masque 22", mask = 105, mask_text = 21 , costs = 500},
        {title = "Masque 23", mask = 105, mask_text = 22 , costs = 500},
        {title = "Masque 24", mask = 105, mask_text = 23 , costs = 500},
      }
    },
    ["Noel"] = {
      title = "Noel",
      name = "Noel",
      buttons = {
        {title = "Père-noël blanc", mask = 8, mask_text = 0 , costs = 1050},
        {title = "Père-noël noir", mask = 8, mask_text = 1 , costs = 1050},
        {title = "Père-noël beige", mask = 8, mask_text = 2 , costs = 1050},
        {title = "Père-noël fatigué blanc", mask = 76, mask_text = 0 , costs = 1050},
        {title = "Père-noël fatigué noir", mask = 76, mask_text = 1 , costs = 1050},
        {title = "Père-noël fatigué beige", mask = 76, mask_text = 2 , costs = 1050},
        {title = "Bonhomme de neige", mask = 10, mask_text = 0 , costs = 750},
        {title = "Bonhomme en pain d'épice 1", mask = 33, mask_text = 0 , costs = 750},
        {title = "Bonhomme en pain d'épice 2", mask = 74, mask_text = 0 , costs = 750},
        {title = "Bonhomme en pain d'épice 3", mask = 74, mask_text = 1 , costs = 750},
        {title = "Bonhomme en pain d'épice 4", mask = 74, mask_text = 2 , costs = 750},
        {title = "Bonhomme en pain d'épice 5", mask = 75, mask_text = 0 , costs = 750},
        {title = "Bonhomme en pain d'épice 6", mask = 75, mask_text = 1 , costs = 750},
        {title = "Bonhomme en pain d'épice 7", mask = 75, mask_text = 2 , costs = 750},
        {title = "Lutin blanc", mask = 34, mask_text = 0 , costs = 1050},
        {title = "Lutin noir", mask = 34, mask_text = 1 , costs = 1050},
        {title = "Lutin beige", mask = 34, mask_text = 2 , costs = 1050},
        {title = "Lutin thug blanc", mask = 87, mask_text = 0 , costs = 1050},
        {title = "Lutin thug noir", mask = 87, mask_text = 1 , costs = 1050},
        {title = "Lutin thug beige", mask = 87, mask_text = 2 , costs = 1050},
        {title = "Sapin vert", mask = 77, mask_text = 0 , costs = 750},
        {title = "Sapin vert foncé", mask = 77, mask_text = 1 , costs = 750},
        {title = "Sapin noir", mask = 77, mask_text = 2 , costs = 750},
        {title = "Sapin blanc", mask = 77, mask_text = 3 , costs = 750},
        {title = "Sapin rouge", mask = 77, mask_text = 4 , costs = 750},
        {title = "Sapin violet", mask = 77, mask_text = 5 , costs = 750},
        {title = "Masque de noël 1", mask = 78, mask_text = 0 , costs = 750},
        {title = "Masque de noël 2", mask = 78, mask_text = 1 , costs = 750},
        {title = "Loup garrou Nöel 1", mask = 83, mask_text = 0 , costs = 1050},
        {title = "Loup garrou Nöel 2", mask = 83, mask_text = 1 , costs = 1050},
        {title = "Loup garrou Nöel 3", mask = 83, mask_text = 2 , costs = 1050},
        {title = "Loup garrou Nöel 4", mask = 83, mask_text = 3 , costs = 1050},
        {title = "Pingouin de noël", mask = 31, mask_text = 0 , costs = 750},
        {title = "Poulet", mask = 85, mask_text = 0 , costs = 750},
        {title = "Poulet roti", mask = 85, mask_text = 1 , costs = 750},
        {title = "Poulet cramé", mask = 85, mask_text = 2 , costs = 750},
        {title = "Mamie nöel défoncée blanche", mask = 86, mask_text = 0 , costs = 1000},
        {title = "Mamie nöel défoncée noire", mask = 86, mask_text = 1 , costs = 1000},
        {title = "Mamie nöel défoncée marron", mask = 86, mask_text = 2 , costs = 1000},
        {title = "Mamie nöel blanche", mask = 88, mask_text = 0 , costs = 1000},
        {title = "Mamie nöel noire", mask = 88, mask_text = 1 , costs = 1000},
        {title = "Mamie nöel marron", mask = 88, mask_text = 2 , costs = 1000},
      }
    },
    ["Cartoon"] = {
      title = "Cartoon",
      name = "Cartoon",
      buttons = {
        {title = "Homme blond", mask = 13, mask_text = 0 , costs = 1050},
        {title = "Super héros", mask = 43, mask_text = 0 , costs = 1050},
        {title = "Masque manga", mask = 44, mask_text = 0 , costs = 1050},
        {title = "Inspecteur", mask = 45, mask_text = 0 , costs = 1050},
      }
    },
    ["Armee"] = {
      title = "Armee",
      name = "Armee",
      buttons = {
        {title = "Masque tête de mort 1", mask = 108, mask_text = 0 , costs = 1250},
        {title = "Masque tête de mort 2", mask = 108, mask_text = 1 , costs = 1250},
        {title = "Masque tête de mort 3", mask = 108, mask_text = 2 , costs = 1250},
        {title = "Masque tête de mort 4", mask = 108, mask_text = 3 , costs = 1250},
        {title = "Masque tête de mort 5", mask = 108, mask_text = 4 , costs = 1250},
        {title = "Masque tête de mort 6", mask = 108, mask_text = 5 , costs = 1250},
        {title = "Masque tête de mort 7", mask = 108, mask_text = 6 , costs = 1250},
        {title = "Masque tête de mort 8", mask = 108, mask_text = 7 , costs = 1250},
        {title = "Masque tête de mort 9", mask = 108, mask_text = 8 , costs = 1250},
        {title = "Masque tête de mort 10", mask = 108, mask_text = 9 , costs = 1250},
        {title = "Masque tête de mort 11", mask = 108, mask_text = 10 , costs = 1250},
        {title = "Masque tête de mort 12", mask = 108, mask_text = 11 , costs = 1250},
        {title = "Masque tête de mort 13", mask = 108, mask_text = 12 , costs = 1250},
        {title = "Masque tête de mort 14", mask = 108, mask_text = 13 , costs = 1250},
        {title = "Masque tête de mort 15", mask = 108, mask_text = 14 , costs = 1250},
        {title = "Masque tête de mort 16", mask = 108, mask_text = 15 , costs = 1250},
        {title = "Masque tête de mort 17", mask = 108, mask_text = 16 , costs = 1250},
        {title = "Masque tête de mort 18", mask = 108, mask_text = 17 , costs = 1250},
        {title = "Masque tête de mort 19", mask = 108, mask_text = 18 , costs = 1250},
        {title = "Masque tête de mort 20", mask = 108, mask_text = 19 , costs = 1250},
        {title = "Masque tête de mort 21", mask = 108, mask_text = 20 , costs = 1250},
        {title = "Masque tête de mort 22", mask = 108, mask_text = 21 , costs = 1250},
        {title = "Masque tête de mort 23", mask = 108, mask_text = 22 , costs = 1250},
        {title = "Masque tête de mort 24", mask = 108, mask_text = 23 , costs = 1250},
        {title = "Masque militaire noir", mask = 28, mask_text = 0 , costs = 1050},
        {title = "Masque militaire gris", mask = 28, mask_text = 1 , costs = 1050},
        {title = "Masque militaire gris foncé", mask = 28, mask_text = 2 , costs = 1050},
        {title = "Masque militaire beige", mask = 28, mask_text = 3 , costs = 1050},
        {title = "Masque militaire vert", mask = 28, mask_text = 4 , costs = 1050},
        {title = "Masque militaire noir", mask = 89, mask_text = 0 , costs = 1050},
        {title = "Masque militaire gris", mask = 89, mask_text = 1 , costs = 1050},
        {title = "Masque militaire gris foncé", mask = 89, mask_text = 2 , costs = 1050},
        {title = "Masque militaire beige", mask = 89, mask_text = 3 , costs = 1050},
        {title = "Masque militaire vert", mask = 89, mask_text = 4 , costs = 1050},
        {title = "Masque guerre 1", mask = 106, mask_text = 0 , costs = 1250},
        {title = "Masque guerre 2", mask = 106, mask_text = 1 , costs = 1250},
        {title = "Masque guerre 3", mask = 106, mask_text = 2 , costs = 1250},
        {title = "Masque guerre 4", mask = 106, mask_text = 3 , costs = 1250},
        {title = "Masque guerre 5", mask = 106, mask_text = 4 , costs = 1250},
        {title = "Masque guerre 6", mask = 106, mask_text = 5 , costs = 1250},
        {title = "Masque guerre 7", mask = 106, mask_text = 6 , costs = 1250},
        {title = "Masque guerre 8", mask = 106, mask_text = 7 , costs = 1250},
        {title = "Masque guerre 9", mask = 106, mask_text = 8 , costs = 1250},
        {title = "Masque guerre 10", mask = 106, mask_text = 9 , costs = 1250},
        {title = "Masque guerre 11", mask = 106, mask_text = 10 , costs = 1250},
        {title = "Masque guerre 12", mask = 106, mask_text = 11 , costs = 1250},
        {title = "Masque guerre 13", mask = 106, mask_text = 12 , costs = 1250},
        {title = "Masque guerre 14", mask = 106, mask_text = 13 , costs = 1250},
        {title = "Masque guerre 15", mask = 106, mask_text = 14 , costs = 1250},
        {title = "Masque guerre 16", mask = 106, mask_text = 15 , costs = 1250},
        {title = "Masque guerre 17", mask = 106, mask_text = 16 , costs = 1250},
        {title = "Masque guerre 18", mask = 106, mask_text = 17 , costs = 1250},
        {title = "Masque guerre 19", mask = 106, mask_text = 18 , costs = 1250},
        {title = "Masque guerre 20", mask = 106, mask_text = 19 , costs = 1250},
        {title = "Masque guerre 21", mask = 106, mask_text = 20 , costs = 1250},
        {title = "Masque guerre 22", mask = 106, mask_text = 21 , costs = 1250},
        {title = "Masque guerre 23", mask = 106, mask_text = 22 , costs = 1250},
        {title = "Masque guerre 24", mask = 106, mask_text = 23 , costs = 1250},
        {title = "Masque guerre 25", mask = 106, mask_text = 24 , costs = 1250},
        {title = "Masque guerre 26", mask = 106, mask_text = 25 , costs = 1250},
        {title = "Cagoule guerre 1", mask = 104, mask_text = 0 , costs = 1050},
        {title = "Cagoule guerre 2", mask = 104, mask_text = 1 , costs = 1050},
        {title = "Cagoule guerre 3", mask = 104, mask_text = 2 , costs = 1050},
        {title = "Cagoule guerre 4", mask = 104, mask_text = 3 , costs = 1050},
        {title = "Cagoule guerre 5", mask = 104, mask_text = 4 , costs = 1050},
        {title = "Cagoule guerre 6", mask = 104, mask_text = 5 , costs = 1050},
        {title = "Cagoule guerre 7", mask = 104, mask_text = 6 , costs = 1050},
        {title = "Cagoule guerre 8", mask = 104, mask_text = 7 , costs = 1050},
        {title = "Cagoule guerre 9", mask = 104, mask_text = 8 , costs = 1050},
        {title = "Cagoule guerre 10", mask = 104, mask_text = 9 , costs = 1050},
        {title = "Cagoule guerre 11", mask = 104, mask_text = 10 , costs = 1050},
        {title = "Cagoule guerre 12", mask = 104, mask_text = 11 , costs = 1050},
        {title = "Cagoule guerre 13", mask = 104, mask_text = 12 , costs = 1050},
        {title = "Cagoule guerre 14", mask = 104, mask_text = 13 , costs = 1050},
        {title = "Cagoule guerre 15", mask = 104, mask_text = 14 , costs = 1050},
        {title = "Cagoule guerre 16", mask = 104, mask_text = 15 , costs = 1050},
        {title = "Cagoule guerre 17", mask = 104, mask_text = 16 , costs = 1050},
        {title = "Cagoule guerre 18", mask = 104, mask_text = 17 , costs = 1050},
        {title = "Cagoule guerre 19", mask = 104, mask_text = 18 , costs = 1050},
        {title = "Cagoule guerre 20", mask = 104, mask_text = 19 , costs = 1050},
        {title = "Cagoule guerre 21", mask = 104, mask_text = 20 , costs = 1050},
        {title = "Cagoule guerre 22", mask = 104, mask_text = 21 , costs = 1050},
        {title = "Cagoule guerre 23", mask = 104, mask_text = 22 , costs = 1050},
        {title = "Cagoule guerre 24", mask = 104, mask_text = 23 , costs = 1050},
        {title = "Cagoule guerre 25", mask = 104, mask_text = 24 , costs = 1050},
        {title = "Cagoule guerre 26", mask = 104, mask_text = 25 , costs = 1050},
      }
    },
    ["Cagoule"] = {
      title = "Cagoule",
      name = "Cagoule",
      buttons = {
        {title = "Cagoule rouge", mask = 32, mask_text = 0 , costs = 300},
        {title = "Cagoule noire", mask = 37, mask_text = 0 , costs = 300},
        {title = "Cagoule noire moulante", mask = 35, mask_text = 0 , costs = 350},
        {title = "Ruban crime", mask = 47, mask_text = 0 , costs = 300},
        {title = "Ruban déviation", mask = 47, mask_text = 1 , costs = 300},
        {title = "Ruban travaux", mask = 47, mask_text = 2 , costs = 300},
        {title = "Ruban blanc et rouge", mask = 47, mask_text = 3 , costs = 300},
        {title = "Ruban gris", mask = 48, mask_text = 0 , costs = 300},
        {title = "Ruban noir", mask = 48, mask_text = 1 , costs = 300},
        {title = "Ruban blanc", mask = 48, mask_text = 2 , costs = 300},
        {title = "Ruban multi-couleur", mask = 48, mask_text = 3 , costs = 300},
        {title = "Cagoule noire 3", mask = 52, mask_text = 0 , costs = 350},
        {title = "Cagoule marron", mask = 52, mask_text = 1 , costs = 350},
        {title = "Cagoule beige", mask = 52, mask_text = 2 , costs = 350},
        {title = "Cagoule blanche", mask = 52, mask_text = 3 , costs = 350},
        {title = "Cagoule verte", mask = 52, mask_text = 4 , costs = 350},
        {title = "Cagoule marron", mask = 52, mask_text = 5 , costs = 350},
        {title = "Cagoule noire 4", mask = 52, mask_text = 6 , costs = 350},
        {title = "Cagoule militaire 1", mask = 52, mask_text = 7 , costs = 350},
        {title = "Cagoule militaire 2", mask = 52, mask_text = 8 , costs = 350},
        {title = "Cagoule grise", mask = 52, mask_text = 9 , costs = 350},
        {title = "Cagoule jaune", mask = 52, mask_text = 10 , costs = 350},
        {title = "Cagoule tête de mort", mask = 52, mask_text = 11 , costs = 350},
        {title = "Cagoule capuche 1", mask = 53, mask_text = 0 , costs = 450},
        {title = "Cagoule capuche 2", mask = 53, mask_text = 1 , costs = 450},
        {title = "Cagoule capuche 3", mask = 53, mask_text = 2 , costs = 450},
        {title = "Cagoule capuche 4", mask = 53, mask_text = 3 , costs = 450},
        {title = "Cagoule capuche 5", mask = 53, mask_text = 4 , costs = 450},
        {title = "Cagoule capuche 6", mask = 53, mask_text = 5 , costs = 450},
        {title = "Cagoule capuche 7", mask = 53, mask_text = 6 , costs = 450},
        {title = "Cagoule capuche 8", mask = 53, mask_text = 7 , costs = 450},
        {title = "Cagoule capuche 9", mask = 53, mask_text = 8 , costs = 450},
        {title = "Cagoule gang 1", mask = 54, mask_text = 0 , costs = 450},
        {title = "Cagoule gang 2", mask = 54, mask_text = 1 , costs = 450},
        {title = "Cagoule gang 3", mask = 54, mask_text = 2 , costs = 450},
        {title = "Cagoule gang 4", mask = 54, mask_text = 3 , costs = 450},
        {title = "Cagoule gang 5", mask = 54, mask_text = 4 , costs = 450},
        {title = "Cagoule gang 6", mask = 54, mask_text = 5 , costs = 450},
        {title = "Cagoule gang 7", mask = 54, mask_text = 6 , costs = 450},
        {title = "Cagoule gang 8", mask = 54, mask_text = 7 , costs = 450},
        {title = "Cagoule gang 9", mask = 54, mask_text = 8 , costs = 450},
        {title = "Cagoule gang 10", mask = 54, mask_text = 9 , costs = 450},
        {title = "Cagoule froid noire", mask = 55, mask_text = 0 , costs = 550},
        {title = "Cagoule froid marron", mask = 55, mask_text = 1 , costs = 550},
        {title = "Cagoule complête 1", mask = 56, mask_text = 0 , costs = 400},
        {title = "Cagoule complête 2", mask = 56, mask_text = 1 , costs = 400},
        {title = "Cagoule complête 3", mask = 56, mask_text = 2 , costs = 400},
        {title = "Cagoule complête 4", mask = 56, mask_text = 3 , costs = 400},
        {title = "Cagoule complête 5", mask = 56, mask_text = 4 , costs = 400},
        {title = "Cagoule complête 6", mask = 56, mask_text = 5 , costs = 400},
        {title = "Cagoule complête 7", mask = 56, mask_text = 6 , costs = 400},
        {title = "Cagoule complête 8", mask = 56, mask_text = 7 , costs = 400},
        {title = "Cagoule complête 9", mask = 56, mask_text = 8 , costs = 400},
        {title = "Cagoule tissu noir", mask = 57, mask_text = 0 , costs = 350},
        {title = "Cagoule tissu vert", mask = 57, mask_text = 1 , costs = 350},
        {title = "Cagoule tissu marron", mask = 57, mask_text = 2 , costs = 350},
        {title = "Cagoule tissu gris", mask = 57, mask_text = 3 , costs = 350},
        {title = "Cagoule tissu marron", mask = 57, mask_text = 4 , costs = 350},
        {title = "Cagoule tissu arc en ciel", mask = 57, mask_text = 5 , costs = 350},
        {title = "Cagoule tissu militaire", mask = 57, mask_text = 6 , costs = 350},
        {title = "Cagoule tissu beige", mask = 57, mask_text = 7 , costs = 350},
        {title = "Cagoule tissu rose", mask = 57, mask_text = 8 , costs = 350},
        {title = "Cagoule tissu vert rouge vert", mask = 57, mask_text = 9 , costs = 350},
        {title = "Cagoule tissu bateau", mask = 57, mask_text = 10 , costs = 350},
        {title = "Cagoule tissu manga", mask = 57, mask_text = 11 , costs = 350},
        {title = "Cagoule tissu DS", mask = 57, mask_text = 12 , costs = 350},
        {title = "Cagoule tissu Perseus", mask = 57, mask_text = 13 , costs = 350},
        {title = "Cagoule tissu P", mask = 57, mask_text = 14 , costs = 350},
        {title = "Cagoule tissu S", mask = 57, mask_text = 15 , costs = 350},
        {title = "Cagoule tissu Blanc", mask = 57, mask_text = 16 , costs = 350},
        {title = "Cagoule tissu Bleu", mask = 57, mask_text = 17 , costs = 350},
        {title = "Cagoule tissu Rouge", mask = 57, mask_text = 18 , costs = 350},
        {title = "Cagoule tissu Vert", mask = 57, mask_text = 19 , costs = 350},
        {title = "Cagoule tissu Orange", mask = 57, mask_text = 20 , costs = 350},
        {title = "Cagoule tissu Violet", mask = 57, mask_text = 21 , costs = 350},
        {title = "Cagoule tissu noir et blanc", mask = 58, mask_text = 0 , costs = 350},
        {title = "Cagoule tissu vert maron gris noir", mask = 58, mask_text = 1 , costs = 350},
        {title = "Cagoule tissu militaire", mask = 58, mask_text = 2 , costs = 350},
        {title = "Cagoule tissu militaire rose", mask = 58, mask_text = 3 , costs = 350},
        {title = "Cagoule tissu militaire orange", mask = 58, mask_text = 4 , costs = 350},
        {title = "Cagoule tissu rage", mask = 58, mask_text = 5 , costs = 350},
        {title = "Cagoule tissu singe", mask = 58, mask_text = 6 , costs = 350},
        {title = "Cagoule tissu bleu fade", mask = 58, mask_text = 7 , costs = 350},
        {title = "Cagoule tissu noir", mask = 58, mask_text = 8 , costs = 350},
        {title = "Cagoule tissu rose", mask = 58, mask_text = 9 , costs = 350},
      }
    },
    ["Sac"] = {
      title = "Sacs troués",
      name = "Sac",
      buttons = {
        {title = "Sac troué blanc", mask = 49, mask_text = 0 , costs = 300},
        {title = "Sac troué visage", mask = 49, mask_text = 1 , costs = 300},
        {title = "Sac troué visage qui pleure", mask = 49, mask_text = 2 , costs = 300},
        {title = "Sac troué visage", mask = 49, mask_text = 3 , costs = 300},
        {title = "Sac troué chat", mask = 49, mask_text = 4 , costs = 300},
        {title = "Sac troué dents", mask = 49, mask_text = 5 , costs = 300},
        {title = "Sac troué hamster", mask = 49, mask_text = 6 , costs = 300},
        {title = "Sac troué fast-food", mask = 49, mask_text = 7 , costs = 300},
        {title = "Sac troué cible", mask = 49, mask_text = 8 , costs = 300},
        {title = "Sac troué démon", mask = 49, mask_text = 9 , costs = 300},
        {title = "Sac troué ours", mask = 49, mask_text = 10 , costs = 300},
        {title = "Sac troué bouche", mask = 49, mask_text = 11 , costs = 300},
        {title = "Sac troué énervé", mask = 49, mask_text = 12 , costs = 300},
        {title = "Sac troué vague", mask = 49, mask_text = 13 , costs = 300},
        {title = "Sac troué tête de mort", mask = 49, mask_text = 14 , costs = 300},
        {title = "Sac troué chien", mask = 49, mask_text = 15 , costs = 300},
        {title = "Sac troué rose", mask = 49, mask_text = 16 , costs = 300},
        {title = "Sac troué E.T", mask = 49, mask_text = 17 , costs = 300},
        {title = "Sac troué help me", mask = 49, mask_text = 18 , costs = 300},
        {title = "Sac troué labyrinthe", mask = 49, mask_text = 19 , costs = 300},
        {title = "Sac troué fuck", mask = 49, mask_text = 20 , costs = 300},
        {title = "Sac troué moustache", mask = 49, mask_text = 21 , costs = 300},
        {title = "Sac troué stickers", mask = 49, mask_text = 22 , costs = 300},
        {title = "Sac troué picasso", mask = 49, mask_text = 23 , costs = 300},
        {title = "Sac troué coeur", mask = 49, mask_text = 24 , costs = 300},
        {title = "Sac troué noir", mask = 49, mask_text = 25 , costs = 300},
      }
    },
    ["Foulard"] = {
      title = "Foulard",
      name = "Foulard",
      buttons = {
        {title = "Foulard 1", mask = 51, mask_text = 0 , costs = 350},
        {title = "Foulard 2", mask = 51, mask_text = 1 , costs = 350},
        {title = "Foulard 3", mask = 51, mask_text = 2 , costs = 350},
        {title = "Foulard 4", mask = 51, mask_text = 3 , costs = 350},
        {title = "Foulard 5", mask = 51, mask_text = 4 , costs = 350},
        {title = "Foulard 6", mask = 51, mask_text = 5 , costs = 350},
        {title = "Foulard 7", mask = 51, mask_text = 6 , costs = 350},
        {title = "Foulard 8", mask = 51, mask_text = 7 , costs = 350},
        {title = "Foulard 9", mask = 51, mask_text = 8 , costs = 350},
        {title = "Foulard 10", mask = 51, mask_text = 9 , costs = 350},
      }
    },
    ["Autre"] = {
      title = "Autre",
      name = "Autre",
      buttons = {
        {title = "Transformers 1", mask = 91, mask_text = 0 , costs = 10350},
        {title = "Transformers 2", mask = 91, mask_text = 1 , costs = 10350},
        {title = "Transformers 3", mask = 91, mask_text = 2 , costs = 10350},
        {title = "Transformers 4", mask = 91, mask_text = 3 , costs = 10350},
        {title = "Transformers 5", mask = 91, mask_text = 4 , costs = 10350},
        {title = "Transformers 6", mask = 91, mask_text = 5 , costs = 10350},
        {title = "Transformers 7", mask = 91, mask_text = 6 , costs = 10350},
        {title = "Transformers 8", mask = 91, mask_text = 7 , costs = 10350},
        {title = "Transformers 9", mask = 91, mask_text = 8 , costs = 10350},
        {title = "Transformers 10", mask = 91, mask_text = 9 , costs = 10350},
        {title = "Transformers 11", mask = 91, mask_text = 9 , costs = 10350},
      }
    },
  }
}

local maskshop_locations = {
  {entering = {-1336.3266601563, -1278.8522949219, 4.8574371337891}, inside = {-1336.3266601563, -1278.8522949219, 4.8574371337891}, outside = {-1336.3266601563, -1278.8522949219, 4.8574371337891}},
}

local maskshop_blips = {}
local inrangeofmaskshop = false
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

function IsPlayerInRangeOfmaskshop()
  return inrangeofmaskshop
end

function ShowmaskshopBlips(bool)
  if bool and #maskshop_blips == 0 then
    for station,pos in pairs(maskshop_locations) do
      local loc = pos
      pos = pos.entering
      local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
      SetBlipSprite(blip, 362)
      SetBlipColour(blip, 47)
      SetBlipScale(blip, 0.9)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('Magasin de masques')
      EndTextCommandSetBlipName(blip)
      SetBlipAsShortRange(blip,true)
      SetBlipAsMissionCreatorBlip(blip,true)
      table.insert(maskshop_blips, {blip = blip, pos = loc})
    end
    Citizen.CreateThread(function()
      while #maskshop_blips > 0 do
        Citizen.Wait(0)
        local inrange = false
        for i,b in ipairs(maskshop_blips) do
          if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and maskshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 2 then
            ShowInfoP("Appuyez sur ~INPUT_CONTEXT~ ~w~pour ~b~acheter des masques~w~.", 0)
            currentlocation = b
            inrange = true
          end
        end
        inrangeofmaskshop = inrange
      end
    end)
  elseif bool == false and #maskshop_blips > 0 then
    for i,b in ipairs(maskshop_blips) do
      if DoesBlipExist(b.blip) then
        SetBlipAsMissionCreatorBlip(b.blip,false)
        Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
      end
    end
    maskshop_blips = {}
  end
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
  ShowmaskshopBlips(true)
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
  maskshop.currentmenu = "main"
  maskshop.opened = true
  maskshop.selectedbutton = 1
end

function CloseCreator()
  Citizen.CreateThread(function()
    maskshop.opened = false
    maskshop.menu.from = 1
    maskshop.menu.to = 10
  end)
end

function drawMenuButton(button,x,y,selected)
  local menu = maskshop.menu
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
  local menu = maskshop.menu
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
  local menu = maskshop.menu
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
local menu = maskshop.menu
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
  local menu = maskshopcolors.menu
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
  drawMenuRight(button.costs.." $",maskshop.menu.x, y, selected)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(1,38) and IsPlayerInRangeOfmaskshop() then
      if maskshop.opened then
        CloseCreator()
      else
        OpenCreator()
      end
    end
    if maskshop.opened then
      local ped = LocalPed()
      local menu = maskshop.menu[maskshop.currentmenu]
      drawTxt(maskshop.title,1,1,maskshop.menu.x,maskshop.menu.y,1.0, 255,255,255,255)
      drawMenuTitle(menu.title, maskshop.menu.x,maskshop.menu.y + 0.08)
      drawTxt(maskshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,maskshop.menu.x + maskshop.menu.width/2 - 0.0385,maskshop.menu.y + 0.067,0.4, 255,255,255,255)
      local y = maskshop.menu.y + 0.12
      buttoncount = tablelength(menu.buttons)
      local selected = false

      for i,button in pairs(menu.buttons) do
        if i >= maskshop.menu.from and i <= maskshop.menu.to then

          if i == maskshop.selectedbutton then
            selected = true
          else
            selected = false
          end
          drawMenuButton(button,maskshop.menu.x,y,selected)
          if button.costs ~= nil then
            DoesPlayerHaveCloth(button,y,selected,ped)
          end
          y = y + 0.04
          if maskshop.currentmenu == "Animaux" or "Horreur" or "Hockey" or "Normal" or "Noel" or "Armee" or "Cartoon" or "Cagoule" or "Sac" or "Foulard" or "Autre" then
            if selected then
                SetPedComponentVariation(GetPlayerPed(-1), 1, button.mask, button.mask_text, 0)
            end
          end
          if selected and IsControlJustPressed(1,201) then
            ButtonSelected(button)
          end
        end
      end
    end
    if maskshop.opened then
      if IsControlJustPressed(1,202) then
        Back()
      end
      if IsControlJustPressed(1,188) then
        if maskshop.selectedbutton > 1 then
          maskshop.selectedbutton = maskshop.selectedbutton -1
          if buttoncount > 10 and maskshop.selectedbutton < maskshop.menu.from then
            maskshop.menu.from = maskshop.menu.from -1
            maskshop.menu.to = maskshop.menu.to - 1
          end
        end
      end
      if IsControlJustPressed(1,187)then
        if maskshop.selectedbutton < buttoncount then
          maskshop.selectedbutton = maskshop.selectedbutton +1
          if buttoncount > 10 and maskshop.selectedbutton > maskshop.menu.to then
            maskshop.menu.to = maskshop.menu.to + 1
            maskshop.menu.from = maskshop.menu.from + 1
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
  local this = maskshop.currentmenu
  local btn = button.name
  if this == "main" then
    if btn == "Animaux" then
      OpenMenu('Animaux')
    elseif btn == "Horreur" then
      OpenMenu('Horreur')
    elseif btn == "Hockey" then
      OpenMenu('Hockey')
    elseif btn == "Noel" then
      OpenMenu('Noel')
    elseif btn == "Cartoon" then
      OpenMenu('Cartoon')
    elseif btn == "Armee" then
      OpenMenu('Armee')
    elseif btn == "Cagoule" then
      OpenMenu('Cagoule')
    elseif btn == "Foulard" then
      OpenMenu('Foulard')
    elseif btn == "Sac" then
      OpenMenu('Sac')
    elseif btn == "Autre" then
      OpenMenu('Autre')
    elseif btn == "Normal" then
      OpenMenu('Normal')
    end
  elseif this == "Animaux" or "Horreur" or "Hockey" or "Normal" or "Noel" or "Armee" or "Cartoon" or "Cagoule" or "Sac" or "Foulard" or "Autre" then
    TriggerServerEvent("BuyMask", {"Masque", button.costs, button.mask, button.mask_text})
  end
end

function OpenMenu(menu)
  maskshop.lastmenu = maskshop.currentmenu
  maskshop.menu.from = 1
  maskshop.menu.to = 10
  maskshop.selectedbutton = 1
  maskshop.currentmenu = menu
end

function Back()
  if maskshop.currentmenu == "main" then
    CloseCreator()
  else
    OpenMenu("main")
  end
end

RegisterNetEvent("maskshop:reloadOutfits")
AddEventHandler("maskshop:reloadOutfits", function(mask, mask_text)
  SetPedComponentVariation(GetPlayerPed(-1), 1, mask, mask_text, 0)
  SetPedComponentVariation(GetPlayerPed(-1), 1, mask, mask_text, 0)
end)

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end