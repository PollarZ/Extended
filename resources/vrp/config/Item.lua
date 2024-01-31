
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["vehiclevip"] = {
		["Index"] = "vehiclevip",
		["Name"] = "Cartão Veicular",
		["Description"] = "Alugue um veículo de até <green>6.000</green> diamantes.",
		["Type"] = "Usável",
		["Weight"] = 0.0,
		["Economy"] = 210000,
		["Block"] = true,
		["Clear"] = true
	},
	["dismantle"] = {
		["Index"] = "dismantle",
		["Name"] = "Contrato",
		["Type"] = "Usável",
		["Weight"] = 0.0
	},
	["recyclable"] = {
		["Index"] = "recyclable",
		["Name"] = "Material Reciclável",
		["Type"] = "Usável",
		["Weight"] = 0.010,
		["Economy"] = 5
	},
	["ration"] = {
		["Index"] = "ration",
		["Name"] = "Ração Animal",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 125
	},
	["coyote1star"] = {
		["Index"] = "box1star",
		["Name"] = "Coyote",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 225
	},
	["coyote2star"] = {
		["Index"] = "box2star",
		["Name"] = "Coyote",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 375
	},
	["coyote3star"] = {
		["Index"] = "box3star",
		["Name"] = "Coyote",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 575
	},
	["mtlion1star"] = {
		["Index"] = "box1star",
		["Name"] = "Puma",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 225
	},
	["mtlion2star"] = {
		["Index"] = "box2star",
		["Name"] = "Puma",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 375
	},
	["mtlion3star"] = {
		["Index"] = "box3star",
		["Name"] = "Puma",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 575
	},
	["boar1star"] = {
		["Index"] = "box1star",
		["Name"] = "Javali",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 225
	},
	["boar2star"] = {
		["Index"] = "box2star",
		["Name"] = "Javali",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 375
	},
	["boar3star"] = {
		["Index"] = "box3star",
		["Name"] = "Javali",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 575
	},
	["deer1star"] = {
		["Index"] = "box1star",
		["Name"] = "Cervo",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 225
	},
	["deer2star"] = {
		["Index"] = "box2star",
		["Name"] = "Cervo",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 375
	},
	["deer3star"] = {
		["Index"] = "box3star",
		["Name"] = "Cervo",
		["Type"] = "Comum",
		["Weight"] = 2.25,
		["Economy"] = 575
	},
	["gunpowder"] = {
		["Index"] = "gunpowder",
		["Name"] = "Pólvora",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 50
	},
	["racecoin"] = {
		["Index"] = "racecoin",
		["Name"] = "Platina",
		["Type"] = "Comum",
		["Weight"] = 0.001,
		["Economy"] = 10
	},
	["treasurebox"] = {
		["Index"] = "treasurebox",
		["Name"] = "Baú do Tesouro",
		["Type"] = "Usável",
		["Weight"] = 4.25,
		["Unique"] = true,
		["Economy"] = 3000,
		["Drops"] = true
	},
	["fishingrod"] = {
		["Index"] = "fishingrod",
		["Name"] = "Vara de Pescar",
		["Type"] = "Usável",
		["Weight"] = 1.25,
		["Economy"] = 725
	},
	["worm"] = {
		["Index"] = "worm",
		["Name"] = "Minhoca",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 5
	},
	["anchovy"] = {
		["Index"] = "anchovy",
		["Name"] = "Anchova",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["catfish"] = {
		["Index"] = "catfish",
		["Name"] = "Peixe-Gato",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["herring"] = {
		["Index"] = "herring",
		["Name"] = "Arenque",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 50
	},
	["orangeroughy"] = {
		["Index"] = "orangeroughy",
		["Name"] = "Peixe Relógio",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["salmon"] = {
		["Index"] = "salmon",
		["Name"] = "Salmão",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 55
	},
	["sardine"] = {
		["Index"] = "sardine",
		["Name"] = "Sardinha",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 35
	},
	["smallshark"] = {
		["Index"] = "smallshark",
		["Name"] = "Tubarão Pequeno",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 100
	},
	["smalltrout"] = {
		["Index"] = "smalltrout",
		["Name"] = "Truta Pequena",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 40
	},
	["yellowperch"] = {
		["Index"] = "yellowperch",
		["Name"] = "Poleiro Amarelo",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 45
	},
	["sewingkit"] = {
		["Index"] = "sewingkit",
		["Name"] = "Kit de Costura",
		["Description"] = "Utilizado para reparar mochilas <b>Pequenas</b>, <b>Médias</b> e <b>Grandes</b>.",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 50000,
		["Clear"] = true
	},
	["suitcase"] = {
		["Index"] = "suitcase",
		["Name"] = "Maleta",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 275,
		["Unique"] = true,
		["Drops"] = true
	},
	["backpackp"] = {
		["Index"] = "backpackp",
		["Name"] = "Mochila Pequena",
		["Description"] = "Um compartimento sobressalente com <b>50 Kg</b> e <b>20 Slots</b> utilizado para guardar seus pertences valiosos.",
		["Repair"] = "sewingkit",
		["Type"] = "Usável",
		["Durability"] = 720,
		["Weight"] = 7.5,
		["Economy"] = 50000,
		["Unique"] = true,
		["Drops"] = true,
		["Clear"] = true
	},
	["backpackm"] = {
		["Index"] = "backpackm",
		["Name"] = "Mochila Média",
		["Description"] = "Um compartimento sobressalente com <b>75 Kg</b> e <b>25 Slots</b> utilizado para guardar seus pertences valiosos.",
		["Repair"] = "sewingkit",
		["Type"] = "Usável",
		["Durability"] = 720,
		["Weight"] = 10.0,
		["Economy"] = 75000,
		["Unique"] = true,
		["Drops"] = true,
		["Clear"] = true
	},
	["backpackg"] = {
		["Index"] = "backpackg",
		["Name"] = "Mochila Grande",
		["Description"] = "Um compartimento sobressalente com <b>100 Kg</b> e <b>30 Slots</b> utilizado para guardar seus pertences valiosos.",
		["Repair"] = "sewingkit",
		["Type"] = "Usável",
		["Durability"] = 720,
		["Weight"] = 12.5,
		["Economy"] = 100000,
		["Unique"] = true,
		["Drops"] = true,
		["Clear"] = true
	},
	["sapphire_ore"] = {
		["Index"] = "sapphire_ore",
		["Name"] = "Minério de Safira",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["emerald_ore"] = {
		["Index"] = "emerald_ore",
		["Name"] = "Minério de Esmeralda",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["ruby_ore"] = {
		["Index"] = "ruby_ore",
		["Name"] = "Minério de Ruby",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["gold_ore"] = {
		["Index"] = "gold_ore",
		["Name"] = "Minério de Ouro",
		["Type"] = "Comum",
		["Weight"] = 0.50
	},
	["iron_ore"] = {
		["Index"] = "iron_ore",
		["Name"] = "Minério de Ferro",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["lead_ore"] = {
		["Index"] = "lead_ore",
		["Name"] = "Minério de Chumbo",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["sulfur_ore"] = {
		["Index"] = "sulfur_ore",
		["Name"] = "Minério de Enxofre",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["tin_ore"] = {
		["Index"] = "tin_ore",
		["Name"] = "Minério de Estanho",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["diamond_ore"] = {
		["Index"] = "diamond_ore",
		["Name"] = "Minério de Diamante",
		["Type"] = "Comum",
		["Weight"] = 0.40
	},
	["copper_ore"] = {
		["Index"] = "copper_ore",
		["Name"] = "Minério de Cobre",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["sapphire_pure"] = {
		["Index"] = "sapphire_pure",
		["Name"] = "Safira Lapidada",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["emerald_pure"] = {
		["Index"] = "emerald_pure",
		["Name"] = "Esmeralda Lapidada",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["ruby_pure"] = {
		["Index"] = "ruby_pure",
		["Name"] = "Ruby Lapidado",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["gold_pure"] = {
		["Index"] = "gold_pure",
		["Name"] = "Barra de Ouro",
		["Type"] = "Comum",
		["Weight"] = 0.50
	},
	["iron_pure"] = {
		["Index"] = "iron_pure",
		["Name"] = "Barra de Ferro",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["lead_pure"] = {
		["Index"] = "lead_pure",
		["Name"] = "Barra de Chumbo",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["sulfur_pure"] = {
		["Index"] = "sulfur_pure",
		["Name"] = "Enxofre",
		["Type"] = "Comum",
		["Weight"] = 0.35
	},
	["tin_pure"] = {
		["Index"] = "tin_pure",
		["Name"] = "Barra de Estanho",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["diamond_pure"] = {
		["Index"] = "diamond_pure",
		["Name"] = "Diamante Lapidado",
		["Type"] = "Comum",
		["Weight"] = 0.40
	},
	["copper_pure"] = {
		["Index"] = "copper_pure",
		["Name"] = "Barra de Cobre",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["binoculars"] = {
		["Index"] = "binoculars",
		["Name"] = "Binóculos",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 1.0,
		["Economy"] = 425
	},
	["camera"] = {
		["Index"] = "camera",
		["Name"] = "Câmera",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 1.0,
		["Economy"] = 425
	},
	["creditcard"] = {
		["Index"] = "creditcard",
		["Name"] = "Cartão de Crédito",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Clear"] = true,
		["Economy"] = 10
	},
	["diagram"] = {
		["Index"] = "diagram",
		["Name"] = "Diagrama",
		["Description"] = "Aumenta <b>10kg</b> de um compartimento ou <b>5kg</b> de sua mochila.",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 12500,
		["Clear"] = true,
		["Drops"] = true
	},
	["propertys"] = {
		["Index"] = "propertys",
		["Name"] = "Cartão de Segurança",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Clear"] = true,
		["Economy"] = 10
	},
	["repairkit01"] = {
		["Index"] = "repairkit01",
		["Name"] = "Kit de Reparos - Comum",
		["Type"] = "Comum",
		["Weight"] = 3.25,
		["Economy"] = 975
	},
	["repairkit02"] = {
		["Index"] = "repairkit02",
		["Name"] = "Kit de Reparos - Raro",
		["Type"] = "Comum",
		["Weight"] = 3.75,
		["Economy"] = 2275
	},
	["repairkit03"] = {
		["Index"] = "repairkit03",
		["Name"] = "Kit de Reparos - Épico",
		["Type"] = "Comum",
		["Weight"] = 4.25,
		["Economy"] = 6725
	},
	["repairkit04"] = {
		["Index"] = "repairkit04",
		["Name"] = "Kit de Reparos - Lendário",
		["Type"] = "Comum",
		["Weight"] = 5.75,
		["Economy"] = 10225
	},
	["WEAPON_PICKAXE"] = {
		["Index"] = "pickaxe",
		["Name"] = "Picareta",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 240,
		["Weight"] = 2.25,
		["Economy"] = 725
	},
	["WEAPON_PICKAXE_PLUS"] = {
		["Index"] = "pickaxe_plus",
		["Name"] = "Picareta de Diamante",
		["Description"] = "Reduz o tempo de minerar.",
		["Repair"] = "repairkit04",
		["Type"] = "Comum",
		["Durability"] = 720,
		["Weight"] = 2.25,
		["Economy"] = 62500,
		["Clear"] = true,
		["Drops"] = true
	},
	["nigirizushi"] = {
		["Index"] = "nigirizushi",
		["Name"] = "Nigirizushi",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.65,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["sushi"] = {
		["Index"] = "sushi",
		["Name"] = "Sushi",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.65,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["cupcake"] = {
		["Index"] = "cupcake",
		["Name"] = "Cupcake",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["milkshake"] = {
		["Index"] = "milkshake",
		["Name"] = "Milk-shake",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.85,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["milkshakepeanut"] = {
		["Index"] = "milkshakepeanut",
		["Name"] = "Milk-shake de Paçoca",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.85,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["cappuccino"] = {
		["Index"] = "cappuccino",
		["Name"] = "Cappuccino",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.65,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["applelove"] = {
		["Index"] = "applelove",
		["Name"] = "Maça do Amor",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["races"] = {
		["Index"] = "races",
		["Name"] = "Credencial",
		["Type"] = "Comum",
		["Weight"] = 0.25
	},
	["nitro"] = {
		["Index"] = "nitro",
		["Name"] = "Nitro",
		["Type"] = "Usável",
		["Weight"] = 7.25,
		["Economy"] = 725
	},
	["postit"] = {
		["Index"] = "postit",
		["Name"] = "Post-It",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 20
	},
	["ATTACH_FLASHLIGHT"] = {
		["Index"] = "attach_flashlight",
		["Name"] = "Lanterna Tatica",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 2175
	},
	["ATTACH_CROSSHAIR"] = {
		["Index"] = "attach_crosshair",
		["Name"] = "Mira Holográfica",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 2175
	},
	["ATTACH_SILENCER"] = {
		["Index"] = "attach_silencer",
		["Name"] = "Silenciador",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 2175
	},
	["ATTACH_MAGAZINE"] = {
		["Index"] = "attach_magazine",
		["Name"] = "Pente Estendido",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 2175
	},
	["ATTACH_GRIP"] = {
		["Index"] = "attach_grip",
		["Name"] = "Empunhadura",
		["Type"] = "Usável",
		["Weight"] = 1.0,
		["Economy"] = 2175
	},
	["barrier"] = {
		["Index"] = "barrier",
		["Name"] = "Barreira",
		["Type"] = "Usável",
		["Weight"] = 1.75
	},
	["medicbag"] = {
		["Index"] = "medicbag",
		["Name"] = "Bolsa Médica",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 168,
		["Weight"] = 2.75,
		["Economy"] = 425
	},
	["techtrash"] = {
		["Index"] = "techtrash",
		["Name"] = "Lixo Eletrônico",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 125
	},
	["tarp"] = {
		["Index"] = "tarp",
		["Name"] = "Lona",
		["Type"] = "Comum",
		["Weight"] = 0.60,
		["Economy"] = 50
	},
	["sheetmetal"] = {
		["Index"] = "sheetmetal",
		["Name"] = "Chapa de Metal",
		["Type"] = "Comum",
		["Weight"] = 0.65,
		["Economy"] = 50
	},
	["roadsigns"] = {
		["Index"] = "roadsigns",
		["Name"] = "Placas de Trânsito",
		["Type"] = "Comum",
		["Weight"] = 0.60,
		["Economy"] = 50
	},
	["luckywheelpass"] = {
		["Index"] = "luckywheelpass",
		["Name"] = "Vale - Roda da Fortuna",
		["Description"] = "Leve até o cassino para usa-lo.",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 5000
	},
	["explosives"] = {
		["Index"] = "explosives",
		["Name"] = "Explosivos",
		["Type"] = "Comum",
		["Weight"] = 0.45,
		["Economy"] = 75
	},
	["blocksignal"] = {
		["Index"] = "blocksignal",
		["Name"] = "Bloqueador de Sinal",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 325
	},
	["sulfuric"] = {
		["Index"] = "sulfuric",
		["Name"] = "Ácido Sulfúrico",
		["Type"] = "Usável",
		["Weight"] = 0.45,
		["Economy"] = 30
	},
	["saline"] = {
		["Index"] = "saline",
		["Name"] = "Soro Fisiológico",
		["Type"] = "Comum",
		["Weight"] = 0.35,
		["Economy"] = 25
	},
	["alcohol"] = {
		["Index"] = "alcohol",
		["Name"] = "Álcool",
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 40
	},
	["syringe"] = {
		["Index"] = "syringe",
		["Name"] = "Seringa",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 2
	},
	["syringe01"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa A+",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["syringe02"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa B+",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["syringe03"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa A-",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["syringe04"] = {
		["Index"] = "syringe2",
		["Name"] = "Seringa B-",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 50
	},
	["foodjuice"] = {
		["Index"] = "foodjuice",
		["Name"] = "Copo de Suco",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10,
		["Max"] = 1
	},
	["foodburger"] = {
		["Index"] = "foodburger",
		["Name"] = "Caixa de Lanche",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 10,
		["Max"] = 1
	},
	["foodbox"] = {
		["Index"] = "foodbox",
		["Name"] = "Combo",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Economy"] = 120,
		["Max"] = 10
	},
	["vehkey"] = {
		["Index"] = "vehkey",
		["Name"] = "Chave Cópia",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 10
	},
	["gemstone"] = {
		["Index"] = "gemstone",
		["Name"] = "Diamante",
		["Type"] = "Usável",
		["Weight"] = 0.0,
		["Economy"] = 25,
		["Clear"] = true,
		["Drops"] = true
	},
	["radio"] = {
		["Index"] = "radio",
		["Name"] = "Rádio",
		["Type"] = "Usável",
		["Repair"] = "repairkit01",
		["Durability"] = 168,
		["Weight"] = 0.75,
		["Economy"] = 975
	},
	["vest"] = {
		["Index"] = "vest",
		["Name"] = "Colete",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 96,
		["Weight"] = 3.75,
		["Economy"] = 1200
	},
	["bandage"] = {
		["Index"] = "bandage",
		["Name"] = "Bandagem",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 225,
		["Max"] = 3
	},
	["medkit"] = {
		["Index"] = "medkit",
		["Name"] = "Kit Médico",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 575,
		["Max"] = 1
	},
	["pouch"] = {
		["Index"] = "pouch",
		["Name"] = "Malote",
		["Type"] = "Comum",
		["Weight"] = 1.25,
		["Economy"] = 80
	},
	["woodlog"] = {
		["Index"] = "woodlog",
		["Name"] = "Tora de Madeira",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["fishingrod"] = {
		["Index"] = "fishingrod",
		["Name"] = "Vara de Pescar",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 2.75,
		["Economy"] = 725
	},
	["joint"] = {
		["Index"] = "joint",
		["Name"] = "Cigarro de Cannabis",
		["Type"] = "Usável",
		["Weight"] = 0.45,
		["Economy"] = 30
	},
	["weedsack"] = {
		["Index"] = "weedsack",
		["Name"] = "Pacote de Cannabis",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 275
	},
	["cocaine"] = {
		["Index"] = "cocaine",
		["Name"] = "Carreira de Cocaína",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 30
	},
	["cokesack"] = {
		["Index"] = "cokesack",
		["Name"] = "Pacote de Cocaína",
		["Type"] = "Comum",
		["Weight"] = 0.50,
		["Economy"] = 275
	},
	["codeine"] = {
		["Index"] = "codeine",
		["Name"] = "Codeína",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 30
	},
	["amphetamine"] = {
		["Index"] = "amphetamine",
		["Name"] = "Anfetamina",
		["Type"] = "Comum",
		["Weight"] = 0.10,
		["Economy"] = 40
	},
	["meth"] = {
		["Index"] = "meth",
		["Name"] = "Metanfetamina Cristalizada",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 100
	},
	["methsack"] = {
		["Index"] = "methsack",
		["Name"] = "Pacote de Metanfetamina",
		["Type"] = "Usável",
		["Weight"] = 0.50,
		["Economy"] = 975
	},
	["acetone"] = {
		["Index"] = "acetone",
		["Name"] = "Acetona",
		["Type"] = "Comum",
		["Weight"] = 0.25,
		["Economy"] = 40
	},
	["premium"] = {
		["Index"] = "premium",
		["Name"] = "Premium",
		["Description"] = "Recebe <b>+25Kg</b> de peso na mochila<br>Salário de <b>$2.000</b> a cada <b>30</b> minutos<br>Não é cobrado o <b>Test-Drive</b><br><b>25%</b> de desconto em todos os impostos<br>Verificado no instagram<br>Conta secundária no instagram",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 150000,
		["Clear"] = true,
		["Drops"] = true
	},
	["premiumplate"] = {
		["Index"] = "platepremium",
		["Name"] = "Placa Premium",
		["Type"] = "Usável",
		["Description"] = "Personalize a placa do veículo.",
		["Weight"] = 0.75,
		["Economy"] = 125000,
		["Clear"] = true,
		["Drops"] = true
	},
	["chip"] = {
		["Index"] = "chip",
		["Name"] = "Chip Telefônico",
		["Type"] = "Usável",
		["Description"] = "Personalize o número do telefone.",
		["Weight"] = 0.75,
		["Economy"] = 187500,
		["Clear"] = true,
		["Drops"] = true
	},
	["newchars"] = {
		["Index"] = "newchars",
		["Name"] = "+1 Personagem",
		["Type"] = "Usável",
		["Description"] = "Aumenta 1 no limite de personagens.",
		["Weight"] = 0.25,
		["Economy"] = 187500,
		["Clear"] = true,
		["Drops"] = true
	},
	["namechange"] = {
		["Index"] = "namechange",
		["Name"] = "Troca de Nome",
		["Type"] = "Usável",
		["Description"] = "Modifica o nome.",
		["Weight"] = 0.25,
		["Economy"] = 100000,
		["Clear"] = true,
		["Drops"] = true
	},
	["guarananatural"] = {
		["Index"] = "guarananatural",
		["Name"] = "Guaraná Natural",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 100,
		["Scape"] = true,
		["Max"] = 3
	},
	["water"] = {
		["Index"] = "water",
		["Name"] = "Água",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 30,
		["Max"] = 3
	},
	["emptybottle"] = {
		["Index"] = "emptybottle",
		["Name"] = "Garrafa Vazia",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 30,
		["Max"] = 3
	},
	["coffee"] = {
		["Index"] = "coffee",
		["Name"] = "Copo de Café",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 20,
		["Max"] = 3
	},
	["coffeemilk"] = {
		["Index"] = "coffeemilk",
		["Name"] = "Café com Leite",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.35,
		["Economy"] = 100,
		["Scape"] = true,
		["Max"] = 3
	},
	["energetic"] = {
		["Index"] = "energetic",
		["Name"] = "Energético",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["cola"] = {
		["Index"] = "cola",
		["Name"] = "Cola",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["tacos"] = {
		["Index"] = "tacos",
		["Name"] = "Tacos",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 25,
		["Max"] = 3
	},
	["fries"] = {
		["Index"] = "fries",
		["Name"] = "Fritas",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["friesbacon"] = {
		["Index"] = "friesbacon",
		["Name"] = "Fritas com Bacon",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 75,
		["Scape"] = true,
		["Max"] = 3
	},
	["soda"] = {
		["Index"] = "soda",
		["Name"] = "Sprunk",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["cookies"] = {
		["Index"] = "cookies",
		["Name"] = "Cookies",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 60,
		["Scape"] = true,
		["Max"] = 3
	},
	["orangejuice"] = {
		["Index"] = "orangejuice",
		["Name"] = "Suco de Laranja",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["tangejuice"] = {
		["Index"] = "tangejuice",
		["Name"] = "Suco de Tangerina",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["grapejuice"] = {
		["Index"] = "grapejuice",
		["Name"] = "Suco de Uva",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["strawberryjuice"] = {
		["Index"] = "strawberryjuice",
		["Name"] = "Suco de Morango",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["bananajuice"] = {
		["Index"] = "bananajuice",
		["Name"] = "Suco de Banana",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["acerolajuice"] = {
		["Index"] = "acerolajuice",
		["Name"] = "Suco de Acerola",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["passionjuice"] = {
		["Index"] = "passionjuice",
		["Name"] = "Suco de Maracujá",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["hamburger"] = {
		["Index"] = "hamburger",
		["Name"] = "Hambúrguer",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 25,
		["Max"] = 3
	},
	["hamburger2"] = {
		["Index"] = "hamburger2",
		["Name"] = "Hambúrguer Artesanal",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["hamburger3"] = {
		["Index"] = "hamburger3",
		["Name"] = "Hambúrguer Vegetariano",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["onionrings"] = {
		["Index"] = "onionrings",
		["Name"] = "Anéis de Cebola",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 100,
		["Scape"] = true,
		["Max"] = 3
	},
	["chickenfries"] = {
		["Index"] = "chickenfries",
		["Name"] = "Frango Frito",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 125,
		["Scape"] = true,
		["Max"] = 3
	},
	["pizzamozzarella"] = {
		["Index"] = "pizzamozzarella",
		["Name"] = "Pizza de Muçarela",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["pizzabanana"] = {
		["Index"] = "pizzabanana",
		["Name"] = "Pizza de Banana",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["pizzachocolate"] = {
		["Index"] = "pizzachocolate",
		["Name"] = "Pizza de Chocolate",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.75,
		["Economy"] = 150,
		["Scape"] = true,
		["Max"] = 3
	},
	["calzone"] = {
		["Index"] = "calzone",
		["Name"] = "Calzone",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Scape"] = true,
		["Economy"] = 150,
		["Max"] = 3
	},
	["hotdog"] = {
		["Index"] = "hotdog",
		["Name"] = "Cachorro-Quente",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.45,
		["Economy"] = 15,
		["Max"] = 3
	},
	["donut"] = {
		["Index"] = "donut",
		["Name"] = "Rosquinha",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["plate"] = {
		["Index"] = "plate",
		["Name"] = "Placa",
		["Type"] = "Comum",
		["Weight"] = 0.75,
		["Economy"] = 525
	},
	["lockpick"] = {
		["Index"] = "lockpick",
		["Name"] = "Lockpick",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 72,
		["Weight"] = 1.25,
		["Economy"] = 925
	},
	["drift"] = {
		["Index"] = "drift",
		["Name"] = "Kit de Drift",
		["Type"] = "Usável",
		["Weight"] = 25.75,
		["Economy"] = 75000
	},
	["toolbox"] = {
		["Index"] = "toolbox",
		["Name"] = "Ferramentas Básicas",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 975,
		["Max"] = 3
	},
	["advtoolbox"] = {
		["Index"] = "toolbox",
		["Name"] = "Ferramentas Avançadas",
		["Type"] = "Usável",
		["Weight"] = 4.75,
		["Charges"] = 3,
		["Economy"] = 2725,
		["Max"] = 1
	},
	["tyres"] = {
		["Index"] = "tyres",
		["Name"] = "Pneu",
		["Type"] = "Usável",
		["Weight"] = 2.75,
		["Economy"] = 375,
		["Max"] = 3
	},
	["cellphone"] = {
		["Index"] = "cellphone",
		["Name"] = "Celular",
		["Repair"] = "repairkit01",
		["Type"] = "Comum",
		["Durability"] = 240,
		["Weight"] = 0.75,
		["Economy"] = 725
	},
	["scuba"] = {
		["Index"] = "scuba",
		["Name"] = "Roupa de Mergulho",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 4.75,
		["Economy"] = 975
	},
	["handcuff"] = {
		["Index"] = "handcuff",
		["Name"] = "Algemas",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 1.25,
		["Economy"] = 1425
	},
	["rope"] = {
		["Index"] = "rope",
		["Name"] = "Cordas",
		["Repair"] = "repairkit01",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 875
	},
	["hood"] = {
		["Index"] = "hood",
		["Name"] = "Capuz",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 1725
	},
	["plastic"] = {
		["Index"] = "plastic",
		["Name"] = "Plástico",
		["Type"] = "Comum",
		["Weight"] = 0.045,
		["Economy"] = 20
	},
	["glass"] = {
		["Index"] = "glass",
		["Name"] = "Vidro",
		["Type"] = "Comum",
		["Weight"] = 0.045,
		["Economy"] = 20
	},
	["rubber"] = {
		["Index"] = "rubber",
		["Name"] = "Borracha",
		["Type"] = "Comum",
		["Weight"] = 0.045,
		["Economy"] = 20
	},
	["aluminum"] = {
		["Index"] = "aluminum",
		["Name"] = "Alumínio",
		["Type"] = "Comum",
		["Weight"] = 0.055,
		["Economy"] = 20
	},
	["copper"] = {
		["Index"] = "copper",
		["Name"] = "Cobre",
		["Type"] = "Comum",
		["Weight"] = 0.055,
		["Economy"] = 20
	},
	["ritmoneury"] = {
		["Index"] = "ritmoneury",
		["Name"] = "Ritmoneury",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 475,
		["Max"] = 3
	},
	["sinkalmy"] = {
		["Index"] = "sinkalmy",
		["Name"] = "Sinkalmy",
		["Type"] = "Usável",
		["Weight"] = 0.75,
		["Economy"] = 375,
		["Max"] = 3
	},
	["cigarette"] = {
		["Index"] = "cigarette",
		["Name"] = "Cigarro",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 10,
		["Max"] = 3
	},
	["lighter"] = {
		["Index"] = "lighter",
		["Name"] = "Isqueiro",
		["Repair"] = "repairkit01",
		["Durability"] = 168,
		["Type"] = "Comum",
		["Weight"] = 0.55,
		["Economy"] = 175
	},
	["vape"] = {
		["Index"] = "vape",
		["Name"] = "Vape",
		["Repair"] = "repairkit02",
		["Type"] = "Usável",
		["Durability"] = 240,
		["Weight"] = 0.75,
		["Economy"] = 4750
	},
	["dollars"] = {
		["Index"] = "dollars",
		["Name"] = "Dólares",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["dollars2"] = {
		["Index"] = "dollars2",
		["Name"] = "Dólares Marcados",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["dollars3"] = {
		["Index"] = "dollars",
		["Name"] = "Dólares Falsificados",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["chocolate"] = {
		["Index"] = "chocolate",
		["Name"] = "Chocolate",
		["Type"] = "Usável",
		["Weight"] = 0.15,
		["Economy"] = 15,
		["Max"] = 3
	},
	["sandwich"] = {
		["Index"] = "sandwich",
		["Name"] = "Sanduiche",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.25,
		["Economy"] = 15,
		["Max"] = 3
	},
	["rose"] = {
		["Index"] = "rose",
		["Name"] = "Rosa",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 25
	},
	["teddy"] = {
		["Index"] = "teddy",
		["Name"] = "Teddy",
		["Type"] = "Usável",
		["Weight"] = 1.25,
		["Economy"] = 75
	},
	["absolut"] = {
		["Index"] = "absolut",
		["Name"] = "Absolut",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["chandon"] = {
		["Index"] = "chandon",
		["Name"] = "Chandon",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["dewars"] = {
		["Index"] = "dewars",
		["Name"] = "Dewars",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["hennessy"] = {
		["Index"] = "hennessy",
		["Name"] = "Hennessy",
		["Type"] = "Usável",
		["Durability"] = 36,
		["Weight"] = 0.55,
		["Economy"] = 15
	},
	["WEAPON_HATCHET"] = {
		["Index"] = "hatchet",
		["Name"] = "Machado",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_BAT"] = {
		["Index"] = "bat",
		["Name"] = "Bastão de Beisebol",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_KATANA"] = {
		["Index"] = "katana",
		["Name"] = "Katana",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_THERMAL"] = {
		["Index"] = "katanathermal",
		["Name"] = "Katana Flamejante",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 2500,
		["Clear"] = true,
		["Drops"] = true
	},
	["WEAPON_FROST"] = {
		["Index"] = "katanafrost",
		["Name"] = "Katana Gélida",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 2500,
		["Clear"] = true,
		["Drops"] = true
	},
	["WEAPON_KARAMBIT"] = {
		["Index"] = "karambit",
		["Name"] = "Karambit",
		["Type"] = "Armamento",
		["Repair"] = "repairkit01",
		["Durability"] = 240,
		["Weight"] = 1.25,
		["Economy"] = 975
	},
	["WEAPON_BATTLEAXE"] = {
		["Index"] = "battleaxe",
		["Name"] = "Machado de Batalha",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.75,
		["Economy"] = 975
	},
	["WEAPON_CROWBAR"] = {
		["Index"] = "crowbar",
		["Name"] = "Pé de Cabra",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.35,
		["Economy"] = 725
	},
	["WEAPON_SWITCHBLADE"] = {
		["Index"] = "switchblade",
		["Name"] = "Canivete",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 0.75,
		["Economy"] = 725
	},
	["WEAPON_GOLFCLUB"] = {
		["Index"] = "golfclub",
		["Name"] = "Taco de Golf",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.65,
		["Economy"] = 975
	},
	["WEAPON_HAMMER"] = {
		["Index"] = "hammer",
		["Name"] = "Martelo",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.45,
		["Economy"] = 975
	},
	["WEAPON_MACHETE"] = {
		["Index"] = "machete",
		["Name"] = "Facão",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.35,
		["Economy"] = 975
	},
	["WEAPON_POOLCUE"] = {
		["Index"] = "poolcue",
		["Name"] = "Taco de Sinuca",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.25,
		["Economy"] = 975
	},
	["WEAPON_STONE_HATCHET"] = {
		["Index"] = "stonehatchet",
		["Name"] = "Machado de Pedra",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.55,
		["Economy"] = 975
	},
	["WEAPON_WRENCH"] = {
		["Index"] = "wrench",
		["Name"] = "Chave Inglesa",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.45,
		["Economy"] = 725
	},
	["WEAPON_KNUCKLE"] = {
		["Index"] = "knuckle",
		["Name"] = "Soco Inglês",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.15,
		["Economy"] = 975
	},
	["WEAPON_FLASHLIGHT"] = {
		["Index"] = "flashlight",
		["Name"] = "Lanterna",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.15,
		["Economy"] = 975
	},
	["WEAPON_NIGHTSTICK"] = {
		["Index"] = "nightstick",
		["Name"] = "Cassetete",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Durability"] = 240,
		["Weight"] = 1.15
	},
	["WEAPON_PISTOL"] = {
		["Index"] = "m1911",
		["Name"] = "M1911",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_POLICE_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 5750
	},
	["WEAPON_PISTOL_MK2"] = {
		["Index"] = "fiveseven",
		["Name"] = "FN Five Seven",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 7250
	},
	["WEAPON_COMPACTRIFLE"] = {
		["Index"] = "akcompact",
		["Name"] = "AK Compact",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 240,
		["Weight"] = 4.25,
		["Economy"] = 16750
	},
	["WEAPON_APPISTOL"] = {
		["Index"] = "kochvp9",
		["Name"] = "Koch Vp9",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 2.75,
		["Economy"] = 8250
	},
	["WEAPON_HEAVYPISTOL"] = {
		["Index"] = "atifx45",
		["Name"] = "Ati FX45",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_POLICE_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 2.75
	},
	["WEAPON_MACHINEPISTOL"] = {
		["Index"] = "tec9",
		["Name"] = "Tec-9",
		["Type"] = "Armamento",
		["Repair"] = "repairkit03",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 8250
	},
	["WEAPON_MICROSMG"] = {
		["Index"] = "uzi",
		["Name"] = "Uzi",
		["Type"] = "Armamento",
		["Repair"] = "repairkit03",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 4.25,
		["Economy"] = 14550
	},
	["WEAPON_NAILGUN"] = {
		["Index"] = "nailgun",
		["Name"] = "Arma de Prego",
		["Repair"] = "repairkit01",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_NAIL_AMMO",
		["Durability"] = 168,
		["Vehicle"] = false,
		["Weight"] = 4.25,
		["Economy"] = 3250
	},
	["WEAPON_RPG"] = {
		["Index"] = "rpg",
		["Name"] = "Lança Foguete",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RPG_AMMO",
		["Durability"] = 720,
		["Vehicle"] = false,
		["Weight"] = 12.25,
		["Economy"] = 15250
	},
	["WEAPON_MINISMG"] = {
		["Index"] = "skorpionv61",
		["Name"] = "Skorpion V61",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 5.25,
		["Economy"] = 14550
	},
	["WEAPON_SNSPISTOL"] = {
		["Index"] = "amt380",
		["Name"] = "AMT 380",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 2.25,
		["Economy"] = 5750
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		["Index"] = "hkp7m10",
		["Name"] = "HK P7M10",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 5750
	},
	["WEAPON_VINTAGEPISTOL"] = {
		["Index"] = "m1922",
		["Name"] = "M1922",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 3.25,
		["Economy"] = 4250
	},
	["WEAPON_PISTOL50"] = {
		["Index"] = "desert",
		["Name"] = "Desert Eagle",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PISTOL_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 3.75,
		["Economy"] = 8550
	},
	["WEAPON_COMBATPISTOL"] = {
		["Index"] = "glock",
		["Name"] = "Glock",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_POLICE_AMMO",
		["Durability"] = 240,
		["Vehicle"] = true,
		["Weight"] = 3.25
	},
	["WEAPON_PARAFAL"] = {
		["Index"] = "parafal",
		["Name"] = "PARA-FAL M964A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_FNFAL"] = {
		["Index"] = "fnfal",
		["Name"] = "FN L1A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_FNSCAR"] = {
		["Index"] = "fnscar",
		["Name"] = "FN Scar",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_QBZ83"] = {
		["Index"] = "qbz95",
		["Name"] = "QBZ-83",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_COLTXM177"] = {
		["Index"] = "coltxm177",
		["Name"] = "Colt XM177",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_CARBINERIFLE"] = {
		["Index"] = "m4a1",
		["Name"] = "M4A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_POLICE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75
	},
	["WEAPON_CARBINERIFLE_MK2"] = {
		["Index"] = "m4a4",
		["Name"] = "M4A4",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 8.75,
		["Economy"] = 27550
	},
	["WEAPON_ADVANCEDRIFLE"] = {
		["Index"] = "tar21",
		["Name"] = "Tar-21",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 26550
	},
	["WEAPON_BULLPUPRIFLE"] = {
		["Index"] = "qbz95",
		["Name"] = "QBZ-95",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_BULLPUPRIFLE_MK2"] = {
		["Index"] = "l85",
		["Name"] = "L85",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_SPECIALCARBINE"] = {
		["Index"] = "g36c",
		["Name"] = "G36C",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 8.75,
		["Economy"] = 25250
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
		["Index"] = "sigsauer556",
		["Name"] = "Sig Sauer 556",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 8.75,
		["Economy"] = 25250
	},
	["WEAPON_PUMPSHOTGUN"] = {
		["Index"] = "mossberg590",
		["Name"] = "Mossberg 590",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_POLICE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.25
	},
	["WEAPON_PUMPSHOTGUN_MK2"] = {
		["Index"] = "mossberg590a1",
		["Name"] = "Mossberg 590A1",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.25,
		["Economy"] = 16550
	},
	["WEAPON_MUSKET"] = {
		["Index"] = "winchester",
		["Name"] = "Winchester 1892",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_MUSKET_AMMO",
		["Durability"] = 480,
		["Weight"] = 6.25,
		["Economy"] = 3250
	},
	["WEAPON_SAUER"] = {
		["Index"] = "sauer101",
		["Name"] = "Sauer 101",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_MUSKET_AMMO",
		["Durability"] = 480,
		["Weight"] = 6.25,
		["Economy"] = 7225
	},
	["WEAPON_SAWNOFFSHOTGUN"] = {
		["Index"] = "mossberg500",
		["Name"] = "Mossberg 500",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SHOTGUN_AMMO",
		["Durability"] = 480,
		["Weight"] = 5.75,
		["Economy"] = 14750
	},
	["WEAPON_SMG"] = {
		["Index"] = "mp5",
		["Name"] = "MP5",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_POLICE_AMMO",
		["Durability"] = 480,
		["Weight"] = 5.25
	},
	["WEAPON_SMG_MK2"] = {
		["Index"] = "evo3",
		["Name"] = "Evo-3",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 480,
		["Vehicle"] = true,
		["Weight"] = 5.25,
		["Economy"] = 16750
	},
	["WEAPON_TACTICALRIFLE"] = {
		["Index"] = "m16",
		["Name"] = "M16",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_POLICE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75
	},
	["WEAPON_HEAVYRIFLE"] = {
		["Index"] = "scarh",
		["Name"] = "Scar-H",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 27550
	},
	["WEAPON_ASSAULTRIFLE"] = {
		["Index"] = "ak103",
		["Name"] = "AK-103",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		["Index"] = "ak74",
		["Name"] = "AK-74",
		["Repair"] = "repairkit04",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 7.75,
		["Economy"] = 25250
	},
	["WEAPON_ASSAULTSMG"] = {
		["Index"] = "steyraug",
		["Name"] = "Steyr AUG",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_RIFLE_AMMO",
		["Durability"] = 480,
		["Weight"] = 5.75,
		["Economy"] = 16750
	},
	["WEAPON_GUSENBERG"] = {
		["Index"] = "thompson",
		["Name"] = "Thompson",
		["Repair"] = "repairkit03",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_SMG_AMMO",
		["Durability"] = 480,
		["Weight"] = 6.25,
		["Economy"] = 16250
	},
	["WEAPON_PETROLCAN"] = {
		["Index"] = "gallon",
		["Name"] = "Galão",
		["Type"] = "Armamento",
		["Ammo"] = "WEAPON_PETROLCAN_AMMO",
		["Weight"] = 1.25,
		["Economy"] = 250
	},
	["GADGET_PARACHUTE"] = {
		["Index"] = "parachute",
		["Name"] = "Paraquedas",
		["Description"] = "Lembrando que após <green>reconectar na cidade</green> o mesmo é removido.",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 225,
		["Max"] = 2
	},
	["WEAPON_STUNGUN"] = {
		["Index"] = "stungun",
		["Name"] = "Tazer",
		["Repair"] = "repairkit02",
		["Type"] = "Armamento",
		["Durability"] = 480,
		["Weight"] = 0.75
	},
	["WEAPON_RPG_AMMO"] = {
		["Index"] = "rocket",
		["Name"] = "Foguete",
		["Type"] = "Munição",
		["Weight"] = 2.25,
		["Economy"] = 725
	},
	["WEAPON_NAIL_AMMO"] = {
		["Index"] = "nails",
		["Name"] = "Pregos",
		["Type"] = "Munição",
		["Weight"] = 0.05,
		["Economy"] = 2
	},
	["WEAPON_PISTOL_AMMO"] = {
		["Index"] = "pistolammo",
		["Name"] = "Munição de Pistola",
		["Type"] = "Munição",
		["Weight"] = 0.035,
		["Economy"] = 30
	},
	["WEAPON_SMG_AMMO"] = {
		["Index"] = "smgammo",
		["Name"] = "Munição de Submetralhadora",
		["Type"] = "Munição",
		["Weight"] = 0.045,
		["Economy"] = 32
	},
	["WEAPON_RIFLE_AMMO"] = {
		["Index"] = "rifleammo",
		["Name"] = "Munição de Rifle",
		["Type"] = "Munição",
		["Weight"] = 0.055,
		["Economy"] = 35
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		["Index"] = "shotgunammo",
		["Name"] = "Munição de Escopeta",
		["Type"] = "Munição",
		["Weight"] = 0.075,
		["Economy"] = 35
	},
	["WEAPON_POLICE_AMMO"] = {
		["Index"] = "policeammo",
		["Name"] = "Munição Policial",
		["Type"] = "Munição",
		["Weight"] = 0.065
	},
	["WEAPON_MUSKET_AMMO"] = {
		["Index"] = "musketammo",
		["Name"] = "Munição de Mosquete",
		["Type"] = "Munição",
		["Weight"] = 0.075,
		["Economy"] = 10
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		["Index"] = "fuel",
		["Name"] = "Combustível",
		["Type"] = "Munição",
		["Weight"] = 0.001,
		["Economy"] = 0
	},
	["WEAPON_BRICK"] = {
		["Index"] = "brick",
		["Name"] = "Tijolo",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.75,
		["Economy"] = 25
	},
	["WEAPON_SNOWBALL"] = {
		["Index"] = "snowball",
		["Name"] = "Bola de Neve",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.55,
		["Economy"] = 6
	},
	["WEAPON_SHOES"] = {
		["Index"] = "shoes",
		["Name"] = "Tênis",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.755,
		["Economy"] = 25
	},
	["WEAPON_MOLOTOV"] = {
		["Index"] = "molotov",
		["Name"] = "Coquetel Molotov",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.95,
		["Economy"] = 225,
		["Max"] = 3
	},
	["WEAPON_SMOKEGRENADE"] = {
		["Index"] = "smokegrenade",
		["Name"] = "Granada de Fumaça",
		["Type"] = "Throwing",
		["Vehicle"] = true,
		["Weight"] = 0.95,
		["Economy"] = 225,
		["Max"] = 3
	},
	["pager"] = {
		["Index"] = "pager",
		["Name"] = "Pager",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 125
	},
	["firecracker"] = {
		["Index"] = "firecracker",
		["Name"] = "Fogos de Artificio",
		["Type"] = "Usável",
		["Weight"] = 2.25,
		["Economy"] = 100
	},
	["analgesic"] = {
		["Index"] = "analgesic",
		["Name"] = "Analgésico",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 125
	},
	["oxy"] = {
		["Index"] = "oxycontin",
		["Name"] = "Frasco de Oxicodona",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 155
	},
	["crack"] = {
		["Index"] = "crack",
		["Name"] = "Pedra de Crack",
		["Type"] = "Usável",
		["Weight"] = 0.05,
		["Economy"] = 575
	},
	["heroin"] = {
		["Index"] = "heroin",
		["Name"] = "Seringa de Heroína",
		["Type"] = "Usável",
		["Weight"] = 0.45,
		["Economy"] = 725
	},
	["metadone"] = {
		["Index"] = "metadone",
		["Name"] = "Frasco de Metadona",
		["Type"] = "Usável",
		["Weight"] = 0.45,
		["Economy"] = 450
	},
	["gauze"] = {
		["Index"] = "gauze",
		["Name"] = "Ataduras",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 100
	},
	["gsrkit"] = {
		["Index"] = "gsrkit",
		["Name"] = "Kit Residual",
		["Type"] = "Usável",
		["Weight"] = 0.75
	},
	["gdtkit"] = {
		["Index"] = "gdtkit",
		["Name"] = "Kit Químico",
		["Type"] = "Usável",
		["Weight"] = 0.75
	},
	["soap"] = {
		["Index"] = "soap",
		["Name"] = "Sabonete",
		["Type"] = "Usável",
		["Weight"] = 0.25,
		["Economy"] = 75
	},
	-- EVENTOS
	["mulher2023"] = {
		["Index"] = "rose",
		["Description"] = "Este item é uma recompensa pelo <green>Dia Internacional da Mulher</green>, parabéns pelo seu dia.",
		["Name"] = "Rosa da Mulher",
		["Type"] = "Usável",
		["Weight"] = 0.0,
		["Economy"] = 0,
		["Block"] = true,
		["Clear"] = true
	},
	-- ALIANÇAS
	["alliancemale"] = {
		["Index"] = "alliancemale",
		["Name"] = "Aliança Masculino",
		["Description"] = "<green>Casamentos</green>, <green>Noivados</green> e <green>Namoros</green>.",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 525
	},
	["alliancefemale"] = {
		["Index"] = "alliancefemale",
		["Name"] = "Aliança Feminino",
		["Description"] = "<green>Casamentos</green>, <green>Noivados</green> e <green>Namoros</green>.",
		["Type"] = "Comum",
		["Weight"] = 0.15,
		["Economy"] = 525
	},
	-- POKEMON
	["cupholder"] = {
		["Index"] = "cupholder",
		["Name"] = "Porta Tazos",
		["Description"] = "Grande compartimento para guardar seus tazos colecionáveis.",
		["Type"] = "Usável",
		["Weight"] = 0.0,
		["Unique"] = true,
		["Drops"] = true,
		["Economy"] = 5000,
		["Clear"] = true
	},
	["pokeball"] = {
		["Index"] = "pokeball",
		["Name"] = "Pokebola",
		["Description"] = "Dentro possuí um pokemon aleatório que quando jogada você captura um deles.",
		["Type"] = "Usável",
		["Weight"] = 0.10,
		["Economy"] = 1000
	},
	["pokemon001"] = {
		["Index"] = "pokemon001",
		["Name"] = "Bulbasaur",
		["Description"] = "Colecionável <green>Nº 001</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon002"] = {
		["Index"] = "pokemon002",
		["Name"] = "Ivysaur",
		["Description"] = "Colecionável <green>Nº 002</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon003"] = {
		["Index"] = "pokemon003",
		["Name"] = "Venusaur",
		["Description"] = "Colecionável <green>Nº 003</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon004"] = {
		["Index"] = "pokemon004",
		["Name"] = "Charmander",
		["Description"] = "Colecionável <green>Nº 004</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon005"] = {
		["Index"] = "pokemon005",
		["Name"] = "Charmeleon",
		["Description"] = "Colecionável <green>Nº 005</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon006"] = {
		["Index"] = "pokemon006",
		["Name"] = "Charizard",
		["Description"] = "Colecionável <green>Nº 006</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon007"] = {
		["Index"] = "pokemon007",
		["Name"] = "Squirtle",
		["Description"] = "Colecionável <green>Nº 007</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon008"] = {
		["Index"] = "pokemon008",
		["Name"] = "Wartortle",
		["Description"] = "Colecionável <green>Nº 008</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon009"] = {
		["Index"] = "pokemon009",
		["Name"] = "Blastoise",
		["Description"] = "Colecionável <green>Nº 009</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon010"] = {
		["Index"] = "pokemon010",
		["Name"] = "Caterpie",
		["Description"] = "Colecionável <green>Nº 010</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon011"] = {
		["Index"] = "pokemon011",
		["Name"] = "Metapod",
		["Description"] = "Colecionável <green>Nº 011</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon012"] = {
		["Index"] = "pokemon012",
		["Name"] = "Butterfree",
		["Description"] = "Colecionável <green>Nº 012</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon013"] = {
		["Index"] = "pokemon013",
		["Name"] = "Weedle",
		["Description"] = "Colecionável <green>Nº 013</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon014"] = {
		["Index"] = "pokemon014",
		["Name"] = "Kakuna",
		["Description"] = "Colecionável <green>Nº 014</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon015"] = {
		["Index"] = "pokemon015",
		["Name"] = "Beedrill",
		["Description"] = "Colecionável <green>Nº 015</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon016"] = {
		["Index"] = "pokemon016",
		["Name"] = "Pidgey",
		["Description"] = "Colecionável <green>Nº 016</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon017"] = {
		["Index"] = "pokemon017",
		["Name"] = "Pidgeotto",
		["Description"] = "Colecionável <green>Nº 017</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon018"] = {
		["Index"] = "pokemon018",
		["Name"] = "Pidgeot",
		["Description"] = "Colecionável <green>Nº 018</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon019"] = {
		["Index"] = "pokemon019",
		["Name"] = "Rattata",
		["Description"] = "Colecionável <green>Nº 019</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon020"] = {
		["Index"] = "pokemon020",
		["Name"] = "Raticate",
		["Description"] = "Colecionável <green>Nº 020</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon021"] = {
		["Index"] = "pokemon021",
		["Name"] = "Spearow",
		["Description"] = "Colecionável <green>Nº 021</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon022"] = {
		["Index"] = "pokemon022",
		["Name"] = "Fearow",
		["Description"] = "Colecionável <green>Nº 022</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon023"] = {
		["Index"] = "pokemon023",
		["Name"] = "Ekans",
		["Description"] = "Colecionável <green>Nº 023</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon024"] = {
		["Index"] = "pokemon024",
		["Name"] = "Arbok",
		["Description"] = "Colecionável <green>Nº 024</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon025"] = {
		["Index"] = "pokemon025",
		["Name"] = "Pikachu",
		["Description"] = "Colecionável <green>Nº 025</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon026"] = {
		["Index"] = "pokemon026",
		["Name"] = "Raichu",
		["Description"] = "Colecionável <green>Nº 026</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon027"] = {
		["Index"] = "pokemon027",
		["Name"] = "Sandshrew",
		["Description"] = "Colecionável <green>Nº 027</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon028"] = {
		["Index"] = "pokemon028",
		["Name"] = "Sandslash",
		["Description"] = "Colecionável <green>Nº 028</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon029"] = {
		["Index"] = "pokemon029",
		["Name"] = "Nidoran ♀",
		["Description"] = "Colecionável <green>Nº 029</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon030"] = {
		["Index"] = "pokemon030",
		["Name"] = "Nidorina",
		["Description"] = "Colecionável <green>Nº 030</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon031"] = {
		["Index"] = "pokemon031",
		["Name"] = "Nidoqueen",
		["Description"] = "Colecionável <green>Nº 031</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon032"] = {
		["Index"] = "pokemon032",
		["Name"] = "Nidoran ♂",
		["Description"] = "Colecionável <green>Nº 032</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon033"] = {
		["Index"] = "pokemon033",
		["Name"] = "Nidorino",
		["Description"] = "Colecionável <green>Nº 033</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon034"] = {
		["Index"] = "pokemon034",
		["Name"] = "Nidoking",
		["Description"] = "Colecionável <green>Nº 034</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon035"] = {
		["Index"] = "pokemon035",
		["Name"] = "Clefairy",
		["Description"] = "Colecionável <green>Nº 035</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon036"] = {
		["Index"] = "pokemon036",
		["Name"] = "Clefable",
		["Description"] = "Colecionável <green>Nº 036</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon037"] = {
		["Index"] = "pokemon037",
		["Name"] = "Vulpix",
		["Description"] = "Colecionável <green>Nº 037</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon038"] = {
		["Index"] = "pokemon038",
		["Name"] = "Ninetales",
		["Description"] = "Colecionável <green>Nº 038</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon039"] = {
		["Index"] = "pokemon039",
		["Name"] = "Jigglypuff",
		["Description"] = "Colecionável <green>Nº 039</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon040"] = {
		["Index"] = "pokemon040",
		["Name"] = "Wigglytuff",
		["Description"] = "Colecionável <green>Nº 040</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon041"] = {
		["Index"] = "pokemon041",
		["Name"] = "Zubat",
		["Description"] = "Colecionável <green>Nº 041</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon042"] = {
		["Index"] = "pokemon042",
		["Name"] = "Golbat",
		["Description"] = "Colecionável <green>Nº 042</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon043"] = {
		["Index"] = "pokemon043",
		["Name"] = "Oddish",
		["Description"] = "Colecionável <green>Nº 043</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon044"] = {
		["Index"] = "pokemon044",
		["Name"] = "Gloom",
		["Description"] = "Colecionável <green>Nº 044</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon045"] = {
		["Index"] = "pokemon045",
		["Name"] = "Vileplume",
		["Description"] = "Colecionável <green>Nº 045</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon046"] = {
		["Index"] = "pokemon046",
		["Name"] = "Paras",
		["Description"] = "Colecionável <green>Nº 046</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon047"] = {
		["Index"] = "pokemon047",
		["Name"] = "Parasect",
		["Description"] = "Colecionável <green>Nº 047</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon048"] = {
		["Index"] = "pokemon048",
		["Name"] = "Venonat",
		["Description"] = "Colecionável <green>Nº 048</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon049"] = {
		["Index"] = "pokemon049",
		["Name"] = "Venomoth",
		["Description"] = "Colecionável <green>Nº 049</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon050"] = {
		["Index"] = "pokemon050",
		["Name"] = "Diglett",
		["Description"] = "Colecionável <green>Nº 050</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon051"] = {
		["Index"] = "pokemon051",
		["Name"] = "Dugtrio",
		["Description"] = "Colecionável <green>Nº 051</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon052"] = {
		["Index"] = "pokemon052",
		["Name"] = "Meowth",
		["Description"] = "Colecionável <green>Nº 052</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon053"] = {
		["Index"] = "pokemon053",
		["Name"] = "Persian",
		["Description"] = "Colecionável <green>Nº 053</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon054"] = {
		["Index"] = "pokemon054",
		["Name"] = "Psyduck",
		["Description"] = "Colecionável <green>Nº 054</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon055"] = {
		["Index"] = "pokemon055",
		["Name"] = "Golduck",
		["Description"] = "Colecionável <green>Nº 055</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon056"] = {
		["Index"] = "pokemon056",
		["Name"] = "Mankey",
		["Description"] = "Colecionável <green>Nº 056</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon057"] = {
		["Index"] = "pokemon057",
		["Name"] = "Primeape",
		["Description"] = "Colecionável <green>Nº 057</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon058"] = {
		["Index"] = "pokemon058",
		["Name"] = "Growlithe",
		["Description"] = "Colecionável <green>Nº 058</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon059"] = {
		["Index"] = "pokemon059",
		["Name"] = "Arcanine",
		["Description"] = "Colecionável <green>Nº 059</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon060"] = {
		["Index"] = "pokemon060",
		["Name"] = "Poliwag",
		["Description"] = "Colecionável <green>Nº 060</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon061"] = {
		["Index"] = "pokemon061",
		["Name"] = "Poliwhirl",
		["Description"] = "Colecionável <green>Nº 061</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon062"] = {
		["Index"] = "pokemon062",
		["Name"] = "Poliwrath",
		["Description"] = "Colecionável <green>Nº 062</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon063"] = {
		["Index"] = "pokemon063",
		["Name"] = "Abra",
		["Description"] = "Colecionável <green>Nº 063</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon064"] = {
		["Index"] = "pokemon064",
		["Name"] = "Kadabra",
		["Description"] = "Colecionável <green>Nº 064</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon065"] = {
		["Index"] = "pokemon065",
		["Name"] = "Alakazam",
		["Description"] = "Colecionável <green>Nº 065</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon066"] = {
		["Index"] = "pokemon066",
		["Name"] = "Machop",
		["Description"] = "Colecionável <green>Nº 066</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon067"] = {
		["Index"] = "pokemon067",
		["Name"] = "Machoke",
		["Description"] = "Colecionável <green>Nº 067</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon068"] = {
		["Index"] = "pokemon068",
		["Name"] = "Machamp",
		["Description"] = "Colecionável <green>Nº 068</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon069"] = {
		["Index"] = "pokemon069",
		["Name"] = "Bellsprout",
		["Description"] = "Colecionável <green>Nº 069</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon070"] = {
		["Index"] = "pokemon070",
		["Name"] = "Weepinbell",
		["Description"] = "Colecionável <green>Nº 070</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon071"] = {
		["Index"] = "pokemon071",
		["Name"] = "Victreebel",
		["Description"] = "Colecionável <green>Nº 071</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon072"] = {
		["Index"] = "pokemon072",
		["Name"] = "Tentacool",
		["Description"] = "Colecionável <green>Nº 072</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon073"] = {
		["Index"] = "pokemon073",
		["Name"] = "Tentacruel",
		["Description"] = "Colecionável <green>Nº 073</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon074"] = {
		["Index"] = "pokemon074",
		["Name"] = "Geodude",
		["Description"] = "Colecionável <green>Nº 074</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon075"] = {
		["Index"] = "pokemon075",
		["Name"] = "Graveler",
		["Description"] = "Colecionável <green>Nº 075</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon076"] = {
		["Index"] = "pokemon076",
		["Name"] = "Golem",
		["Description"] = "Colecionável <green>Nº 076</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon077"] = {
		["Index"] = "pokemon077",
		["Name"] = "Ponyta",
		["Description"] = "Colecionável <green>Nº 077</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon078"] = {
		["Index"] = "pokemon078",
		["Name"] = "Rapidash",
		["Description"] = "Colecionável <green>Nº 078</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon079"] = {
		["Index"] = "pokemon079",
		["Name"] = "Slowpoke",
		["Description"] = "Colecionável <green>Nº 079</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon080"] = {
		["Index"] = "pokemon080",
		["Name"] = "Slowbro",
		["Description"] = "Colecionável <green>Nº 080</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon081"] = {
		["Index"] = "pokemon081",
		["Name"] = "Magnemite",
		["Description"] = "Colecionável <green>Nº 081</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon082"] = {
		["Index"] = "pokemon082",
		["Name"] = "Magneton",
		["Description"] = "Colecionável <green>Nº 082</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon083"] = {
		["Index"] = "pokemon083",
		["Name"] = "Farfetch'd",
		["Description"] = "Colecionável <green>Nº 083</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon084"] = {
		["Index"] = "pokemon084",
		["Name"] = "Doduo",
		["Description"] = "Colecionável <green>Nº 084</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon085"] = {
		["Index"] = "pokemon085",
		["Name"] = "Dodrio",
		["Description"] = "Colecionável <green>Nº 085</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon086"] = {
		["Index"] = "pokemon086",
		["Name"] = "Seel",
		["Description"] = "Colecionável <green>Nº 086</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon087"] = {
		["Index"] = "pokemon087",
		["Name"] = "Dewgong",
		["Description"] = "Colecionável <green>Nº 087</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon088"] = {
		["Index"] = "pokemon088",
		["Name"] = "Grimer",
		["Description"] = "Colecionável <green>Nº 088</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon089"] = {
		["Index"] = "pokemon089",
		["Name"] = "Muk",
		["Description"] = "Colecionável <green>Nº 089</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon090"] = {
		["Index"] = "pokemon090",
		["Name"] = "Shellder",
		["Description"] = "Colecionável <green>Nº 090</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon091"] = {
		["Index"] = "pokemon091",
		["Name"] = "Cloyster",
		["Description"] = "Colecionável <green>Nº 091</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon092"] = {
		["Index"] = "pokemon092",
		["Name"] = "Gastly",
		["Description"] = "Colecionável <green>Nº 092</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon093"] = {
		["Index"] = "pokemon093",
		["Name"] = "Haunter",
		["Description"] = "Colecionável <green>Nº 093</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon094"] = {
		["Index"] = "pokemon094",
		["Name"] = "Gengar",
		["Description"] = "Colecionável <green>Nº 094</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon095"] = {
		["Index"] = "pokemon095",
		["Name"] = "Onix",
		["Description"] = "Colecionável <green>Nº 095</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon096"] = {
		["Index"] = "pokemon096",
		["Name"] = "Drowzee",
		["Description"] = "Colecionável <green>Nº 096</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon097"] = {
		["Index"] = "pokemon097",
		["Name"] = "Hypno",
		["Description"] = "Colecionável <green>Nº 097</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon098"] = {
		["Index"] = "pokemon098",
		["Name"] = "Krabby",
		["Description"] = "Colecionável <green>Nº 098</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon099"] = {
		["Index"] = "pokemon099",
		["Name"] = "Kingler",
		["Description"] = "Colecionável <green>Nº 099</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon100"] = {
		["Index"] = "pokemon100",
		["Name"] = "Voltorb",
		["Description"] = "Colecionável <green>Nº 100</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon101"] = {
		["Index"] = "pokemon101",
		["Name"] = "Electrode",
		["Description"] = "Colecionável <green>Nº 101</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon102"] = {
		["Index"] = "pokemon102",
		["Name"] = "Exeggcute",
		["Description"] = "Colecionável <green>Nº 102</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon103"] = {
		["Index"] = "pokemon103",
		["Name"] = "Exeggutor",
		["Description"] = "Colecionável <green>Nº 103</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon104"] = {
		["Index"] = "pokemon104",
		["Name"] = "Cubone",
		["Description"] = "Colecionável <green>Nº 104</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon105"] = {
		["Index"] = "pokemon105",
		["Name"] = "Marowak",
		["Description"] = "Colecionável <green>Nº 105</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon106"] = {
		["Index"] = "pokemon106",
		["Name"] = "Hitmonlee",
		["Description"] = "Colecionável <green>Nº 106</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon107"] = {
		["Index"] = "pokemon107",
		["Name"] = "Hitmonchan",
		["Description"] = "Colecionável <green>Nº 107</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon108"] = {
		["Index"] = "pokemon108",
		["Name"] = "Lickitung",
		["Description"] = "Colecionável <green>Nº 108</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon109"] = {
		["Index"] = "pokemon109",
		["Name"] = "Koffing",
		["Description"] = "Colecionável <green>Nº 109</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon110"] = {
		["Index"] = "pokemon110",
		["Name"] = "Weezing",
		["Description"] = "Colecionável <green>Nº 110</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon111"] = {
		["Index"] = "pokemon111",
		["Name"] = "Rhyhorn",
		["Description"] = "Colecionável <green>Nº 111</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon112"] = {
		["Index"] = "pokemon112",
		["Name"] = "Rhydon",
		["Description"] = "Colecionável <green>Nº 112</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon113"] = {
		["Index"] = "pokemon113",
		["Name"] = "Chansey",
		["Description"] = "Colecionável <green>Nº 113</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon114"] = {
		["Index"] = "pokemon114",
		["Name"] = "Tangela",
		["Description"] = "Colecionável <green>Nº 114</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon115"] = {
		["Index"] = "pokemon115",
		["Name"] = "Kangaskhan",
		["Description"] = "Colecionável <green>Nº 115</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon116"] = {
		["Index"] = "pokemon116",
		["Name"] = "Horsea",
		["Description"] = "Colecionável <green>Nº 116</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon117"] = {
		["Index"] = "pokemon117",
		["Name"] = "Seadra",
		["Description"] = "Colecionável <green>Nº 117</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon118"] = {
		["Index"] = "pokemon118",
		["Name"] = "Goldeen",
		["Description"] = "Colecionável <green>Nº 118</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon119"] = {
		["Index"] = "pokemon119",
		["Name"] = "Seaking",
		["Description"] = "Colecionável <green>Nº 119</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon120"] = {
		["Index"] = "pokemon120",
		["Name"] = "Staryu",
		["Description"] = "Colecionável <green>Nº 120</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon121"] = {
		["Index"] = "pokemon121",
		["Name"] = "Starmie",
		["Description"] = "Colecionável <green>Nº 121</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon122"] = {
		["Index"] = "pokemon122",
		["Name"] = "Mr. Mime",
		["Description"] = "Colecionável <green>Nº 122</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon123"] = {
		["Index"] = "pokemon123",
		["Name"] = "Scyther",
		["Description"] = "Colecionável <green>Nº 123</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon124"] = {
		["Index"] = "pokemon124",
		["Name"] = "Jynx",
		["Description"] = "Colecionável <green>Nº 124</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon125"] = {
		["Index"] = "pokemon125",
		["Name"] = "Electabuzz",
		["Description"] = "Colecionável <green>Nº 125</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon126"] = {
		["Index"] = "pokemon126",
		["Name"] = "Magmar",
		["Description"] = "Colecionável <green>Nº 126</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon127"] = {
		["Index"] = "pokemon127",
		["Name"] = "Pinsir",
		["Description"] = "Colecionável <green>Nº 127</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon128"] = {
		["Index"] = "pokemon128",
		["Name"] = "Tauros",
		["Description"] = "Colecionável <green>Nº 128</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon129"] = {
		["Index"] = "pokemon129",
		["Name"] = "Magikarp",
		["Description"] = "Colecionável <green>Nº 129</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon130"] = {
		["Index"] = "pokemon130",
		["Name"] = "Gyarados",
		["Description"] = "Colecionável <green>Nº 130</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon131"] = {
		["Index"] = "pokemon131",
		["Name"] = "Lapras",
		["Description"] = "Colecionável <green>Nº 131</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon132"] = {
		["Index"] = "pokemon132",
		["Name"] = "Ditto",
		["Description"] = "Colecionável <green>Nº 132</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon133"] = {
		["Index"] = "pokemon133",
		["Name"] = "Eevee",
		["Description"] = "Colecionável <green>Nº 133</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon134"] = {
		["Index"] = "pokemon134",
		["Name"] = "Vaporeon",
		["Description"] = "Colecionável <green>Nº 134</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon135"] = {
		["Index"] = "pokemon135",
		["Name"] = "Jolteon",
		["Description"] = "Colecionável <green>Nº 135</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon136"] = {
		["Index"] = "pokemon136",
		["Name"] = "Flareon",
		["Description"] = "Colecionável <green>Nº 136</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon137"] = {
		["Index"] = "pokemon137",
		["Name"] = "Porygon",
		["Description"] = "Colecionável <green>Nº 137</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon138"] = {
		["Index"] = "pokemon138",
		["Name"] = "Omanyte",
		["Description"] = "Colecionável <green>Nº 138</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon139"] = {
		["Index"] = "pokemon139",
		["Name"] = "Omastar",
		["Description"] = "Colecionável <green>Nº 139</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon140"] = {
		["Index"] = "pokemon140",
		["Name"] = "Kabuto",
		["Description"] = "Colecionável <green>Nº 140</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon141"] = {
		["Index"] = "pokemon141",
		["Name"] = "Kabutops",
		["Description"] = "Colecionável <green>Nº 141</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon142"] = {
		["Index"] = "pokemon142",
		["Name"] = "Aerodactyl",
		["Description"] = "Colecionável <green>Nº 142</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon143"] = {
		["Index"] = "pokemon143",
		["Name"] = "Snorlax",
		["Description"] = "Colecionável <green>Nº 143</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon144"] = {
		["Index"] = "pokemon144",
		["Name"] = "Articuno",
		["Description"] = "Colecionável <green>Nº 144</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon145"] = {
		["Index"] = "pokemon145",
		["Name"] = "Zapdos",
		["Description"] = "Colecionável <green>Nº 145</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon146"] = {
		["Index"] = "pokemon146",
		["Name"] = "Moltres",
		["Description"] = "Colecionável <green>Nº 146</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon147"] = {
		["Index"] = "pokemon147",
		["Name"] = "Dratini",
		["Description"] = "Colecionável <green>Nº 147</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon148"] = {
		["Index"] = "pokemon148",
		["Name"] = "Dragonair",
		["Description"] = "Colecionável <green>Nº 148</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon149"] = {
		["Index"] = "pokemon149",
		["Name"] = "Dragonite",
		["Description"] = "Colecionável <green>Nº 149</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon150"] = {
		["Index"] = "pokemon150",
		["Name"] = "Mewtwo",
		["Description"] = "Colecionável <green>Nº 150</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["pokemon151"] = {
		["Index"] = "pokemon151",
		["Name"] = "Mew",
		["Description"] = "Colecionável <green>Nº 151</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection01"] = {
		["Index"] = "collection01",
		["Name"] = "Pernalonga",
		["Description"] = "Colecionável <green>Nº 001</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection02"] = {
		["Index"] = "collection02",
		["Name"] = "Patolino",
		["Description"] = "Colecionável <green>Nº 002</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection03"] = {
		["Index"] = "collection03",
		["Name"] = "Piu-Piu",
		["Description"] = "Colecionável <green>Nº 003</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection04"] = {
		["Index"] = "collection04",
		["Name"] = "Taz",
		["Description"] = "Colecionável <green>Nº 004</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection05"] = {
		["Index"] = "collection05",
		["Name"] = "Frajola",
		["Description"] = "Colecionável <green>Nº 005</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection06"] = {
		["Index"] = "collection06",
		["Name"] = "Sisi",
		["Description"] = "Colecionável <green>Nº 006</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection07"] = {
		["Index"] = "collection07",
		["Name"] = "Sofi",
		["Description"] = "Colecionável <green>Nº 007</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection08"] = {
		["Index"] = "collection08",
		["Name"] = "Kala",
		["Description"] = "Colecionável <green>Nº 008</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection09"] = {
		["Index"] = "collection09",
		["Name"] = "Regi",
		["Description"] = "Colecionável <green>Nº 009</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection10"] = {
		["Index"] = "collection10",
		["Name"] = "Gabi",
		["Description"] = "Colecionável <green>Nº 010</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection11"] = {
		["Index"] = "collection11",
		["Name"] = "Ducky",
		["Description"] = "Colecionável <green>Nº 011</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection12"] = {
		["Index"] = "collection12",
		["Name"] = "Betty",
		["Description"] = "Colecionável <green>Nº 012</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection13"] = {
		["Index"] = "collection13",
		["Name"] = "Buzz Lightyear",
		["Description"] = "Colecionável <green>Nº 013</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection14"] = {
		["Index"] = "collection14",
		["Name"] = "Bunny",
		["Description"] = "Colecionável <green>Nº 014</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	},
	["collection15"] = {
		["Index"] = "collection15",
		["Name"] = "Xerife Woody",
		["Description"] = "Colecionável <green>Nº 015</green>",
		["Type"] = "Comum",
		["Weight"] = 0.0
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemBody(Item)
	local Item = SplitOne(Item)
	if List[Item] then
		return List[Item]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEX
-----------------------------------------------------------------------------------------------------------------------------------------
function itemIndex(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Index"] then
		return List[Item]["Index"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAME
-----------------------------------------------------------------------------------------------------------------------------------------
function itemName(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Name"] then
		return List[Item]["Name"]
	end

	return "Deletado"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemType(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Type"] then
		return List[Item]["Type"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMO
-----------------------------------------------------------------------------------------------------------------------------------------
function itemAmmo(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Ammo"] then
		return List[Item]["Ammo"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemVehicle(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Vehicle"] then
		return List[Item]["Vehicle"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemWeight(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Weight"] then
		return List[Item]["Weight"]
	end

	return 0.0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMMAXAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemMaxAmount(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Max"] then
		return List[Item]["Max"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMSCAPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemScape(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Scape"] then
		return List[Item]["Scape"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDESCRIPTION
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDescription(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Description"] then
		return List[Item]["Description"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDurability(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Durability"] then
		return List[Item]["Durability"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMCHARGES
-----------------------------------------------------------------------------------------------------------------------------------------
function itemCharges(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Charges"] then
		return List[Item]["Charges"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMECONOMY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemEconomy(Item,Format)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Economy"] then
		return "$"..parseFormat(List[Item]["Economy"])
	end

	return "S/V"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function itemBlock(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Block"] then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMREPAIR
-----------------------------------------------------------------------------------------------------------------------------------------
function itemRepair(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Repair"] then
		return List[Item]["Repair"]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMUNIQUE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemUnique(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Unique"] then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKCLEAR
-----------------------------------------------------------------------------------------------------------------------------------------
function BlockClear(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Clear"] then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKDROPS
-----------------------------------------------------------------------------------------------------------------------------------------
function BlockDrops(Item)
	local Item = SplitOne(Item)
	if List[Item] and List[Item]["Drops"] then
		return true
	end

	return false
end