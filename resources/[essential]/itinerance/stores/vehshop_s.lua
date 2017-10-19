RegisterServerEvent('CheckMoneyForVeh')
RegisterServerEvent('BuyForVeh')
RegisterServerEvent('vehshop:GetIdentifier')

local vehshop = {    identifier = nil,
    opened = false,
    title = "Vehicle Shop",
    currentmenu = "main",
    lastmenu = nil,
    currentpos = nil,
    selectedbutton = 0,
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
                {name = "Vehicles", description = ""},
                {name = "Motorcycles", description = ""},
                {name = "Gang", description = ""},
                {name = "Cartel", description = ""},
                {name = "Redneck", description = ""},
            }
        },
        ["vehicles"] = {
            title = "VEHICLES",
            name = "vehicles",
            buttons = {
                {name = "Compacts", description = ''},
                {name = "Coupes", description = ''},
                {name = "Sedans", description = ''},
                {name = "Sports", description = ''},
                {name = "Sports Classics", description = ''},
                {name = "Super", description = ''},
                {name = "Muscle", description = ''},
                {name = "Off-Road", description = ''},
                {name = "SUVs", description = ''},
                {name = "Vans", description = ''},
                {name = "Cycles", description = ''},
            }
        },
        ["compacts"] = {
            title = "compacts",
            name = "compacts",
            buttons = {
                {name = "Blista", costs = 15000, description = {}, model = "blista"},
                {name = "Brioso R/A", costs = 35000, description = {}, model = "brioso"},
                {name = "Dilettante", costs = 25000, description = {}, model = "Dilettante"},
                {name = "Issi", costs = 18000, description = {}, model = "issi2"},
                {name = "Panto", costs = 8500, description = {}, model = "panto"},
                {name = "Prairie", costs = 30000, description = {}, model = "prairie"},
                {name = "Rhapsody", costs = 23000, description = {}, model = "rhapsody"},
            }
        },
        ["coupes"] = {
            title = "coupes",
            name = "coupes",
            buttons = {
                {name = "Cognoscenti Cabrio", costs = 180000, description = {}, model = "cogcabrio"},
                {name = "Exemplar", costs = 200000, description = {}, model = "exemplar"},
                {name = "F620", costs = 80000, description = {}, model = "f620"},
                {name = "Felon", costs = 90000, description = {}, model = "felon"},
                {name = "Felon GT", costs = 95000, description = {}, model = "felon2"},
                {name = "Jackal", costs = 60000, description = {}, model = "jackal"},
                {name = "Oracle", costs = 80000, description = {}, model = "oracle"},
                {name = "Oracle XS", costs = 82000, description = {}, model = "oracle2"},
                {name = "Sentinel", costs = 90000, description = {}, model = "sentinel"},
                {name = "Sentinel XS", costs = 60000, description = {}, model = "sentinel2"},
                {name = "Windsor", costs = 800000, description = {}, model = "windsor"},
                {name = "Windsor Drop", costs = 850000, description = {}, model = "windsor2"},
                {name = "Zion", costs = 60000, description = {}, model = "zion"},
                {name = "Zion Cabrio", costs = 65000, description = {}, model = "zion2"},
            }
        },
        ["sports"] = {
            title = "sports",
            name = "sports",
            buttons = {
                {name = "9F", costs = 120000, description = {}, model = "ninef"},
                {name = "9F Cabrio", costs = 130000, description = {}, model = "ninef2"},
                {name = "Alpha", costs = 150000, description = {}, model = "alpha"},
                {name = "Banshee", costs = 105000, description = {}, model = "banshee"},
                {name = "Bestia GTS", costs = 610000, description = {}, model = "bestiagts"},
                {name = "Blista Compact", costs = 42000, description = {}, model = "blista"},
                {name = "Buffalo", costs = 35000, description = {}, model = "buffalo"},
                {name = "Buffalo S", costs = 96000, description = {}, model = "buffalo2"},
                {name = "Carbonizzare", costs = 195000, description = {}, model = "carbonizzare"},
                {name = "Comet", costs = 100000, description = {}, model = "comet2"},
                {name = "Coquette", costs = 138000, description = {}, model = "coquette"},
                {name = "Drift Tampa", costs = 995000, description = {}, model = "tampa2"},
                {name = "Feltzer", costs = 130000, description = {}, model = "feltzer2"},
                {name = "Furore GT", costs = 448000, description = {}, model = "furoregt"},
                {name = "Fusilade", costs = 36000, description = {}, model = "fusilade"},
                {name = "Jester", costs = 240000, description = {}, model = "jester"},
                {name = "Jester(Racecar)", costs = 350000, description = {}, model = "jester2"},
                {name = "Kuruma", costs = 95000, description = {}, model = "kuruma"},
                {name = "Lynx", costs = 1735000, description = {}, model = "lynx"},
                {name = "Massacro", costs = 275000, description = {}, model = "massacro"},
                {name = "Massacro(Racecar)", costs = 385000, description = {}, model = "massacro2"},
                {name = "Omnis", costs = 701000, description = {}, model = "omnis"},
                {name = "Penumbra", costs = 250000, description = {}, model = "penumbra"},
                {name = "Rapid GT", costs = 140000, description = {}, model = "rapidgt"},
                {name = "Rapid GT Convertible", costs = 150000, description = {}, model = "rapidgt2"},
                {name = "Schafter V12", costs = 140000, description = {}, model = "schafter3"},
                {name = "Sultan", costs = 80000, description = {}, model = "sultan"},
                {name = "Surano", costs = 110000, description = {}, model = "surano"},
                {name = "Tropos", costs = 816000, description = {}, model = "tropos"},
                {name = "Verkierer", costs = 695000, description = {}, model = "verlierer2"},
            }
        },
        ["sportsclassics"] = {
            title = "sports classics",
            name = "sportsclassics",
            buttons = {
                {name = "Casco", costs = 680000, description = {}, model = "casco"},
                {name = "Coquette Classic", costs = 665000, description = {}, model = "coquette2"},
                {name = "JB 700", costs = 350000, description = {}, model = "jb700"},
                {name = "Pigalle", costs = 400000, description = {}, model = "pigalle"},
                {name = "Stinger", costs = 850000, description = {}, model = "stinger"},
                {name = "Stinger GT", costs = 875000, description = {}, model = "stingergt"},
                {name = "Stirling GT", costs = 975000, description = {}, model = "feltzer3"},
                {name = "Z-Type", costs = 950000, description = {}, model = "ztype"},
            }
        },
        ["super"] = {
            title = "super",
            name = "super",
            buttons = {
                {name = "Adder", costs = 1000000, description = {}, model = "adder"},
                {name = "Banshee 900R", costs = 565000, description = {}, model = "banshee2"},
                {name = "Bullet", costs = 155000, description = {}, model = "bullet"},
                {name = "Cheetah", costs = 650000, description = {}, model = "cheetah"},
                {name = "Entity XF", costs = 795000, description = {}, model = "entityxf"},
                {name = "ETR1", costs = 1200000, description = {}, model = "sheava"},
                {name = "FMJ", costs = 1750000, description = {}, model = "fmj"},
                {name = "Infernus", costs = 440000, description = {}, model = "infernus"},
                {name = "Osiris", costs = 1950000, description = {}, model = "osiris"},
                {name = "RE-7B", costs = 2475000, description = {}, model = "le7b"},
                {name = "Reaper", costs = 1595000, description = {}, model = "reaper"},
                {name = "Sultan RS", costs = 795000, description = {}, model = "sultanrs"},
                {name = "T20", costs = 2200000, description = {}, model = "t20"},
                {name = "Turismo R", costs = 500000, description = {}, model = "turismor"},
                {name = "Tyrus", costs = 2550000, description = {}, model = "tyrus"},
                {name = "Vacca", costs = 240000, description = {}, model = "vacca"},
                {name = "Voltic", costs = 150000, description = {}, model = "voltic"},
                {name = "X80 Proto", costs = 2700000, description = {}, model = "prototipo"},
                {name = "Zentorno", costs = 725000, description = {}, model = "zentorno"},
                {name = "pfister811", costs = 1100000, description = {}, model = "pfister811"},
                {name = "ocelot xa21", costs = 2300000, description = {}, model = "xa21"},
                {name = "dewbauchee vagner", costs = 3000000, description = {}, model = "vagner"},
                {name = "ocelot penetrator", costs = 850000, description = {}, model = "penetrator"},
                {name = "truffade nero", costs = 1400000, description = {}, model = "nero"},
                {name = "progen italigtb", costs = 1150000, description = {}, model = "italigtb"},
                {name = "progen italigtb2", costs = 1800000, description = {}, model = "italigtb2"},
            }
        },
        ["muscle"] = {
            title = "muscle",
            name = "muscle",
            buttons = {
                {name = "Blade", costs = 160000, description = {}, model = "blade"},
                {name = "Buccaneer", costs = 29000, description = {}, model = "buccaneer"},
                {name = "Chino", costs = 225000, description = {}, model = "chino"},
                {name = "Coquette BlackFin", costs = 695000, description = {}, model = "coquette3"},
                {name = "Dominator", costs = 35000, description = {}, model = "dominator"},
                {name = "Dukes", costs = 62000, description = {}, model = "dukes"},
                {name = "Gauntlet", costs = 32000, description = {}, model = "gauntlet"},
                {name = "Hotknife", costs = 90000, description = {}, model = "hotknife"},
                {name = "Faction", costs = 36000, description = {}, model = "faction"},
                {name = "Nightshade", costs = 585000, description = {}, model = "nightshade"},
                {name = "Picador", costs = 9000, description = {}, model = "picador"},
                {name = "Sabre Turbo", costs = 15000, description = {}, model = "sabregt"},
                {name = "Tampa", costs = 375000, description = {}, model = "tampa"},
                {name = "Virgo", costs = 195000, description = {}, model = "virgo"},
                {name = "Vigero", costs = 21000, description = {}, model = "vigero"},
                {name = "Willard Faction2", costs = 335000, description = {}, model = "Faction2"},
            }
        },
        ["offroad"] = {
            title = "off-road",
            name = "off-road",
            buttons = {
                {name = "Bifta", costs = 75000, description = {}, model = "bifta"},
                {name = "Blazer", costs = 8000, description = {}, model = "blazer"},
                {name = "Brawler", costs = 715000, description = {}, model = "brawler"},
                {name = "Bubsta 6x6", costs = 249000, description = {}, model = "dubsta3"},
                {name = "Dune Buggy", costs = 20000, description = {}, model = "dune"},
                {name = "Rebel", costs = 22000, description = {}, model = "rebel2"},
                {name = "Sandking", costs = 38000, description = {}, model = "sandking"},
                {name = "The Liberator", costs = 1550000, description = {}, model = "monster"},
                {name = "Trophy Truck", costs = 850000, description = {}, model = "trophytruck"},
            }
        },
        ["suvs"] = {
            title = "suvs",
            name = "suvs",
            buttons = {
                {name = "Baller", costs = 90000, description = {}, model = "baller"},
                {name = "Cavalcade", costs = 60000, description = {}, model = "cavalcade"},
                {name = "Grabger", costs = 35000, description = {}, model = "granger"},
                {name = "Huntley S", costs = 195000, description = {}, model = "huntley"},
                {name = "Landstalker", costs = 58000, description = {}, model = "landstalker"},
                {name = "Radius", costs = 32000, description = {}, model = "radi"},
                {name = "Rocoto", costs = 85000, description = {}, model = "rocoto"},
                {name = "Seminole", costs = 30000, description = {}, model = "seminole"},
                {name = "XLS", costs = 253000, description = {}, model = "xls"},
                {name = "Benefactor Dubsta", costs = 200000, description = {}, model = "dubsta"},
                {name = "Benefactor Serrano", costs = 150000, description = {}, model = "serrano"},
            }
        },
        ["vans"] = {
            title = "vans",
            name = "vans",
            buttons = {
                {name = "Bison", costs = 30000, description = {}, model = "bison"},
                {name = "Bobcat XL", costs = 23000, description = {}, model = "bobcatxl"},
                {name = "Gang Burrito", costs = 65000, description = {}, model = "gburrito"},
                {name = "Journey", costs = 15000, description = {}, model = "journey"},
                {name = "Minivan", costs = 30000, description = {}, model = "minivan"},
                {name = "Paradise", costs = 25000, description = {}, model = "paradise"},
                {name = "Rumpo", costs = 13000, description = {}, model = "rumpo"},
                {name = "Surfer", costs = 11000, description = {}, model = "surfer"},
                {name = "Youga", costs = 16000, description = {}, model = "youga"},
                {name = "Declasse Moonbeam2", costs = 300000, description = {}, model = "Moonbeam2"},
                {name = "Journey", costs = 15000, description = {}, model = "journey"},
                {name = "Minivan", costs = 30000, description = {}, model = "minivan"},
            }
        },
        ["sedans"] = {
            title = "sedans",
            name = "sedans",
            buttons = {
                {name = "Asea", costs = 1000000, description = {}, model = "asea"},
                {name = "Asterope", costs = 1000000, description = {}, model = "asterope"},
                {name = "Fugitive", costs = 24000, description = {}, model = "fugitive"},
                {name = "Glendale", costs = 200000, description = {}, model = "glendale"},
                {name = "Ingot", costs = 9000, description = {}, model = "ingot"},
                {name = "Intruder", costs = 16000, description = {}, model = "intruder"},
                {name = "Premier", costs = 10000, description = {}, model = "premier"},
                {name = "Primo", costs = 9000, description = {}, model = "primo"},
                {name = "Primo Custom", costs = 350000, description = {}, model = "primo2"},
                {name = "Regina", costs = 8000, description = {}, model = "regina"},
                {name = "Schafter", costs = 65000, description = {}, model = "schafter2"},
                {name = "Stanier", costs = 10000, description = {}, model = "stanier"},
                {name = "Stratum", costs = 10000, description = {}, model = "stratum"},
                {name = "Stretch", costs = 350000, description = {}, model = "stretch"},
                {name = "Super Diamond", costs = 250000, description = {}, model = "superd"},
                {name = "Surge", costs = 38000, description = {}, model = "surge"},
                {name = "Tailgater", costs = 55000, description = {}, model = "tailgater"},
                {name = "Warrener", costs = 120000, description = {}, model = "warrener"},
                {name = "Washington", costs = 15000, description = {}, model = "washington"},
                {name = "Albany Emperor", costs = 30000, description = {}, model = "emperor"},
            }
        },
        ["motorcycles"] = {
            title = "MOTORCYCLES",
            name = "motorcycles",
            buttons = {
                {name = "Akuma", costs = 9000, description = {}, model = "akuma"},
                {name = "Bagger", costs = 5000, description = {}, model = "bagger"},
                {name = "Bati 801", costs = 15000, description = {}, model = "bati"},
                {name = "Bati 801RR", costs = 15000, description = {}, model = "bati2"},
                {name = "BF400", costs = 95000, description = {}, model = "bf400"},
                {name = "Carbon RS", costs = 40000, description = {}, model = "carbonrs"},
                {name = "Daemon", costs = 5000, description = {}, model = "daemon"},
                {name = "Double T", costs = 12000, description = {}, model = "double"},
                {name = "Enduro", costs = 48000, description = {}, model = "enduro"},
                {name = "Faggio", costs = 4000, description = {}, model = "faggio2"},
                {name = "Hakuchou", costs = 82000, description = {}, model = "hakuchou"},
                {name = "Hexer", costs = 15000, description = {}, model = "hexer"},
                {name = "Lectro", costs = 700000, description = {}, model = "lectro"},
                {name = "Nemesis", costs = 12000, description = {}, model = "nemesis"},
                {name = "PCJ-600", costs = 9000, description = {}, model = "pcj"},
                {name = "Ruffian", costs = 9000, description = {}, model = "ruffian"},
                {name = "Sanchez", costs = 7000, description = {}, model = "sanchez"},
                {name = "Vader", costs = 9000, description = {}, model = "vader"},
                {name = "Shitzu Defiler", costs = 400000, description = {}, model = "Defiler"},
                {name = "Pegassi FCR2", costs = 150000, description = {}, model = "FCR2"},
            }
        },
        ["gang"] = {
                title = "GANG",
                name = "gang",
                buttons = {
                    {name = "Sanctus", costs = 1800000, description = {}, model = "sanctus"},
                    {name = "Rat Bike", costs = 15000, description = {}, model = "ratBike"},
                    {name = "Daemon", costs = 15000, description = {}, model = "daemon"},
                    {name = "Zombie Bobber", costs = 75000, description = {}, model = "zombiea"},
                    {name = "Zombie Chopper", costs = 75000, description = {}, model = "zombieb"},
                    {name = "Cliffhanger", costs = 175000, description = {}, model = "cliffhanger"},
                    {name = "Wolfsbane", costs = 75000, description = {}, model = "wolfsbane"},
                    {name = "Nightblade", costs = 200000, description = {}, model = "nightblade"},
                    {name = "Avarus", costs = 95000, description = {}, model = "avarus"},
                    {name = "Gargoyle", costs = 120000, description = {}, model = "gargoyle"},
                    {name = "Hexer", costs = 30000, description = {}, model = "hexer"},
                    {name = "Sovereign", costs = 90000, description = {}, model = "sovereign"},
                    {name = "Innovation", costs = 90000, description = {}, model = "innovation"},
                    {name = "Sanchez", costs = 14000, description = {}, model = "sanchez2"},
                    {name = "Thrust", costs = 100000, description = {}, model = "thrust"},
                    {name = "Vindicator", costs = 600000, description = {}, model = "vindicator"},
                    {name = "Bison", costs = 30000, description = {}, model = "bison"},
                    {name = "Bobcat XL", costs = 23000, description = {}, model = "bobcatxl"},
                    {name = "Baller", costs = 275000, description = {}, model = "baller3"},
                    {name = "Gang Burrito", costs = 90000, description = {}, model = "gburrito"},
                    {name = "Burrito", costs = 90000, description = {}, model = "gburrito2"},
                    {name = "Paradise", costs = 25000, description = {}, model = "paradise"},
                    {name = "Rumpo", costs = 13000, description = {}, model = "rumpo"},
                    {name = "Vapid Guardian", costs = 350000, description = {}, model = "guardian"},
                    {name = "Surfer", costs = 11000, description = {}, model = "surfer"},
                    {name = "Youga", costs = 16000, description = {}, model = "youga"},
                    {name = "Bravado Youga2", costs = 165000, description = {}, model = "youga2"},
                    {name = "Voodoo", costs = 425000, description = {}, model = "voodoo2"},
                    {name = "Phoenix", costs = 75000, description = {}, model = "phoenix"},
                    {name = "Ruiner", costs = 30000, description = {}, model = "ruiner"},
                    {name = "Slamvan", costs = 49500, description = {}, model = "slamvan"},
                    {name = "RatLoader2", costs = 62000, description = {}, model = "ratLoader2"},
                    {name = "Voodoo ", costs = 40000, description = {}, model = "voodoo"},
                    {name = "Slamvan", costs = 425000, description = {}, model = "slamvan3"},
                    {name = "Slamvan", costs = 49500, description = {}, model = "slamvan2"},
                    {name = "Sabre gt", costs = 350000, description = {}, model = "sabregt2"},
                    {name = "Stalion", costs = 65000, description = {}, model = "stalion"},
                    {name = "Stalion", costs = 258000, description = {}, model = "stalion2"},
                    {name = "Tornado", costs = 36000, description = {}, model = "tornado"},
                    {name = "Tornado", costs = 100000, description = {}, model = "tornado2"},
                    {name = "Tornado", costs = 36000, description = {}, model = "tornado4"},
                    {name = "Tornado", costs = 36000, description = {}, model = "tornado6"},
                    {name = "Futo", costs = 36000, description = {}, model = "futo"},
                    {name = "Blista", costs = 36000, description = {}, model = "blista2"},
                    {name = "Blista", costs = 36000, description = {}, model = "blista3"},
                    {name = "Annis Elegy", costs = 800000, description = {}, model = "elegy"},
                    {name = "Annis Elegy2", costs = 800000, description = {}, model = "elegy2"},
                    {name = "Pfister Comet", costs = 1500000, description = {}, model = "comet3"},
                    {name = "Shitzu Hakuchou", costs = 350000, description = {}, model = "hakuchou2"},
                    {name = "Grotti Turismo2", costs = 675000, description = {}, model = "turismo2"},
                    {name = "Western daemon2", costs = 130000, description = {}, model = "daemon2"},
                    {name = "Maibatsu Manchez", costs = 65000, description = {}, model = "Manchez"},
                    {name = "Nagasaki caddy2", costs = 10000, description = {}, model = "caddy2"},
                    {name = "declasse tornado5", costs = 350000, description = {}, model = "tornado5"},
                    {name = "Albany Manana", costs = 60000, description = {}, model = "Manana"},
                }
        },
        ["cartel"] = {
                title = "CARTEL",
                name = "cartel",
                buttons = {
                    {name = "Pfister Comet", costs = 1500000, description = {}, model = "comet3"},
                    {name = "Albany buccaneer", costs = 1000000, description = {}, model = "buccaneer2"},
                    {name = "Bennefactor xls", costs = 350000, description = {}, model = "xls"},
                    {name = "Pegassi vortex", costs = 750000, description = {}, model = "vortex"},
                    {name = "Shitzu Hakuchou", costs = 350000, description = {}, model = "hakuchou2"},
                    {name = "Vapid trophytruck", costs = 350000, description = {}, model = "trophytruck2"},
                    {name = "Dewbauchee seven70", costs = 1000000, description = {}, model = "seven70"},
                    {name = "Canis Mesa", costs = 350000, description = {}, model = "mesa3"},
                    {name = "Dewbauchee specter", costs = 350000, description = {}, model = "specter2"},
                    {name = "Gallivanter baller", costs = 275000, description = {}, model = "baller3"},
                    {name = "Truffade Nero", costs = 2800000, description = {}, model = "nero2"},
                    {name = "Hijak Ruston", costs = 400000, description = {}, model = "ruston"},
                }
        },
        ["redneck"] = {
                title = "REDNECK",
                name = "redneck",
                buttons = {
                    {name = "Pegassi Tempesta", costs = 325000, description = {}, model = "tempesta"},
                    {name = "Pegassi Esskey", costs = 200000, description = {}, model = "esskey"},
                    {name = "Annis Elegy", costs = 800000, description = {}, model = "elegy"},
                    {name = "Annis Elegy2", costs = 800000, description = {}, model = "elegy2"},
                    {name = "Hijak Khamelion", costs = 75000, description = {}, model = "khamelion"},
                    {name = "Albany Manana", costs = 50000, description = {}, model = "manana"},
                    {name = "Grotti Turismo2", costs = 675000, description = {}, model = "turismo2"},
                    {name = "Pegassi Infernus2", costs = 875000, description = {}, model = "infernus2"},
                    {name = "Grotti Cheetah2", costs = 840000, description = {}, model = "cheetah2"},
                    {name = "Vapid Peyote", costs = 100000, description = {}, model = "peyote"},
                    {name = "Pegassi Torero", costs = 800000, description = {}, model = "torero"},
                    {name = "Vapid virgo2", costs = 210000, description = {}, model = "virgo2"},
                    {name = "Vapid virgo3", costs = 150000, description = {}, model = "virgo3"},
                    {name = "Vapid Chino2", costs = 160000, description = {}, model = "chino2"},
                    {name = "Benefactor Dubsta2", costs = 200000, description = {}, model = "dubsta2"},
                    {name = "Bravado Ratloader2", costs = 62000, description = {}, model = "ratloader2"},
                    {name = "Bravado Youga2", costs = 165000, description = {}, model = "youga2"},
                    {name = "Canis Mesa3", costs = 350000, description = {}, model = "mesa3"},
                    {name = "Gallivanter baller3", costs = 275000, description = {}, model = "baller3"},
                    {name = "Declasse mamba", costs = 950000, description = {}, model = "mamba"},
                    {name = "Mammoth patriot", costs = 32000, description = {}, model = "patriot"},
                    {name = "Declasse gburrito2", costs = 65000, description = {}, model = "gburrito2"},
                    {name = "Progen gp1", costs = 1200000, description = {}, model = "gp1"},
                    {name = "Maibatsu Manchez", costs = 65000, description = {}, model = "Manchez"},
                }
        },
    }
}

