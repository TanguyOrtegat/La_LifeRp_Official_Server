resource_type "gametype" { name = "Citizen V"}

description "itinerance"

-- Requiring essentialmode
--dependency "essentialmode"

client_scripts {
    "map.lua",
    "main.lua",
    "stores/vehshop.lua",
    "stores/stripclub.lua",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    "stores/vehshop_s.lua",
    "stores/stripclub_s.lua",
}
