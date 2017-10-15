resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	'warmenu.lua',
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@common/lalife.lua',
	'@common/player/index.lua',
	'@common/player/manager.lua',
	'@common/middleware.lua',
	'server.lua',
}
