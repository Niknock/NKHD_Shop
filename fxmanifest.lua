fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Niknock HD'
description 'NKHD Shop'
version '1.0.0'
     
shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts { 
    'client.lua',
    'config.lua'
}

server_script {
    'server.lua',
    'config.lua'
}

dependencies {
    'es_extended',
    'ox_target',
    'ox_inventory' 
}
