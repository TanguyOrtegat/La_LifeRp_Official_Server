-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'EssentialMode by Kanersps.'

ui_page 'ui.html'

-- Server
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    'server/classes/player.lua',
    'server/classes/groups.lua',
    'server/player/login.lua',
    'server/main.lua',
    'server/util.lua',
    'server/name.lua'
}

-- Client
client_scripts {
    'client/main.lua',
    'client/player.lua'
}

-- NUI Files
files {
    'ui.html',
    'pdown.ttf'
}

--server_exports {
--    'getPlayerFromId',
--    'addAdminCommand',
--    'addCommand',
--    'addGroupCommand'
--}
dependencies {
    "mysql-async"
}
