fx_version "bodacious"
game "gta5"
lua54 "yes"

shared_scripts {
    '@loader/shared-side/core.lua'
}

client_scripts {
	"@vrp/config/Native.lua"
}

shuffle_client {
    'client-side/core.lua',
	'client-side/helicam.lua',
	'client-side/peds.lua',
	'client-side/vdamage.lua'
}