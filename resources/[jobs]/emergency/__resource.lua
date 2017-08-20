-- Manifest
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Requiring essentialmode
dependency 'essentialmode'

-- Emergency
client_script 'client/cl_healthplayer.lua'
client_script 'client/cl_emergency.lua'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
    'server/sv_emergency.lua'
}
