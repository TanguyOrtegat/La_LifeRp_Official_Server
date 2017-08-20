client_script 'cshop.lua'
client_script 'cshopmask.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    'sv_cshop.lua'
}