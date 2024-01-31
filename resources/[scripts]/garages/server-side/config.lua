DvPermission = "Admin-1"
CarPermission = "Admin-1"
ArrestValue = 0.1 -- Valor para liberação do veículo apreendido
TaxValue = 0.15 -- Valor do IPVA do veículo
SellValue = 0.5 -- Valor de venda do veículo
OpenVehicles = "Policia" -- Permissão para abrir todos os veículos pela tecla L
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES
-----------------------------------------------------------------------------------------------------------------------------------------
Garages = {
	["1"] = { ["Name"] = "Garage" },
	["2"] = { ["Name"] = "Garage" },
	["3"] = { ["Name"] = "Garage" },
	["4"] = { ["Name"] = "Garage" },
	["5"] = { ["Name"] = "Garage" },
	["6"] = { ["Name"] = "Garage" },
	["7"] = { ["Name"] = "Garage" },
	["8"] = { ["Name"] = "Garage" },
	["9"] = { ["Name"] = "Garage" },
	["10"] = { ["Name"] = "Garage" },
	["11"] = { ["Name"] = "Garage" },
	["12"] = { ["Name"] = "Garage" },
	["13"] = { ["Name"] = "Garage" },
	["14"] = { ["Name"] = "Garage" },
	["15"] = { ["Name"] = "Garage" },
	["16"] = { ["Name"] = "Garage" },
	["17"] = { ["Name"] = "Garage" },
	["18"] = { ["Name"] = "Garage" },
	["19"] = { ["Name"] = "Garage" },
	["20"] = { ["Name"] = "Garage" },
	["21"] = { ["Name"] = "Garage" },
	["22"] = { ["Name"] = "Garage" },
	["23"] = { ["Name"] = "Garage" },
	["24"] = { ["Name"] = "Garage" },
	["25"] = { ["Name"] = "Garage" },
	["26"] = { ["Name"] = "Garage" },

	-- Paramedic
	["41"] = { ["Name"] = "Paramedico", ["Permission"] = "Paramedico" },
	["42"] = { ["Name"] = "Paramedico2", ["Permission"] = "Paramedico" },

	["43"] = { ["Name"] = "Paramedico", ["Permission"] = "Paramedico" },
	["44"] = { ["Name"] = "Paramedico2", ["Permission"] = "Paramedico" },

	["45"] = { ["Name"] = "Cadeira", ["Permission"] = "Paramedico" },

	-- Police
	["61"] = { ["Name"] = "Policia", ["Permission"] = "Policia" },
	["62"] = { ["Name"] = "Policia2", ["Permission"] = "Policia" },
	["63"] = { ["Name"] = "Policia3", ["Permission"] = "Policia" },

	["91"] = { ["Name"] = "Burgershot", ["Permission"] = "Burgershot" },
	["92"] = { ["Name"] = "UwuCoffee", ["Permission"] = "UwuCoffee" },

	-- Boats
	["121"] = { ["Name"] = "Boats" },
	["122"] = { ["Name"] = "Boats" },
	["123"] = { ["Name"] = "Boats" },
	["124"] = { ["Name"] = "Boats" },

	["131"] = { ["Name"] = "Helicopters" },

	-- Works
	["141"] = { ["Name"] = "Lumberman" },
	["142"] = { ["Name"] = "Driver" },
	["143"] = { ["Name"] = "Garbageman" },
	["144"] = { ["Name"] = "Transporter" },
	["145"] = { ["Name"] = "Garbageman" },
	["146"] = { ["Name"] = "Garbageman" },
	["147"] = { ["Name"] = "Trucker" },
	["148"] = { ["Name"] = "Taxi" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
Works = {
	["Helicopters"] = {
		"maverick",
		"volatus",
		"supervolito",
		"havok"
	},
	["Paramedico"] = {
		"lguard",
		"blazer2",
		"firetruk"
	},
	["Paramedico2"] = {
		"polmav"
	},
	["Policia"] = {
		"polvic",
		"komodapol",
		"r1250pol",
		"nc700pol",
		"polchar",
		"ballerpol",
		"elegy2pol",
		"fugitivepol",
		"kurumapol",
		"oracle2pol",
		"police3pol",
		"policepol",
		"policetpol",
		"schafter2pol",
		"sheriff2pol",
		"sultanrspol",
		"tailgater2pol",
		"polcorv",
		"polchall",
		"poltang"
	},
	["Policia2"] = {
		"polmav"
	},
	["Policia3"] = {
		"pbus",
		"riot"
	},
	["Driver"] = {
		"bus"
	},
	["Boats"] = {
		"dinghy",
		"jetmax",
		"marquis",
		"seashark",
		"speeder",
		"squalo",
		"suntrap",
		"toro",
		"tropic"
	},
	["Transporter"] = {
		"stockade"
	},
	["Lumberman"] = {
		"ratloader"
	},
	["Garbageman"] = {
		"trash"
	},
	["Taxi"] = {
		"taxi"
	},
	["Trucker"] = {
		"packer"
	},
	["Cadeira"] = {
		"wheelchair"
	}
}