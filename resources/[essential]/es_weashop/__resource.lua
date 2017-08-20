client_script 'weashop.lua'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    'sv_weashop.lua'
}

export 'ShowWeashopBlips'