AddEventHandler('CheckMoneyForVeh', function(name, vehicle, price)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local vehicle = vehicle
            local name = name
            local price = tonumber(price)

            MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username",{['@username'] = player}, function (result)
                if (result) then
                    count = 0
                    for _ in pairs(result) do
                        count = count + 1
                    end
                    if count == 10 then
                        TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Garage plein!\n")
                    else
                        if (tonumber(user.money) >= tonumber(price)) then
                            LaLife.Player.Manager.RemovePlayerMoney(user, price)
                            TriggerClientEvent('FinishMoneyCheckForVeh', playerSource, name, vehicle, price)
                            TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
                        else
                            TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Fonds insuffisants!\n")
                        end
                    end
                else
                    if (tonumber(user.money) >= tonumber(price)) then
                        LaLife.Player.Manager.RemovePlayerMoney(user, price)
                        TriggerClientEvent('FinishMoneyCheckForVeh', playerSource, name, vehicle, price)
                        TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
                    else
                        TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Fonds insuffisants!\n")
                    end
                end
            end)
        else
            TriggerEvent("es:desyncMsg", 'CheckMoneyForVeh')
        end
    end)
end)

AddEventHandler('BuyForVeh', function(name, vehicle, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local name = name
            local price = price
            local vehicle = vehicle

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plate,
            })

            local state = "Sorti"
            local primarycolor = primarycolor
            local secondarycolor = secondarycolor
            local pearlescentcolor = pearlescentcolor
            local wheelcolor = wheelcolor
            MySQL.Async.execute("INSERT INTO user_vehicle (`identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES (@username, @name, @vehicle, @price, @plate, @state, @primarycolor, @secondarycolor, @pearlescentcolor, @wheelcolor)",
                {['@username'] = player, ['@name'] = name, ['@vehicle'] = vehicle, ['@price'] = price, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor})
        else
            TriggerEvent("es:desyncMsg", 'BuyForVeh')
        end
    end)
end)

AddEventHandler('vehshop:GetIdentifier', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plate = string.upper("CTZN" .. string.sub(user.identifier, -4))

            TriggerClientEvent("vehshop:f_GetIdentifier", playerSource, plate)
        else
            TriggerEvent("es:desyncMsg", 'vehshop:GetIdentifier')
        end
    end)
end)

RegisterServerEvent("requestshop")
AddEventHandler("requestshop",function()
    local playerSource = source
    TriggerClientEvent("requestshop_f",playerSource,vehshop)
end)
