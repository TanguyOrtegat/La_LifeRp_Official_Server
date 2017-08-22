-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'LaLife Core Library'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    '@common/player/events.lua',
    '@common/connectqueue/server.lua',
    '@common/connectqueue/whitelist.lua'
}

client_scripts {
    'connectqueue/client.lua'
}

server_export "AddPriority"
server_export "RemovePriority"
