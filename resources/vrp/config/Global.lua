-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
ModeLicense = "license"
SalaryPremiumPrice = 1275
RolepassInitial =  1709348400
SpawnCoords = vec3(-27.45,-145.84,55.99)
PrisonCoords = vec3(1896.15,2604.44,45.75)
DiscordLink = "https://discord.gg/CUchQzJaXF"
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
Discord = {
	["Connect"] = "",
	["Disconnect"] = "",
	["Airport"] = "",
	["Deaths"] = "",
	["Gemstone"] = "",
	["Login"] = "",
	["Payments"] = "",
	["Roles"] = "",
	["Admin"] = "",
	["Loja"] = "",
	["Peak"] = "",
	["Policia"] = "",
	["Paramedico"] = "",
	["Burgershot"] = "",
	["UwuCoffee"] = "",
	["Ballas"] = "",
	["Vagos"] = "",
	["Families"] = "",
	["Aztecas"] = "",
	["Bloods"] = "",
	["DaNangBoys"] = "",
	["Leone"] = "",
	["ONeilBrothers"] = "",
	["Rednecks"] = "",
	["Triads"] = ""
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
Groups = {
	["Admin"] = {
		["Parent"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { "Administrador","Moderador","Suporte" },
		["Salary"] = { 0,0,0 },
		["Service"] = {},
		["Discord"] = "1058139019797602345", -- ID do Cargo
		["Client"] = true
	},
	["Premium"] = {
		["Parent"] = {
			["Premium"] = true
		},
		["Hierarchy"] = { "Premium" },
		["Salary"] = { 2000 },
		["Service"] = {},
		["Discord"] = "1059636134730276914",
		["Client"] = true
	},
	["Policia"] = {
		["Parent"] = {
			["Policia"] = true
		},
		["Hierarchy"] = { "Chefe","Capitão","Tenente","Sargento","Corporal","Oficial","Cadete" },
		["Salary"] = { 2725,2500,2500,2225,2225,2000,2000 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059634608972500992",
		["Client"] = true
	},
	["Paramedico"] = {
		["Parent"] = {
			["Paramedico"] = true
		},
		["Hierarchy"] = { "Diretor","Assistente","Conselheiro","Médico","Enfermeiro","Residente" },
		["Salary"] = { 2725,2500,2500,2225,2225,2000 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059634665893396510",
		["Client"] = true
	},
	["AutoExotic"] = {
		["Parent"] = {
			["AutoExotic"] = true
		},
		["Hierarchy"] = { "Chefe", "Sub-Chefe", "Gerente", "Mecânico", "Aprendiz" },
		["Salary"] = { 2500,2250,2000,1750,1500 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059634665893396510",
		["Client"] = true
	},
	["MosleyAuto"] = {
		["Parent"] = {
			["MosleyAuto"] = true
		},
		["Hierarchy"] = { "Chefe", "Sub-Chefe", "Gerente", "Mecânico", "Aprendiz" },
		["Salary"] = { 2500,2250,2000,1750,1500 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059634665893396510",
		["Client"] = true
	},
	["Burgershot"] = {
		["Parent"] = {
			["Burgershot"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1070089513336053953",
		["Client"] = true,
		["Max"] = 30
	},
	["UwuCoffee"] = {
		["Parent"] = {
			["UwuCoffee"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1105293867848310894",
		["Client"] = true,
		["Max"] = 30
	},
	["Ballas"] = {
		["Parent"] = {
			["Ballas"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059634952544718938",
		["Client"] = true,
		["Max"] = 30
	},
	["Vagos"] = {
		["Parent"] = {
			["Vagos"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059635003237085185",
		["Client"] = true,
		["Max"] = 30
	},
	["Families"] = {
		["Parent"] = {
			["Families"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059635060346724413",
		["Client"] = true,
		["Max"] = 30
	},
	["Aztecas"] = {
		["Parent"] = {
			["Aztecas"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1059635119838740560",
		["Client"] = true,
		["Max"] = 30
	},
	["Bloods"] = {
		["Parent"] = {
			["Bloods"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1104911581487312976",
		["Client"] = true,
		["Max"] = 30
	},
	["DaNangBoys"] = {
		["Parent"] = {
			["DaNangBoys"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1115621300296228874",
		["Client"] = true,
		["Max"] = 30
	},
	["Leone"] = {
		["Parent"] = {
			["Leone"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1115621331384422563",
		["Client"] = true,
		["Max"] = 30
	},
	["ONeilBrothers"] = {
		["Parent"] = {
			["ONeilBrothers"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1115621359561748490",
		["Client"] = true,
		["Max"] = 30
	},
	["Rednecks"] = {
		["Parent"] = {
			["Rednecks"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1115621384568189009",
		["Client"] = true,
		["Max"] = 30
	},
	["Triads"] = {
		["Parent"] = {
			["Triads"] = true
		},
		["Hierarchy"] = { "Chefe","Sub-Chefe","Gerente","Conselheiro","Membro" },
		["Salary"] = { 0,0,0,0,0 },
		["Service"] = {},
		["Type"] = "Work",
		["Discord"] = "1115621404063322112",
		["Client"] = true,
		["Max"] = 30
	},
-------------------------------------------------------------------------------------------------------------------------------------
-- NOTHIERARCHY
-------------------------------------------------------------------------------------------------------------------------------------
	["Camera"] = {
		["Parent"] = {
			["Camera"] = true
		},
		["Hierarchy"] = { "Utilizador" },
		["Service"] = {}
	},
	["Emergencia"] = {
		["Parent"] = {
			["Policia"] = true,
			["Paramedico"] = true
		},
		["Hierarchy"] = { "Membro" },
		["Service"] = {}
	},
	["Restaurantes"] = { -- Não remover este grupo.
		["Parent"] = {
			["Burgershot"] = true,
			["UwuCoffee"] = true
		},
		["Hierarchy"] = { "Membro" },
		["Service"] = {}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITIAL
-----------------------------------------------------------------------------------------------------------------------------------------
Initial = {
	["mp_m_freemode_01"] = {
		["pants"] = { item = 4, texture = 1 },
		["arms"] = { item = 0, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 273, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["shoes"] = { item = 1, texture = 6 },
		["mask"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["hat"] = { item = -1, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 }
	},
	["mp_f_freemode_01"] = {
		["pants"] = { item = 4, texture = 1 },
		["arms"] = { item = 14, texture = 0 },
		["tshirt"] = { item = 3, texture = 0 },
		["torso"] = { item = 338, texture = 2 },
		["vest"] = { item = 0, texture = 0 },
		["shoes"] = { item = 1, texture = 6 },
		["mask"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["hat"] = { item = -1, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERITENS (Itens recebidos ao criar o personagem)
-----------------------------------------------------------------------------------------------------------------------------------------
CharacterItens = {
	["water"] = 1,
	["sandwich"] = 1,
	["cellphone"] = 1
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
GroupBlips = {
	["Policia"] = true,
	["Paramedico"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPSERVICES
-----------------------------------------------------------------------------------------------------------------------------------------
GroupServices = {
	["Policia"] = true,
	["Paramedico"] = true,
	["Burgershot"] = true,
	["UwuCoffee"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRESTITENS
-----------------------------------------------------------------------------------------------------------------------------------------
ArrestItens = {
	["WEAPON_PICKAXE"] = true,
	["ATTACH_FLASHLIGHT"] = true,
	["ATTACH_CROSSHAIR"] = true,
	["ATTACH_SILENCER"] = true,
	["ATTACH_MAGAZINE"] = true,
	["ATTACH_GRIP"] = true,
	["explosives"] = true,
	["blocksignal"] = true,
	["vest"] = true,
	["joint"] = true,
	["weedsack"] = true,
	["cocaine"] = true,
	["cokesack"] = true,
	["codeine"] = true,
	["amphetamine"] = true,
	["meth"] = true,
	["methsack"] = true,
	["lockpick"] = true,
	["handcuff"] = true,
	["rope"] = true,
	["hood"] = true,
	["dollars2"] = true,
	["WEAPON_HATCHET"] = true,
	["WEAPON_BAT"] = true,
	["WEAPON_FROST"] = true,
	["WEAPON_KATANA"] = true,
	["WEAPON_THERMAL"] = true,
	["WEAPON_KARAMBIT"] = true,
	["WEAPON_BATTLEAXE"] = true,
	["WEAPON_CROWBAR"] = true,
	["WEAPON_SWITCHBLADE"] = true,
	["WEAPON_GOLFCLUB"] = true,
	["WEAPON_HAMMER"] = true,
	["WEAPON_MACHETE"] = true,
	["WEAPON_POOLCUE"] = true,
	["WEAPON_STONE_HATCHET"] = true,
	["WEAPON_WRENCH"] = true,
	["WEAPON_KNUCKLE"] = true,
	["WEAPON_FLASHLIGHT"] = true,
	["WEAPON_NIGHTSTICK"] = true,
	["WEAPON_PISTOL"] = true,
	["WEAPON_PISTOL_MK2"] = true,
	["WEAPON_COMPACTRIFLE"] = true,
	["WEAPON_APPISTOL"] = true,
	["WEAPON_HEAVYPISTOL"] = true,
	["WEAPON_MACHINEPISTOL"] = true,
	["WEAPON_MICROSMG"] = true,
	["WEAPON_NAILGUN"] = true,
	["WEAPON_RPG"] = true,
	["WEAPON_MINISMG"] = true,
	["WEAPON_SNSPISTOL"] = true,
	["WEAPON_SNSPISTOL_MK2"] = true,
	["WEAPON_VINTAGEPISTOL"] = true,
	["WEAPON_PISTOL50"] = true,
	["WEAPON_COMBATPISTOL"] = true,
	["WEAPON_PARAFAL"] = true,
	["WEAPON_FNFAL"] = true,
	["WEAPON_FNSCAR"] = true,
	["WEAPON_QBZ83"] = true,
	["WEAPON_COLTXM177"] = true,
	["WEAPON_CARBINERIFLE"] = true,
	["WEAPON_CARBINERIFLE_MK2"] = true,
	["WEAPON_ADVANCEDRIFLE"] = true,
	["WEAPON_BULLPUPRIFLE"] = true,
	["WEAPON_BULLPUPRIFLE_MK2"] = true,
	["WEAPON_SPECIALCARBINE"] = true,
	["WEAPON_SPECIALCARBINE_MK2"] = true,
	["WEAPON_PUMPSHOTGUN"] = true,
	["WEAPON_PUMPSHOTGUN_MK2"] = true,
	["WEAPON_MUSKET"] = true,
	["WEAPON_SAUER"] = true,
	["WEAPON_SAWNOFFSHOTGUN"] = true,
	["WEAPON_SMG"] = true,
	["WEAPON_SMG_MK2"] = true,
	["WEAPON_TACTICALRIFLE"] = true,
	["WEAPON_HEAVYRIFLE"] = true,
	["WEAPON_ASSAULTRIFLE"] = true,
	["WEAPON_ASSAULTRIFLE_MK2"] = true,
	["WEAPON_ASSAULTSMG"] = true,
	["WEAPON_GUSENBERG"] = true,
	["WEAPON_STUNGUN"] = true,
	["WEAPON_RPG_AMMO"] = true,
	["WEAPON_NAIL_AMMO"] = true,
	["WEAPON_PISTOL_AMMO"] = true,
	["WEAPON_SMG_AMMO"] = true,
	["WEAPON_RIFLE_AMMO"] = true,
	["WEAPON_SHOTGUN_AMMO"] = true,
	["WEAPON_MUSKET_AMMO"] = true,
	["WEAPON_BRICK"] = true,
	["WEAPON_SNOWBALL"] = true,
	["WEAPON_SHOES"] = true,
	["WEAPON_MOLOTOV"] = true,
	["WEAPON_SMOKEGRENADE"] = true,
	["pager"] = true,
	["oxy"] = true,
	["crack"] = true,
	["heroin"] = true,
	["metadone"] = true,
	["soap"] = true,
	["racecoin"] = true,
	["races"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRITENS
-----------------------------------------------------------------------------------------------------------------------------------------
RepairItens = {
	["repairkit01"] = true,
	["repairkit02"] = true,
	["repairkit03"] = true,
	["repairkit04"] = true,
	["sewingkit"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOXES
-----------------------------------------------------------------------------------------------------------------------------------------
Boxes = {
	["treasurebox"] = {
		["Multiplier"] = 5,
		["List"] = {
			{ ["Item"] = "sapphire_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "emerald_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "ruby_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "gold_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "iron_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "lead_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "sulfur_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "tin_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "diamond_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "copper_pure", ["Min"] = 8, ["Max"] = 16 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GSRWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
GsrWeapons = {
	["WEAPON_SMG"] = true,
	["WEAPON_PISTOL"] = true,
	["WEAPON_PUMPSHOTGUN"] = true,
	["WEAPON_CARBINERIFLE"] = true,
	["WEAPON_TACTICALRIFLE"] = true,
	["WEAPON_STUNGUN"] = true,
	["WEAPON_COMBATPISTOL"] = true,
	["WEAPON_HEAVYPISTOL"] = true,
	["WEAPON_NIGHTSTICK"] = true,
	["WEAPON_MUSKET"] = true,
	["WEAPON_SAUER"] = true
}