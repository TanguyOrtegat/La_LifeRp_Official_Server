client_script 'cl_permis.lua'
server_script {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    '@common/middleware.lua',
    'sv_permis.lua',
}