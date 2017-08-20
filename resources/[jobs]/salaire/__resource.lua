client_script 'salaire_client.lua'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    'salaire_server.lua'
}
