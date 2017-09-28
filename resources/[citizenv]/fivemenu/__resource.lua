description "FiveMenu v1.0 by GeeknessFr"

server_script {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    '@common/middleware.lua',
	'inventory.lua',
	'fivemenu_server.lua',
	'outfits_server.lua',
	'inventory_server.lua',
	'police_server.lua',
	'drogue_serveur.lua',
	'tel_server.lua',
	'poleemploi_server.lua',
	'menumedic_server.lua',
	'menutow_server.lua',
	'menutaxi_server.lua',
	'menugarde_server.lua',
	'menupres_server.lua',
	'apart_server.lua',
	'menugarda_server.lua',
    'menuls_server.lua',
    'menuthelost_server.lua',
    'menuasso_server.lua',
    'menucartel_server.lua'
}

client_script {
	'client_data.lua',
	'outfits.lua',
	'inventory.lua',
	'fivemenu_client.lua',
	'fivemenu_functions.lua',
	'outfits_client.lua',
	'inventory_client.lua',
	'police_client.lua',
	'transporter_client.lua',
	'drogue_client.lua',
	'tel_client.lua',
	'distributeur_client.lua',
	'animations_client.lua',
	'localization.lua',
	'menumedic_client.lua',
	'menutow_client.lua',
	'menutaxi_client.lua',
	'menugarde_client.lua',
	'menupres_client.lua',
	'apart_client.lua',
	'menugarda_client.lua',
    'menuls_client.lua',
    'menuthelost_client.lua',
    'menuasso_client.lua',
    'menucartel_client.lua'
	--'GUI.lua'
}
dependencies {
    "mysql-async"
}

dependencies {
    "mysql-async"
}
