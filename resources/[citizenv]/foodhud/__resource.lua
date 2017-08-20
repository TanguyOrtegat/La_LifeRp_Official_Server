client_script "foodhud.net.dll"
client_script "frfuel.net.dll"
server_script "price.lua"
file "foodhud_config.ini"
file "config.ini"


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    'price.lua',
}
