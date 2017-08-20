client_script 'afterStart_client.lua'

server_script {
    '@mysql-async/lib/MySQL.lua',
    "afterStart_server.lua"
}
