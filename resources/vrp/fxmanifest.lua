fx_version "bodacious"
game "gta5"
lua54 "yes"
creative_network "extended"

client_scripts {
	"lib/Utils.lua",

	"config/Native.lua",
	"config/Vehicle.lua",

	"client/base.lua",
	"client/gui.lua",
	"client/iplloader.lua",
	"client/noclip.lua",
	"client/objects.lua",
	"client/playanim.lua",
	"client/player.lua",
	"client/vehicles.lua"
}

server_scripts {
	"lib/Utils.lua",

	"config/Item.lua",
	"config/Native.lua",
	"config/Vehicle.lua",
	"config/Global.lua",

	"modules/vrp.lua",
	"modules/server.lua",
	"modules/prepare.lua"
}

files {
	"lib/*",
	"config/*",
	"config/**/*"
}

escrow_ignore {
	"Functions.lua"
}