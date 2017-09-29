client_script "jobslegal_client.lua"
client_script "pooljob_client.lua"
client_script "trashjob_client.lua"

-- es_truckerjob - Remade. Rethink. Restructure. Mostly redone. By Draziak
client_script "trucker_client.lua"
client_script "mine_jobs.lua"
client_script "morg_client.lua"
client_script "org_client.lua"
client_script "journalist_jobs.lua"
client_script "mayor_jobs.lua"
client_script "taxi_jobs.lua"
client_script "tow_jobs.lua"
client_script "fishing_jobs.lua"
client_script "forge_jobs.lua"
client_script "vine_jobs.lua"
client_script "patating_jobs.lua"
client_script "fishing2_jobs.lua"
client_script "garda_client.lua"
client_script "anim_jobs.lua"
--client_script "motoshop.lua"


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    "morg_server.lua",
    "jobslegal_server.lua",
}
