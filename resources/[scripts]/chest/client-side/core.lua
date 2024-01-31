-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {
	{ ["Name"] = "Policia", ["Coords"] = vec3(607.31,5.56,88.2), ["Mode"] = "1" },
	{ ["Name"] = "Policia", ["Coords"] = vec3(604.36,4.39,88.2), ["Mode"] = "1" },
	{ ["Name"] = "Policia", ["Coords"] = vec3(604.36,2.17,88.27), ["Mode"] = "1" },
	{ ["Name"] = "Policia", ["Coords"] = vec3(605.85,1.62,88.29), ["Mode"] = "1" },
	{ ["Name"] = "Paramedico", ["Coords"] = vec3(1135.85,-1542.54,34.76), ["Mode"] = "2" },
	{ ["Name"] = "Paramedico", ["Coords"] = vec3(-258.00,6332.62,32.72), ["Mode"] = "2" },
	-- { ["Name"] = "Burgershot", ["Coords"] = vec3(-1184.07,-900.95,14.03), ["Mode"] = "2" },
	{ ["Name"] = "Burgershot", ["Coords"] = vec3(-1203.11,-895.47,13.99), ["Mode"] = "2" },
	{ ["Name"] = "UwuCoffee", ["Coords"] = vec3(-583.9,-1050.85,21.91), ["Mode"] = "2" },
	{ ["Name"] = "Ballas", ["Coords"] = vec3(93.93,-1983.03,20.41), ["Mode"] = "2" },
	{ ["Name"] = "Families", ["Coords"] = vec3(-162.76,-1637.86,37.21), ["Mode"] = "2" },
	{ ["Name"] = "Vagos", ["Coords"] = vec3(385.46,-2031.66,23.05), ["Mode"] = "2" },
	{ ["Name"] = "Aztecas", ["Coords"] = vec3(513.13,-1802.96,28.46), ["Mode"] = "2" },
	{ ["Name"] = "Bloods", ["Coords"] = vec3(232.01,-1760.81,28.65), ["Mode"] = "2" },
	{ ["Name"] = "DaNangBoys", ["Coords"] = vec3(-897.82,-1516.87,4.96), ["Mode"] = "2" },
	{ ["Name"] = "Leone", ["Coords"] = vec3(500.73,-1340.35,29.25), ["Mode"] = "2" },
	{ ["Name"] = "ONeilBrothers", ["Coords"] = vec3(-1333.89,-937.52,11.3), ["Mode"] = "2" },
	{ ["Name"] = "Rednecks", ["Coords"] = vec3(-1564.28,-233.24,49.41), ["Mode"] = "2" },
	{ ["Name"] = "Triads", ["Coords"] = vec3(-994.47,-1003.59,2.1), ["Mode"] = "2" },
	-- { ["Name"] = "BurgershotTray01", ["Coords"] = vec3(-1188.49,-894.29,13.95), ["Mode"] = "3" },
	-- { ["Name"] = "BurgershotTray02", ["Coords"] = vec3(-1189.55,-895.0,13.95), ["Mode"] = "3" },
	-- { ["Name"] = "BurgershotTray03", ["Coords"] = vec3(-1191.14,-896.07,13.95), ["Mode"] = "3" },
	-- { ["Name"] = "BurgershotTray04", ["Coords"] = vec3(-1193.95,-905.4,13.78), ["Mode"] = "3" },
	{ ["Name"] = "BurgershotTray01", ["Coords"] = vec3(-1195.20,-893.13,14.41), ["Mode"] = "3" },
	{ ["Name"] = "UwuCoffeeTray01", ["Coords"] = vec3(-586.56,-1062.94,22.42), ["Mode"] = "3" },
	{ ["Name"] = "UwuCoffeeTray02", ["Coords"] = vec3(-584.03,-1062.03,22.42), ["Mode"] = "3" },
	{ ["Name"] = "UwuCoffeeTray03", ["Coords"] = vec3(-583.99,-1059.27,22.42), ["Mode"] = "3" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Compartimento Geral",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Open",
			label = "Compartimento Pessoal",
			tunnel = "shop",
			service = "Personal"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		}
	},
	["3"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Tray"
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],1.0,{
			name = "Chest:"..Name,
			heading = 0.0,
			useZ = true
		},{
			Distance = 1.35,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Open")
AddEventHandler("chest:Open",function(Name,Init,Item)
	if vSERVER.Permissions(Name,Init,Item) and GetEntityHealth(PlayerPedId()) > 100 then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open" })
		TriggerEvent("sounds:Private","chest",0.35)

		if Init ~= "Item" then
			vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	vRP.Destroy()

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	if MumbleIsConnected() and not exports["hud"]:Wanted() then
		vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Update(Data["slot"],Data["target"],Data["amount"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,InvPeso,InvMaxPeso,ChestPeso,ChestMaxPeso,Slots = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = InvPeso, invMaxpeso = InvMaxPeso, chestPeso = ChestPeso, chestMaxpeso = ChestMaxPeso, Slots = Slots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Close")
AddEventHandler("chest:Close",function(Action)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	vRP.Destroy()
end)