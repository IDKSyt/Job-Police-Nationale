fx_version 'adamant'
game 'gta5'
author 'USER LEAK'S FR SHOP'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua"
}

client_scripts {
    'client.lua',
    'config.lua',
    'cl_boss.lua',
    'cl_radar.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'config.lua',
}

dependencies {
	'es_extended'
}
